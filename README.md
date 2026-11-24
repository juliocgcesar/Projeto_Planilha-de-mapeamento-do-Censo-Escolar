# Planilha de Mapeamento e Modelo Estrela — Censo Escolar 2020 (Sergipe)

Projeto desenvolvido para a disciplina **Laboratório de Banco de Dados** (Curso de Ciência da Computação — Universidade Tiradentes), referente ao **Tema 4: Planilha de mapeamento do Censo Escolar**.

- **Autor:** Júlio César Conceição Gonzaga
- **Orientador:** Prof. Sérgio Roberto Santos Santana

---

## Sobre o Projeto

Os microdados públicos do Censo Escolar disponibilizados pelo **INEP** reúnem informações detalhadas sobre infraestrutura, docentes e matrículas da educação básica, mas são distribuídos em tabelas planas extensas com variáveis codificadas numericamente e campos ausentes em escolas inativas.

Este repositório reúne a documentação e os scripts de um processo **ETL (Extração, Transformação e Carga)** aplicado aos microdados da edição de **2020** para o estado de **Sergipe (`SG_UF = SE`)**, estruturando os dados em um modelo dimensional do tipo **esquema estrela** e validando as regras de limpeza em uma amostra controlada de **100 escolas**.

---

## Estrutura do Repositório

| Arquivo / Pasta | Descrição |
| :--- | :--- |
| `dicionário/` | Dicionário oficial de variáveis da Educação Básica (INEP) utilizado para validar tipos de dados e domínios codificados. |
| `modelo estrela censo.xlsx` | Planilha de mapeamento origem-destino (*de-para*) com as regras de limpeza, tipagem e conversão de códigos. |
| `modelo_estrela_censo.sql` | Script SQL (DDL) com a estrutura física da tabela fato e das três tabelas dimensão. |
| `modelo_estrela.png` | Diagrama de relacionamento do esquema estrela implementado. |
| `processar_censo.py` | Script em Python para leitura dos microdados brutos do INEP, filtragem para Sergipe e separação da amostra de 100 escolas. |
| `modelo_estrela.py` | Script em Python para transformação dos domínios, tratamento de nulos estruturais, geração das chaves substitutas e auditoria. |
| `auditoria_censo_2020.xlsx` | Planilha de auditoria gerada pelo script confrontando os 100 registros brutos com os dados tratados. |

---

## Arquitetura do Modelo Estrela

O Data Warehouse foi modelado com **1 tabela fato** e **3 tabelas dimensão**, desacopladas das chaves naturais por meio de chaves substitutas inteiras (`sk_*`):

- **`Fato_Censo_Escolar`**: armazena o ano do censo (`nu_ano_censo`), as chaves estrangeiras das dimensões e as métricas quantitativas (`qt_matriculas_bas`, `qt_matriculas_prof`, `qt_docentes_bas` e `qt_turmas_bas`).
- **`Dim_Escola`** (`sk_escola`): identificação cadastral (`co_entidade`, `no_entidade`), dependência administrativa, situação de funcionamento e categoria da escola privada.
- **`Dim_Localizacao`** (`sk_localizacao`): código e nome do município (IBGE), unidade federativa (`SE`), região geográfica e zona de localização (Urbana ou Rural).
- **`Dim_Infraestrutura`** (`sk_infraestrutura`): indicadores de disponibilidade de água potável, energia elétrica, esgotamento sanitário, biblioteca, laboratório de informática e acesso à internet.

---

## Resumo da Auditoria (Amostra de 100 Escolas)

Para testar o comportamento das regras de transformação em diferentes cenários cadastrais, foi auditada uma amostra estratificada de 100 instituições de ensino sergipanas:

| Categoria de Auditoria | Quantidade | Percentual |
| :--- | :---: | :---: |
| Escolas em atividade convertidas sem ressalvas | 75 | 75,0% |
| Escolas paralisadas com nulos estruturais tratados | 24 | 24,0% |
| Escolas extintas com nulos estruturais tratados | 1 | 1,0% |
| **Total Auditado** | **100** | **100,0%** |

---

## Como Executar

1. **Pré-requisitos:** Python 3.10+ com as bibliotecas `pandas` e `openpyxl` instaladas:
   ```bash
   pip install pandas openpyxl
   ```
2. **Fonte de dados:** Baixe o pacote oficial dos *Microdados da Educação Básica 2020* no portal do INEP e posicione o arquivo `microdados_ed_basica_2020.csv` na pasta configurada nos scripts.
3. **Execução do pipeline:**
   ```bash
   python processar_censo.py
   python modelo_estrela.py
   ```