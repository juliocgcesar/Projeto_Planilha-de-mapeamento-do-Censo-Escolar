# Planilha de Mapeamento e Modelo Estrela — Censo Escolar 2020 (Sergipe)

Projeto desenvolvido para a disciplina **Laboratório de Banco de Dados** (Curso de Ciência da Computação — Universidade Tiradentes), referente ao **Tema 4: Planilha de mapeamento do Censo Escolar**.

- **Autor:** Júlio César Conceição Gonzaga
- **Orientador:** Prof. Sérgio Roberto Santos Santana

---

## Sobre o Projeto

Os microdados públicos do Censo Escolar disponibilizados pelo **INEP** reúnem informações detalhadas sobre infraestrutura, docentes e matrículas da educação básica, mas são distribuídos em tabelas planas extensas com variáveis codificadas numericamente e campos ausentes em escolas inativas.

Este repositório reúne a documentação e os scripts de um processo **ETL (Extração, Transformação e Carga)** aplicado aos microdados da edição de **2020** para a base integral do estado de **Sergipe (`SG_UF = SE`)**, abrangendo todas as **2.551 escolas distribuídas pelos 75 municípios sergipanos**, estruturando os dados em um modelo dimensional do tipo **esquema estrela** e auditando 100% dos registros carregados.

---

## Estrutura do Repositório

| Arquivo / Pasta | Descrição |
| :--- | :--- |
| `dicionário/` | Dicionário oficial de variáveis da Educação Básica (INEP) utilizado para validar tipos de dados e domínios codificados. |
| `modelo estrela censo.xlsx` | Planilha de mapeamento origem-destino (*de-para*) com as regras de limpeza, tipagem e conversão de códigos. |
| `modelo_estrela_censo.sql` | Script SQL (DDL e `INSERT`) com a estrutura física e a carga completa da tabela fato e das três tabelas dimensão. |
| `modelo_estrela.png` | Diagrama de relacionamento do esquema estrela implementado. |
| `processar_censo.py` | Script em Python para leitura dos microdados brutos do INEP, filtragem estadual integral para Sergipe (75 municípios), conversão de domínios e auditoria. |
| `modelo_estrela.py` | Script em Python para deduplicação das dimensões, geração das chaves substitutas (`sk_*`) e exportação das tabelas do esquema estrela em `.xlsx` e `.sql`. |
| `auditoria_censo_2020.xlsx` | Planilha de auditoria gerada pelo script confrontando os 2.551 registros brutos com os dados tratados e indicadores consolidados. |
| `modelo_estrela_censo.xlsx` | Pasta de trabalho com as abas populadas do modelo dimensional (`Fato_Censo_Escolar`, `Dim_Escola`, `Dim_Localizacao` e `Dim_Infraestrutura`). |

---

## Arquitetura do Modelo Estrela

O Data Warehouse foi modelado com **1 tabela fato** e **3 tabelas dimensão**, desacopladas das chaves naturais por meio de chaves substitutas inteiras (`sk_*`):

- **`Fato_Censo_Escolar`** (**2.551 linhas**): armazena o ano do censo (`nu_ano_censo`), as chaves estrangeiras das dimensões e as métricas quantitativas (`qt_matriculas_bas`, `qt_matriculas_prof`, `qt_docentes_bas` e `qt_turmas_bas`).
- **`Dim_Escola`** (`sk_escola` — **2.551 linhas**): identificação cadastral (`co_entidade`, `no_entidade`), dependência administrativa, situação de funcionamento e categoria da escola privada.
- **`Dim_Localizacao`** (`sk_localizacao` — **149 linhas**): código e nome do município (IBGE) cobrindo todos os **75 municípios de Sergipe**, unidade federativa (`SE`), região geográfica e zona de localização (Urbana ou Rural).
- **`Dim_Infraestrutura`** (`sk_infraestrutura` — **24 linhas**): perfis únicos de disponibilidade de água potável, energia elétrica, esgotamento sanitário, biblioteca, laboratório de informática e acesso à internet.

---

## Resumo da Auditoria (Base Integral de Sergipe — 75 Municípios)

Para validar a integridade das regras de transformação em toda a rede estadual antes da carga no Data Warehouse, foram auditadas todas as **2.551 instituições de ensino** dos 75 municípios de Sergipe:

| Situação / Categoria de Auditoria | Quantidade | Percentual |
| :--- | :---: | :---: |
| Escolas em atividade convertidas sem ressalvas | 2.085 | 81,7% |
| Escolas paralisadas tratadas na carga | 428 | 16,8% |
| Escolas extintas tratadas na carga | 38 | 1,5% |
| **Total Auditado (Base Integral SE — 75 municípios)** | **2.551** | **100,0%** |

---

## Como Executar

1. **Pré-requisitos:** Python 3.10+ com as bibliotecas `pandas` e `openpyxl` instaladas:
   ```bash
   pip install pandas openpyxl