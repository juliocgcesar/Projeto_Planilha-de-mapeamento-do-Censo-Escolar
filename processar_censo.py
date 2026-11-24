#Codigo Utilizado para fazer a criação de uma tabela contendo os Dados filtrados apenas de Sergipe
from pathlib import Path
import pandas as pd
from openpyxl.chart import BarChart, Reference
from openpyxl.styles import Alignment, Border, Font, PatternFill, Side
from openpyxl.utils import get_column_letter

raiz = Path(".")
arq_escolas = next(raiz.rglob("microdados_ed_basica_2020.csv"), None)
arq_dicionario = next(raiz.rglob("*dicionario*.xlsx"), None)

if not arq_escolas:
    raise FileNotFoundError("Arquivo 'microdados_ed_basica_2020.csv' não encontrado na pasta.")

colunas_desejadas = {
    "NU_ANO_CENSO", "CO_ENTIDADE", "NO_ENTIDADE", "TP_DEPENDENCIA",
    "TP_SITUACAO_FUNCIONAMENTO", "TP_CATEGORIA_ESCOLA_PRIVADA",
    "CO_MUNICIPIO", "NO_MUNICIPIO", "SG_UF", "CO_REGIAO", "TP_LOCALIZACAO",
    "IN_AGUA_POTAVEL", "IN_ENERGIA_REDE_PUBLICA", "IN_ESGOTO_REDE_PUBLICA",
    "IN_BIBLIOTECA", "IN_LABORATORIO_INFORMATICA", "IN_INTERNET",
    "QT_MAT_BAS", "QT_MAT_PROF", "QT_DOC_BAS", "QT_TUR_BAS"
}

df_esc = pd.read_csv(
    arq_escolas, sep=";", encoding="latin1",
    usecols=lambda c: c.upper() in colunas_desejadas, low_memory=False
)
df_esc.columns = df_esc.columns.str.upper()

df_aux_municipios = (
    df_esc[["CO_MUNICIPIO", "NO_MUNICIPIO", "SG_UF", "CO_REGIAO"]]
    .dropna(subset=["CO_MUNICIPIO"])
    .drop_duplicates(subset=["CO_MUNICIPIO"])
    .copy()
)

df_uf = df_esc[df_esc["SG_UF"] == "SE"].copy()

ativas = df_uf[df_uf["TP_SITUACAO_FUNCIONAMENTO"] == 1].head(75)
inativas = df_uf[df_uf["TP_SITUACAO_FUNCIONAMENTO"] != 1].head(25)
amostra = pd.concat([ativas, inativas], ignore_index=True)

def mapear_dominio(serie, mapa, padrao="Não informado"):
    return pd.to_numeric(serie, errors="coerce").map(mapa).fillna(padrao)

def mapear_flag(serie):
    return mapear_dominio(serie, {0: "Não", 1: "Sim", 9: "Não informado"}, "Não informado")

tratada = pd.DataFrame()
tratada["Código INEP"] = amostra["CO_ENTIDADE"].astype(int)
tratada["Nome da Escola"] = amostra["NO_ENTIDADE"].astype(str).str.strip().str.upper()
tratada["Rede de Ensino"] = mapear_dominio(
    amostra["TP_DEPENDENCIA"], {1: "Federal", 2: "Estadual", 3: "Municipal", 4: "Privada"}
)
tratada["Situação de Funcionamento"] = mapear_dominio(
    amostra["TP_SITUACAO_FUNCIONAMENTO"], {1: "Em atividade", 2: "Paralisada", 3: "Extinta"}
)
tratada["Categoria Privada"] = mapear_dominio(
    amostra["TP_CATEGORIA_ESCOLA_PRIVADA"],
    {1: "Particular", 2: "Comunitária", 3: "Confessional", 4: "Filantrópica"},
    "Não se aplica"
)

