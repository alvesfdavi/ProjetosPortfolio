# Dashboard de Conciliação Financeira

Projeto end-to-end de análise de conciliação financeira, cobrindo desde a ingestão e transformação de dados no Databricks até a visualização no Power BI.

## Visão geral

Conciliação financeira é um dos processos mais críticos de qualquer empresa — e um dos mais feitos manualmente. Este projeto automatiza o ciclo completo: da fonte de dados bruta ao dashboard interativo publicado.

## Arquitetura

![Arquitetura](assets/arquitetura.png)

## Stack

- **Databricks Free Edition** — pipeline de dados com arquitetura Medallion
- **PySpark** — transformações e lógica de negócio
- **Delta Lake** — armazenamento das tabelas Bronze, Silver e Gold
- **Power BI** — modelagem, DAX e dashboard
- **DAX** — medidas de negócio e visuais em HTML
- **HTML** — 6 visuais customizados dentro do Power BI

## Pipeline Databricks

| Camada | Notebook | Responsabilidade |
|---|---|---|
| Bronze | 01_bronze_ingestao | Ingestão dos CSVs brutos como Delta Tables |
| Silver | 02_silver_limpeza | Limpeza, tipagem e padronização |
| Gold | 03_gold_conciliacao_aging | Conciliação, saldo e aging em 7 faixas |

## Dashboard Power BI

3 páginas interativas com navegação, filtros cruzados e formatação condicional:

- **Visão Geral** — KPIs, evolução mensal e lançamentos recentes
- **Divergências** — ranking de fornecedores, canais e previsto vs realizado
- **Aging** — distribuição por faixa e top fornecedores com pendência

🔗 [Acessar dashboard](https://app.powerbi.com/view?r=eyJrIjoiNDE0NGUxYjQtMWZjYy00NTRmLTg4ZGUtNTEwYjkwNTNmYjU5IiwidCI6IjY0Y2Q5ODVhLTliM2ItNDA3MC04MTI5LTEyNzJiZmI1YTlmNyJ9)

## Estrutura do repositório
