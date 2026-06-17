-- Ranking das fazendas por receita.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	RANK() OVER(ORDER BY SUM(vd.valor_total) DESC) AS 'Rank_fazenda'
FROM
	Fazendas fz
INNER JOIN Produção pd
	ON fz.id_fazenda = pd.id_fazenda
		INNER JOIN Vendas vd
			ON pd.id_producao = vd.id_producao
GROUP BY fz.id_fazenda, fz.nome_fazenda

-- Ranking dos produtores por faturamento.
SELECT
    pt.id_produtor,
    pt.nome_produtor,
    SUM(vd.valor_total) AS faturamento_total,
    RANK() OVER(ORDER BY SUM(vd.valor_total) DESC) AS Rank_produtor
FROM Produtores pt
INNER JOIN Fazendas fz
    ON pt.id_produtor = fz.id_produtor
INNER JOIN Produção pd
    ON fz.id_fazenda = pd.id_fazenda
INNER JOIN Vendas vd
    ON pd.id_producao = vd.id_producao
GROUP BY pt.id_produtor, pt.nome_produtor;

-- Ranking das culturas por produção.
SELECT
    ct.id_cultura,
    ct.nome_cultura,
    SUM(pd.quantidade_produzida) AS producao_total,
    RANK() OVER(ORDER BY SUM(pd.quantidade_produzida) DESC) AS Rank_cultura
FROM Culturas ct
INNER JOIN Produção pd
    ON ct.id_cultura = pd.id_cultura
GROUP BY ct.id_cultura, ct.nome_cultura;

-- Ranking das máquinas por valor.
SELECT
    id_maquina,
    tipo_maquina,
    fabricante,
    modelo,
    valor_aquisicao,
    RANK() OVER(ORDER BY valor_aquisicao DESC) AS Rank_maquina
FROM Maquinas;

-- Acumulado de vendas.
SELECT
    id_venda,
    data_venda,
    valor_total,
    SUM(valor_total) OVER(ORDER BY data_venda) AS Acumulado_vendas
FROM Vendas;

-- Média de receita geral junto com a receita individual.
SELECT
    id_venda,
    valor_total,
    AVG(valor_total) OVER() AS Media_geral_receita
FROM Vendas;

-- Top 3 fazendas por estado.
SELECT *
FROM (
    SELECT
        fz.estado,
        fz.nome_fazenda,
        SUM(vd.valor_total) AS receita_total,
        ROW_NUMBER() OVER(
            PARTITION BY fz.estado
            ORDER BY SUM(vd.valor_total) DESC
        ) AS Posicao
    FROM Fazendas fz
    INNER JOIN Produção pd
        ON fz.id_fazenda = pd.id_fazenda
    INNER JOIN Vendas vd
        ON pd.id_producao = vd.id_producao
    GROUP BY fz.estado, fz.nome_fazenda
) AS ranking
WHERE Posicao <= 3;

-- Ranking dos compradores.
SELECT
    comprador,
    SUM(valor_total) AS faturamento_total,
    DENSE_RANK() OVER(ORDER BY SUM(valor_total) DESC) AS Rank_comprador
FROM Vendas
GROUP BY comprador;

-- Ranking das produções por produtividade.
SELECT
    id_producao,
    produtividade_hectare,
    RANK() OVER(ORDER BY produtividade_hectare DESC) AS Rank_produtividade
FROM Produção;

-- Participação percentual de cada fazenda na receita total.
SELECT
    fz.id_fazenda,
    fz.nome_fazenda,
    SUM(vd.valor_total) AS receita_total,
    ROUND(
        SUM(vd.valor_total) * 100.0 /
        SUM(SUM(vd.valor_total)) OVER(),
        2
    ) AS Participacao_percentual
FROM Fazendas fz
INNER JOIN Produção pd
    ON fz.id_fazenda = pd.id_fazenda
INNER JOIN Vendas vd
    ON pd.id_producao = vd.id_producao
GROUP BY fz.id_fazenda, fz.nome_fazenda;