amostra_geo = amostra[["CO_MUNICIPIO", "TP_LOCALIZACAO"]].merge(
    df_aux_municipios, on="CO_MUNICIPIO", how="left"
)
tratada["Código IBGE"] = amostra_geo["CO_MUNICIPIO"].astype(int)
tratada["Município"] = amostra_geo["NO_MUNICIPIO"].astype(str).str.strip()
tratada["UF"] = amostra_geo["SG_UF"].astype(str).str.strip()
tratada["Região"] = mapear_dominio(
    amostra_geo["CO_REGIAO"], {1: "Norte", 2: "Nordeste", 3: "Sudeste", 4: "Sul", 5: "Centro-Oeste"}
)
tratada["Localização"] = mapear_dominio(
    amostra_geo["TP_LOCALIZACAO"], {1: "Urbana", 2: "Rural"}
)

for col_orig, col_dest in [
    ("IN_AGUA_POTAVEL", "Água Potável"),
    ("IN_ENERGIA_REDE_PUBLICA", "Energia Pública"),
    ("IN_ESGOTO_REDE_PUBLICA", "Esgoto Público"),
    ("IN_BIBLIOTECA", "Biblioteca"),
    ("IN_LABORATORIO_INFORMATICA", "Lab. Informática"),
    ("IN_INTERNET", "Acesso à Internet"),
]:
    tratada[col_dest] = mapear_flag(amostra[col_orig])

tratada["Ano Censo"] = amostra["NU_ANO_CENSO"].astype(int)
tratada["Matrículas (Básica)"] = pd.to_numeric(amostra["QT_MAT_BAS"], errors="coerce").fillna(0).astype(int)
col_prof = amostra["QT_MAT_PROF"] if "QT_MAT_PROF" in amostra.columns else 0
tratada["Matrículas (Profissional)"] = pd.to_numeric(col_prof, errors="coerce").fillna(0).astype(int)
tratada["Docentes"] = pd.to_numeric(amostra["QT_DOC_BAS"], errors="coerce").fillna(0).astype(int)
tratada["Turmas"] = pd.to_numeric(amostra["QT_TUR_BAS"], errors="coerce").fillna(0).astype(int)

cols_infra = [
    "IN_AGUA_POTAVEL", "IN_ENERGIA_REDE_PUBLICA", "IN_ESGOTO_REDE_PUBLICA",
    "IN_BIBLIOTECA", "IN_LABORATORIO_INFORMATICA", "IN_INTERNET"
]

def classificar_auditoria(idx):
    linha_bruta = amostra.loc[idx]
    if linha_bruta["TP_SITUACAO_FUNCIONAMENTO"] != 1 and linha_bruta[cols_infra].isna().any():
        return "Nulos estruturais (escola paralisada/extinta)"
    if (linha_bruta[cols_infra] == 9).any():
        return "Código 9 (Não informado) convertido"
    if str(linha_bruta["NO_ENTIDADE"]) != str(linha_bruta["NO_ENTIDADE"]).strip():
        return "Espaçamento irregular corrigido no nome"
    return "Convertido integralmente sem ressalvas"

auditoria = pd.Series([classificar_auditoria(i) for i in amostra.index])
resumo_auditoria = (
    auditoria.value_counts()
    .rename_axis("Categoria de Auditoria")
    .reset_index(name="Quantidade")
)
resumo_auditoria["Percentual"] = resumo_auditoria["Quantidade"] / len(tratada)

status_estado = mapear_dominio(
    df_uf["TP_SITUACAO_FUNCIONAMENTO"], {1: "Em atividade", 2: "Paralisada", 3: "Extinta"}
).value_counts()

