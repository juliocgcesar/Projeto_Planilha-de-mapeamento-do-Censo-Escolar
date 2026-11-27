# Código para geração do Esquema Estrela e script SQL para todos os municípios de Sergipe
import pandas as pd

df = pd.read_excel(
    "auditoria_censo_2020.xlsx",
    sheet_name="2_Base_Tratada_SE",
    skiprows=1,
)

# Remove as linhas do quadro de resumo no rodapé da planilha
df = df[pd.to_numeric(df["Código INEP"], errors="coerce").notna()].copy()

cols_inteiras = [
    "Código INEP", "Código IBGE", "Ano Censo",
    "Matrículas (Básica)", "Matrículas (Profissional)", "Docentes", "Turmas"
]
for col in cols_inteiras:
    df[col] = df[col].astype(int)

cols_escola = [
    "Código INEP", "Nome da Escola", "Rede de Ensino",
    "Situação de Funcionamento", "Categoria Privada"
]
dim_escola = df[cols_escola].drop_duplicates().reset_index(drop=True)
dim_escola.insert(0, "sk_escola", dim_escola.index + 1)
dim_escola.columns = [
    "sk_escola", "co_entidade", "no_entidade", "ds_dependencia_adm",
    "ds_situacao_funcionamento", "ds_categoria_privada"
]

cols_loc = ["Código IBGE", "Município", "UF", "Região", "Localização"]
dim_localizacao = df[cols_loc].drop_duplicates().reset_index(drop=True)
dim_localizacao.insert(0, "sk_localizacao", dim_localizacao.index + 1)
dim_localizacao.columns = [
    "sk_localizacao", "co_municipio", "no_municipio", "sg_uf",
    "no_regiao_geografica", "ds_zona_localizacao"
]

cols_infra = [
    "Água Potável", "Energia Pública", "Esgoto Público",
    "Biblioteca", "Lab. Informática", "Acesso à Internet"
]
dim_infra = df[cols_infra].drop_duplicates().reset_index(drop=True)
dim_infra.insert(0, "sk_infraestrutura", dim_infra.index + 1)
dim_infra.columns = [
    "sk_infraestrutura", "ds_agua_potavel", "ds_energia_rede_publica",
    "ds_esgoto_rede_publica", "ds_biblioteca", "ds_lab_informatica",
    "ds_acesso_internet"
]

base_fato = df.rename(columns={
    "Código INEP": "co_entidade",
    "Nome da Escola": "no_entidade",
    "Rede de Ensino": "ds_dependencia_adm",
    "Situação de Funcionamento": "ds_situacao_funcionamento",
    "Categoria Privada": "ds_categoria_privada",
    "Código IBGE": "co_municipio",
    "Município": "no_municipio",
    "UF": "sg_uf",
    "Região": "no_regiao_geografica",
    "Localização": "ds_zona_localizacao",
    "Água Potável": "ds_agua_potavel",
    "Energia Pública": "ds_energia_rede_publica",
    "Esgoto Público": "ds_esgoto_rede_publica",
    "Biblioteca": "ds_biblioteca",
    "Lab. Informática": "ds_lab_informatica",
    "Acesso à Internet": "ds_acesso_internet",
    "Ano Censo": "nu_ano_censo",
    "Matrículas (Básica)": "qt_matriculas_bas",
    "Matrículas (Profissional)": "qt_matriculas_prof",
    "Docentes": "qt_docentes_bas",
    "Turmas": "qt_turmas_bas",
})

fato = (
    base_fato
    .merge(dim_escola, on=["co_entidade", "no_entidade", "ds_dependencia_adm", "ds_situacao_funcionamento", "ds_categoria_privada"])
    .merge(dim_localizacao, on=["co_municipio", "no_municipio", "sg_uf", "no_regiao_geografica", "ds_zona_localizacao"])
    .merge(dim_infra, on=["ds_agua_potavel", "ds_energia_rede_publica", "ds_esgoto_rede_publica", "ds_biblioteca", "ds_lab_informatica", "ds_acesso_internet"])
)

