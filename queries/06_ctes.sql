-- Faturamento por produtor
WITH faturamento_produtor AS (
    SELECT
        pt.id_produtor,
        pt.nome_produtor,
        SUM(vd.valor_total) AS faturamento_total
    FROM Produtores pt
    INNER JOIN Fazendas fz
        ON pt.id_produtor = fz.id_produtor
    INNER JOIN Produção pd
        ON fz.id_fazenda = pd.id_fazenda
    INNER JOIN Vendas vd
        ON pd.id_producao = vd.id_producao
    GROUP BY pt.id_produtor, pt.nome_produtor
)
SELECT *
FROM faturamento_produtor
ORDER BY faturamento_total DESC;

-- Receita por fazenda
WITH receita_fazenda AS (
    SELECT
        fz.id_fazenda,
        fz.nome_fazenda,
        SUM(vd.valor_total) AS receita_total
    FROM Fazendas fz
    INNER JOIN Produção pd
        ON fz.id_fazenda = pd.id_fazenda
    INNER JOIN Vendas vd
        ON pd.id_producao = vd.id_producao
    GROUP BY fz.id_fazenda, fz.nome_fazenda
)
SELECT *
FROM receita_fazenda
ORDER BY receita_total DESC;

-- Produção total por cultura
WITH producao_cultura AS (
    SELECT
        ct.nome_cultura,
        SUM(pd.quantidade_produzida) AS producao_total
    FROM Culturas ct
    INNER JOIN Produção pd
        ON ct.id_cultura = pd.id_cultura
    GROUP BY ct.nome_cultura
)
SELECT *
FROM producao_cultura
ORDER BY producao_total DESC;

-- Folha salarial por fazenda
WITH folha_salarial AS (
    SELECT
        id_fazenda,
        SUM(salario) AS folha_total
    FROM Funcionarios
    GROUP BY id_fazenda
)
SELECT *
FROM folha_salarial
ORDER BY folha_total DESC;

-- Investimento em máquinas
WITH investimento_maquinas AS (
    SELECT
        id_fazenda,
        SUM(valor_aquisicao) AS investimento_total
    FROM Maquinas
    GROUP BY id_fazenda
)
SELECT *
FROM investimento_maquinas
ORDER BY investimento_total DESC;

-- Produtividade média por fazenda
WITH produtividade_fazenda AS (
    SELECT
        id_fazenda,
        AVG(produtividade_hectare) AS media_produtividade
    FROM Produção
    GROUP BY id_fazenda
)
SELECT *
FROM produtividade_fazenda
ORDER BY media_produtividade DESC;

-- Custo total por fazenda
WITH custo_fazenda AS (
    SELECT
        id_fazenda,
        SUM(custo_producao) AS custo_total
    FROM Produção
    GROUP BY id_fazenda
)
SELECT *
FROM custo_fazenda
ORDER BY custo_total DESC;

-- Receita por cultura
WITH receita_cultura AS (
    SELECT
        ct.nome_cultura,
        SUM(vd.valor_total) AS receita_total
    FROM Culturas ct
    INNER JOIN Produção pd
        ON ct.id_cultura = pd.id_cultura
    INNER JOIN Vendas vd
        ON pd.id_producao = vd.id_producao
    GROUP BY ct.nome_cultura
)
SELECT *
FROM receita_cultura
ORDER BY receita_total DESC;

-- Precipitação média por fazenda
WITH precipitacao_media AS (
    SELECT
        id_fazenda,
        AVG(preciptacao_mm) AS media_precipitacao
    FROM Clima
    GROUP BY id_fazenda
)
SELECT *
FROM precipitacao_media
ORDER BY media_precipitacao DESC;

-- Top compradores
WITH compradores_receita AS (
    SELECT
        comprador,
        SUM(valor_total) AS faturamento_total
    FROM Vendas
    GROUP BY comprador
)
SELECT *
FROM compradores_receita
ORDER BY faturamento_total DESC;