saida = "auditoria_censo_2020.xlsx"
with pd.ExcelWriter(saida, engine="openpyxl") as writer:
    # startrow=1 reserva a linha 1 para o título explicativo da aba
    amostra.to_excel(writer, sheet_name="1_Amostra_Bruta_100", index=False, startrow=1)
    tratada.to_excel(writer, sheet_name="2_Amostra_Tratada_100", index=False, startrow=1)

    wb = writer.book
    ws_bruta = wb["1_Amostra_Bruta_100"]
    ws_trat = wb["2_Amostra_Tratada_100"]
    ws_res = wb.create_sheet(title="3_Resumo_e_Indicadores")

    fill_banner = PatternFill("solid", fgColor="1B365D")
    fill_header = PatternFill("solid", fgColor="2C5282")
    fill_zebra = PatternFill("solid", fgColor="F7FAFC")
    fill_total = PatternFill("solid", fgColor="EDF2F7")
    fill_ativa = PatternFill("solid", fgColor="E6F4EA")
    fill_paralisada = PatternFill("solid", fgColor="FEF7E0")
    fill_extinta = PatternFill("solid", fgColor="FCE8E6")

    font_banner = Font(name="Calibri", size=12, bold=True, color="FFFFFF")
    font_header = Font(name="Calibri", size=10, bold=True, color="FFFFFF")
    font_corpo = Font(name="Calibri", size=10, color="1A202C")
    font_bold = Font(name="Calibri", size=10, bold=True, color="1A202C")

    borda_suave = Side(border_style="thin", color="CBD5E0")
    borda_media = Side(border_style="medium", color="2C5282")
    border_grid = Border(left=borda_suave, right=borda_suave, top=borda_suave, bottom=borda_suave)
    border_total = Border(top=borda_suave, bottom=borda_media, left=borda_suave, right=borda_suave)

    titulos_abas = {
        "1_Amostra_Bruta_100": "DADOS BRUTOS EXTRAÍDOS DO INEP — AMOSTRA DE 100 ESCOLAS (CENSO ESCOLAR 2020 - SE)",
        "2_Amostra_Tratada_100": "DADOS TRATADOS E PADRONIZADOS PARA O MODELO ESTRELA — AMOSTRA DE 100 ESCOLAS (SE)",
    }

    for ws in [ws_bruta, ws_trat]:
        max_col = ws.max_column
        max_row = ws.max_row

        ws.merge_cells(start_row=1, start_column=1, end_row=1, end_column=max_col)
        c_top = ws.cell(row=1, column=1, value=titulos_abas[ws.title])
        c_top.fill = fill_banner
        c_top.font = font_banner
        c_top.alignment = Alignment(horizontal="left", vertical="center", indent=1)
        ws.row_dimensions[1].height = 28

        # Cabeçalho das colunas (Linha 2)
        ws.row_dimensions[2].height = 30
        for col_idx in range(1, max_col + 1):
            cell = ws.cell(row=2, column=col_idx)
            cell.fill = fill_header
            cell.font = font_header
            cell.alignment = Alignment(horizontal="center", vertical="center", wrap_text=True)
            cell.border = border_grid

        # Linhas de dados (Linhas 3 a 102)
        for r in range(3, max_row + 1):
            ws.row_dimensions[r].height = 20
            for c in range(1, max_col + 1):
                cell = ws.cell(row=r, column=c)
                cell.font = font_corpo
                cell.border = border_grid
                if r % 2 == 0:
                    cell.fill = fill_zebra

                if ws.title == "2_Amostra_Tratada_100" and c in (2, 7):
                    cell.alignment = Alignment(horizontal="left", vertical="center")
                else:
                    cell.alignment = Alignment(horizontal="center", vertical="center")

                # Destaque visual na coluna "Situação de Funcionamento" (Coluna D = 4)
                if ws.title == "2_Amostra_Tratada_100" and c == 4:
                    val = str(cell.value)
                    if val == "Em atividade":
                        cell.fill = fill_ativa
                    elif val == "Paralisada":
                        cell.fill = fill_paralisada
                    elif val == "Extinta":
                        cell.fill = fill_extinta

        ws.freeze_panes = "A3"
        ws.auto_filter.ref = f"A2:{get_column_letter(max_col)}{max_row}"

    row_base = 104
    ws_trat.merge_cells(start_row=row_base, start_column=2, end_row=row_base, end_column=4)
    c_rod = ws_trat.cell(row=row_base, column=2, value="RESUMO DE FUNCIONAMENTO DAS ESCOLAS (AMOSTRA)")
    c_rod.fill = fill_header
    c_rod.font = font_header
    c_rod.alignment = Alignment(horizontal="center", vertical="center")
    ws_trat.row_dimensions[row_base].height = 24

    linhas_rodape = [
        ("Escolas Em Atividade (Ativas)", '=COUNTIF(D3:D102,"Em atividade")', "=C105/$C$109", fill_ativa),
        ("Escolas Paralisadas (Atividades Suspensas)", '=COUNTIF(D3:D102,"Paralisada")', "=C106/$C$109", fill_paralisada),
        ("Escolas Extintas (Encerradas / Abandonadas)", '=COUNTIF(D3:D102,"Extinta")', "=C107/$C$109", fill_extinta),
        ("Subtotal Inativas (Paralisadas + Extintas)", "=C106+C107", "=D106+D107", fill_zebra),
        ("Total Geral da Amostra", "=C105+C108", "=D105+D108", fill_total),
    ]

    for idx, (rotulo, form_qtd, form_pct, preenchimento) in enumerate(linhas_rodape, start=row_base + 1):
        ws_trat.row_dimensions[idx].height = 21
        is_total = "Total" in rotulo or "Subtotal" in rotulo
        fonte_atual = font_bold if is_total else font_corpo
        borda_atual = border_total if "Total" in rotulo else border_grid

        c_lbl = ws_trat.cell(row=idx, column=2, value=rotulo)
        c_qtd = ws_trat.cell(row=idx, column=3, value=form_qtd)
        c_pct = ws_trat.cell(row=idx, column=4, value=form_pct)

        for cel in (c_lbl, c_qtd, c_pct):
            cel.fill = preenchimento
            cel.font = fonte_atual
            cel.border = borda_atual

        c_lbl.alignment = Alignment(horizontal="left", vertical="center")
        c_qtd.alignment = Alignment(horizontal="center", vertical="center")
        c_qtd.number_format = "#,##0"
        c_pct.alignment = Alignment(horizontal="right", vertical="center")
        c_pct.number_format = "0.0%"

    ws_res.merge_cells("A1:E1")
    c_t3 = ws_res.cell(row=1, column=1, value="INDICADORES CONSOLIDADOS — CENSO ESCOLAR 2020 (SERGIPE)")
    c_t3.fill = fill_banner
    c_t3.font = font_banner
    c_t3.alignment = Alignment(horizontal="left", vertical="center", indent=1)
    ws_res.row_dimensions[1].height = 28

    headers_q1 = [
        "Situação de Funcionamento (INEP)",
        "Qtd. Amostra",
        "% Amostra",
        "Qtd. Estado (SE)",
        "% Estado (SE)",
    ]
    ws_res.row_dimensions[3].height = 26
    for col_i, h in enumerate(headers_q1, start=1):
        cel = ws_res.cell(row=3, column=col_i, value=h)
        cel.fill = fill_header
        cel.font = font_header
        cel.alignment = Alignment(horizontal="center", vertical="center")
        cel.border = border_grid

    status_ordem = [
        ("Em atividade", fill_ativa),
        ("Paralisada", fill_paralisada),
        ("Extinta", fill_extinta),
    ]
    for offset, (st_nome, cor_st) in enumerate(status_ordem, start=4):
        ws_res.row_dimensions[offset].height = 21
        qtd_am = int((tratada["Situação de Funcionamento"] == st_nome).sum())
        qtd_uf = int(status_estado.get(st_nome, 0))

        c1 = ws_res.cell(row=offset, column=1, value=st_nome)
        c2 = ws_res.cell(row=offset, column=2, value=qtd_am)
        c3 = ws_res.cell(row=offset, column=3, value=f"=B{offset}/$B$7")
        c4 = ws_res.cell(row=offset, column=4, value=qtd_uf)
        c5 = ws_res.cell(row=offset, column=5, value=f"=D{offset}/$D$7")

        for col_i, cel in enumerate((c1, c2, c3, c4, c5), start=1):
            cel.font = font_corpo
            cel.border = border_grid
            cel.fill = cor_st if col_i == 1 else PatternFill("solid", fgColor="FFFFFF")

        c1.alignment = Alignment(horizontal="left", vertical="center")
        c2.alignment = c4.alignment = Alignment(horizontal="center", vertical="center")
        c2.number_format = c4.number_format = "#,##0"
        c3.alignment = c5.alignment = Alignment(horizontal="right", vertical="center")
        c3.number_format = c5.number_format = "0.0%"

    ws_res.row_dimensions[7].height = 22
    tot_q1 = ["Total Geral", "=SUM(B4:B6)", "=SUM(C4:C6)", "=SUM(D4:D6)", "=SUM(E4:E6)"]
    for col_i, val in enumerate(tot_q1, start=1):
        cel = ws_res.cell(row=7, column=col_i, value=val)
        cel.font = font_bold
        cel.fill = fill_total
        cel.border = border_total
        if col_i == 1:
            cel.alignment = Alignment(horizontal="left", vertical="center")
        elif col_i in (2, 4):
            cel.alignment = Alignment(horizontal="center", vertical="center")
            cel.number_format = "#,##0"
        else:
            cel.alignment = Alignment(horizontal="right", vertical="center")
            cel.number_format = "0.0%"

    ws_res.row_dimensions[10].height = 26
    for col_i, h in enumerate(["Categoria de Auditoria (100 Linhas)", "Quantidade", "Percentual"], start=1):
        cel = ws_res.cell(row=10, column=col_i, value=h)
        cel.fill = fill_header
        cel.font = font_header
        cel.alignment = Alignment(horizontal="center", vertical="center")
        cel.border = border_grid

    linha_fim_q2 = 10 + len(resumo_auditoria)
    for idx_r, row_data in resumo_auditoria.iterrows():
        r_excel = 11 + idx_r
        ws_res.row_dimensions[r_excel].height = 21
        c1 = ws_res.cell(row=r_excel, column=1, value=row_data["Categoria de Auditoria"])
        c2 = ws_res.cell(row=r_excel, column=2, value=int(row_data["Quantidade"]))
        c3 = ws_res.cell(row=r_excel, column=3, value=f"=B{r_excel}/$B${linha_fim_q2 + 1}")
        for cel in (c1, c2, c3):
            cel.font = font_corpo
            cel.border = border_grid
        c1.alignment = Alignment(horizontal="left", vertical="center")
        c2.alignment = Alignment(horizontal="center", vertical="center")
        c2.number_format = "#,##0"
        c3.alignment = Alignment(horizontal="right", vertical="center")
        c3.number_format = "0.0%"

    r_tot_q2 = linha_fim_q2 + 1
    ws_res.row_dimensions[r_tot_q2].height = 22
    for col_i, val in enumerate(["Total Auditado", f"=SUM(B11:B{linha_fim_q2})", f"=SUM(C11:C{linha_fim_q2})"], start=1):
        cel = ws_res.cell(row=r_tot_q2, column=col_i, value=val)
        cel.font = font_bold
        cel.fill = fill_total
        cel.border = border_total
        cel.alignment = Alignment(horizontal="left" if col_i == 1 else ("center" if col_i == 2 else "right"), vertical="center")
        if col_i == 2:
            cel.number_format = "#,##0"
        elif col_i == 3:
            cel.number_format = "0.0%"

    grafico = BarChart()
    grafico.type = "col"
    grafico.style = 10
    grafico.title = "Situação das Escolas na Amostra (100 registros)"
    grafico.y_axis.title = "Nº de Escolas"
    grafico.legend = None
    dados_graf = Reference(ws_res, min_col=2, min_row=3, max_row=6)
    cats_graf = Reference(ws_res, min_col=1, min_row=4, max_row=6)
    grafico.add_data(dados_graf, titles_from_data=True)
    grafico.set_categories(cats_graf)
    grafico.width = 14
    grafico.height = 8
    ws_res.add_chart(grafico, "G3")

    for ws in wb.worksheets:
        ws.views.sheetView[0].showGridLines = True
        for col in ws.columns:
            col_letra = get_column_letter(col[0].column)
            comprimentos = [len(str(c.value or "")) for c in col if c.row >= 2 and not str(c.value or "").startswith("=")]
            maior = max(comprimentos) if comprimentos else 14
            ws.column_dimensions[col_letra].width = min(max(maior + 4, 15), 44)

print("\n=== RESUMO DE AUDITORIA (100 LINHAS) ===")
print(resumo_auditoria.to_string(index=False))
print(f"\nArquivo '{saida}' gerado com sucesso!")