fato.insert(0, "sk_fato", fato.index + 1)
fato_censo = fato[[
    "sk_fato", "sk_escola", "sk_localizacao", "sk_infraestrutura",
    "nu_ano_censo", "qt_matriculas_bas", "qt_matriculas_prof",
    "qt_docentes_bas", "qt_turmas_bas"
]]

with pd.ExcelWriter("modelo_estrela_censo.xlsx", engine="openpyxl") as writer:
    fato_censo.to_excel(writer, sheet_name="Fato_Censo_Escolar", index=False)
    dim_escola.to_excel(writer, sheet_name="Dim_Escola", index=False)
    dim_localizacao.to_excel(writer, sheet_name="Dim_Localizacao", index=False)
    dim_infra.to_excel(writer, sheet_name="Dim_Infraestrutura", index=False)

ddl = """-- MODELO ESTRELA - CENSO ESCOLAR 2020 (INEP - BASE INTEGRAL SERGIPE)
CREATE TABLE Dim_Escola (
    sk_escola INTEGER PRIMARY KEY,
    co_entidade INTEGER NOT NULL,
    no_entidade VARCHAR(150) NOT NULL,
    ds_dependencia_adm VARCHAR(20),
    ds_situacao_funcionamento VARCHAR(25),
    ds_categoria_privada VARCHAR(30)
);

CREATE TABLE Dim_Localizacao (
    sk_localizacao INTEGER PRIMARY KEY,
    co_municipio INTEGER NOT NULL,
    no_municipio VARCHAR(100) NOT NULL,
    sg_uf CHAR(2),
    no_regiao_geografica VARCHAR(20),
    ds_zona_localizacao VARCHAR(15)
);

CREATE TABLE Dim_Infraestrutura (
    sk_infraestrutura INTEGER PRIMARY KEY,
    ds_agua_potavel VARCHAR(15),
    ds_energia_rede_publica VARCHAR(15),
    ds_esgoto_rede_publica VARCHAR(15),
    ds_biblioteca VARCHAR(15),
    ds_lab_informatica VARCHAR(15),
    ds_acesso_internet VARCHAR(15)
);

CREATE TABLE Fato_Censo_Escolar (
    sk_fato INTEGER PRIMARY KEY,
    sk_escola INTEGER NOT NULL REFERENCES Dim_Escola(sk_escola),
    sk_localizacao INTEGER NOT NULL REFERENCES Dim_Localizacao(sk_localizacao),
    sk_infraestrutura INTEGER NOT NULL REFERENCES Dim_Infraestrutura(sk_infraestrutura),
    nu_ano_censo SMALLINT NOT NULL,
    qt_matriculas_bas INTEGER,
    qt_matriculas_prof INTEGER,
    qt_docentes_bas INTEGER,
    qt_turmas_bas INTEGER
);
"""

def gerar_inserts(tabela, dataframe):
    linhas = []
    cols = ", ".join(dataframe.columns)
    for _, row in dataframe.iterrows():
        vals = []
        for v in row:
            if pd.notna(v) and isinstance(v, (int, float)):
                vals.append(str(int(v)))
            else:
                texto = str(v).replace("'", "''")
                vals.append(f"'{texto}'")
        linhas.append(f"INSERT INTO {tabela} ({cols}) VALUES ({', '.join(vals)});")
    return "\n".join(linhas)

with open("modelo_estrela_censo.sql", "w", encoding="utf-8") as f:
    f.write(ddl + "\n")
    f.write(gerar_inserts("Dim_Escola", dim_escola) + "\n\n")
    f.write(gerar_inserts("Dim_Localizacao", dim_localizacao) + "\n\n")
    f.write(gerar_inserts("Dim_Infraestrutura", dim_infra) + "\n\n")
    f.write(gerar_inserts("Fato_Censo_Escolar", fato_censo) + "\n")

print("Modelo Estrela gerado com sucesso!")
print(f"- Fato_Censo_Escolar: {len(fato_censo)} linhas")
print(f"- Dim_Escola: {len(dim_escola)} linhas")
print(f"- Dim_Localizacao: {len(dim_localizacao)} linhas ({dim_localizacao['co_municipio'].nunique()} municípios)")
print(f"- Dim_Infraestrutura: {len(dim_infra)} linhas")