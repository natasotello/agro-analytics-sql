# 🌱 Agro Analytics SQL

Projeto de Análise de Dados voltado para o setor agrícola, desenvolvido em SQL Server com o objetivo de simular cenários reais do agronegócio e gerar informações para apoio à tomada de decisão.

## 📌 Objetivo

Este projeto foi desenvolvido para praticar modelagem de dados, consultas SQL e análise de indicadores de negócio aplicados ao agronegócio.

O banco de dados simula operações de produtores rurais, fazendas, culturas agrícolas, safras, produção, vendas, clima, máquinas e funcionários.

O foco é transformar dados em informações úteis para análise e tomada de decisão.

---

## 🛠 Tecnologias Utilizadas

* SQL Server
* SQL Server Management Studio (SSMS)
* Git
* GitHub

---

## 🗄 Modelo de Dados

O banco de dados foi estruturado para representar diferentes áreas do agronegócio:

* Produtores
* Fazendas
* Culturas
* Safras
* Produção
* Vendas
* Máquinas
* Funcionários
* Dados climáticos

---

## 📂 Estrutura do Projeto

```text
agro-analytics-sql
│
├── database
│   ├── create_database.sql
│   ├── create_tables.sql
│   └── insert_data.sql
│
├── queries
│   ├── 01_select_basicos.sql
│   ├── 02_funcoes_agregacao.sql
│   ├── 03_joins.sql
│   ├── 04_having.sql
│   ├── 05_metricas_financeiras.sql
│   ├── 06_ctes.sql
│   ├── 07_window_functions.sql
│   └── 08_views.sql
│
├── docs
│   └── business_insights.md
│
└── README.md
```

---

## 📊 Análises Desenvolvidas

### Consultas Básicas

* SELECT
* WHERE
* ORDER BY
* DISTINCT
* TOP

### Funções de Agregação

* COUNT()
* SUM()
* AVG()
* MAX()
* MIN()

### Joins

* INNER JOIN

### Agrupamentos

* GROUP BY
* HAVING

### Métricas de Negócio

* Receita por fazenda
* Faturamento por produtor
* ROI
* Lucro bruto
* Produtividade média
* Receita por cultura
* Investimento em máquinas

### CTEs (Common Table Expressions)

* Receita por fazenda
* Faturamento por produtor
* Produção por cultura
* Custo por fazenda
* Investimento em máquinas
* Top compradores

### Window Functions

* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* SUM() OVER()
* AVG() OVER()

### Views

* vw_Faturamento_Produtores
* vw_Receita_Fazendas
* vw_Producao_Culturas
* vw_Investimento_Maquinas
* vw_Desempenho_Fazendas

---

## 📈 Insights de Negócio

As análises permitem identificar:

* Fazendas com maior faturamento.
* Culturas mais rentáveis.
* Produtores com maior receita.
* Fazendas com maior ROI.
* Clientes que mais movimentam recursos.
* Investimentos em máquinas por fazenda.
* Indicadores climáticos relacionados à produção.
* Produtividade média das fazendas.

---

## 🎯 Objetivo Profissional

Este projeto faz parte do meu portfólio na área de Dados e foi desenvolvido com o objetivo de consolidar conhecimentos em SQL, modelagem de dados e análise de indicadores aplicados ao agronegócio.

Estou em constante aprendizado e buscando evoluir para atuar profissionalmente com Análise de Dados e Ciência de Dados.

## 🚀 Próximos Passos

Este projeto continuará sendo expandido conforme avanço nos estudos em Dados. Algumas melhorias planejadas são:

* Desenvolver dashboards interativos em Power BI para visualização dos indicadores agrícolas.
* Criar análises exploratórias em Python utilizando Pandas e Matplotlib.
* Automatizar processos de tratamento e transformação dos dados.
* Implementar consultas mais avançadas e novas métricas de negócio.
* Expandir o banco de dados com novos cenários relacionados ao agronegócio.
* Adicionar diagramas e documentações complementares.
* Aplicar conceitos de Engenharia de Dados e ETL em versões futuras do projeto.

> Este projeto faz parte da minha evolução na área de Dados e continuará sendo aprimorado à medida que desenvolvo novos conhecimentos e habilidades.
