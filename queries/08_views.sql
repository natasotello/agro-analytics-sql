-- Faturamento por Produtor
CREATE VIEW vw_Faturamento_Produtores AS
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
GROUP BY
    pt.id_produtor,
    pt.nome_produtor;

SELECT *
FROM vw_Faturamento_Produtores
ORDER BY faturamento_total DESC;

-- Receita por Fazenda
CREATE VIEW vw_Receita_Fazendas AS
SELECT
    fz.id_fazenda,
    fz.nome_fazenda,
    fz.estado,
    SUM(vd.valor_total) AS receita_total
FROM Fazendas fz
INNER JOIN Produção pd
    ON fz.id_fazenda = pd.id_fazenda
INNER JOIN Vendas vd
    ON pd.id_producao = vd.id_producao
GROUP BY
    fz.id_fazenda,
    fz.nome_fazenda,
    fz.estado;

SELECT *
FROM vw_Receita_Fazendas
ORDER BY receita_total DESC;

-- Produção por Cultura
CREATE VIEW vw_Producao_Culturas AS
SELECT
    ct.id_cultura,
    ct.nome_cultura,
    SUM(pd.quantidade_produzida) AS producao_total
FROM Culturas ct
INNER JOIN Produção pd
    ON ct.id_cultura = pd.id_cultura
GROUP BY
    ct.id_cultura,
    ct.nome_cultura;

SELECT *
FROM vw_Producao_Culturas
ORDER BY producao_total DESC;

-- Investimento em Máquinas por Fazenda
CREATE VIEW vw_Investimento_Maquinas AS
SELECT
    fz.id_fazenda,
    fz.nome_fazenda,
    SUM(mq.valor_aquisicao) AS investimento_total
FROM Fazendas fz
INNER JOIN Maquinas mq
    ON fz.id_fazenda = mq.id_fazenda
GROUP BY
    fz.id_fazenda,
    fz.nome_fazenda;

SELECT *
FROM vw_Investimento_Maquinas
ORDER BY investimento_total DESC;

-- Desempenho das Fazendas
CREATE VIEW vw_Desempenho_Fazendas AS
SELECT
    fz.id_fazenda,
    fz.nome_fazenda,
    SUM(pd.quantidade_produzida) AS producao_total,
    SUM(pd.custo_producao) AS custo_total,
    SUM(vd.valor_total) AS receita_total
FROM Fazendas fz
INNER JOIN Produção pd
    ON fz.id_fazenda = pd.id_fazenda
INNER JOIN Vendas vd
    ON pd.id_producao = vd.id_producao
GROUP BY
    fz.id_fazenda,
    fz.nome_fazenda;

SELECT *
FROM vw_Desempenho_Fazendas
ORDER BY receita_total DESC;
