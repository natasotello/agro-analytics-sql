-- Calcular a receita total por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	SUM(vd.valor_total) AS 'Receita_total'
FROM
	Fazendas fz
INNER JOIN Produção pd
	ON fz.id_fazenda = pd.id_fazenda
		INNER JOIN Vendas vd
			ON pd.id_producao = vd.id_producao
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
ORDER BY Receita_total DESC

-- Calcular o lucro bruto por produção.
SELECT
    pd.id_producao,
    pd.custo_producao,
    SUM(vd.valor_total) AS Receita_Total,
    SUM(vd.valor_total) - pd.custo_producao AS Lucro_Bruto
FROM
    Produção pd
INNER JOIN Vendas vd
    ON pd.id_producao = vd.id_producao
WHERE
    vd.status_venda = 'Concluída'
GROUP BY
    pd.id_producao, pd.custo_producao
ORDER BY
    Lucro_Bruto DESC;

-- Mostrar as 10 fazendas mais rentáveis.
SELECT TOP(10)
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	SUM(valor_total) - SUM(custo_producao) AS 'Renda'
FROM
	Fazendas fz
INNER JOIN Produção pd
	ON fz.id_fazenda = pd.id_fazenda
		INNER JOIN Vendas vd
			ON pd.id_producao = vd.id_producao
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
ORDER BY Renda DESC

-- Calcular a margem de lucro (%) por produção.
SELECT
	((vd.valor_total - pd.custo_producao) / pd.custo_producao) * 100 AS 'Lucro_%'
FROM
	Vendas vd
INNER JOIN Produção pd
	ON vd.id_producao = pd.id_producao
ORDER BY [Lucro_%] DESC

-- Mostrar a cultura que gerou maior receita.
SELECT TOP(1)
	ct.id_cultura,
	ct.nome_cultura,
	ct.categoria_cultura,
	SUM(vd.valor_total) AS 'Receita_cultura'
FROM
	Culturas ct
INNER JOIN Produção pd
	ON ct.id_cultura = pd.id_cultura
		INNER JOIN Vendas vd
			ON pd.id_producao = vd.id_producao
GROUP BY ct.id_cultura, ct.nome_cultura, ct.categoria_cultura
ORDER BY Receita_cultura DESC

-- Mostrar os compradores que mais movimentaram dinheiro.
SELECT
    comprador,
    SUM(valor_total) AS 'Receita_total'
FROM
    Vendas
WHERE status_venda = 'Concluída'
GROUP BY comprador
ORDER BY Receita_total DESC;

-- Mostrar os produtores com maior faturamento.
SELECT
	pt.id_produtor,
	pt.nome_produtor,
	pt.cpf,
	SUM(vd.valor_total) AS 'Faturamento_produtores'
FROM
	Produtores pt
INNER JOIN Fazendas fz
	ON pt.id_produtor = fz.id_produtor
		INNER JOIN Produção pd
			ON fz.id_fazenda = pd.id_fazenda
				INNER JOIN Vendas vd
					ON pd.id_producao = vd.id_producao
GROUP BY pt.id_produtor, pt.nome_produtor, pt.cpf
ORDER BY Faturamento_produtores DESC

-- Comparar custo total e receita total por fazenda.
SELECT
	fz.nome_fazenda,
	SUM(pd.custo_producao) AS custo_total,
	SUM(vd.valor_total) AS receita_total
FROM
	Fazendas fz
INNER JOIN Produção pd
	ON fz.id_fazenda = pd.id_fazenda
		INNER JOIN Vendas vd
			ON pd.id_producao = vd.id_producao
GROUP BY fz.nome_fazenda
ORDER BY receita_total, custo_total

-- Calcular o ROI das fazendas.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	(SUM(vd.valor_total) - SUM(pd.custo_producao)) / SUM(pd.custo_producao) * 100 AS 'ROI'
FROM
	Fazendas fz
INNER JOIN Produção pd
	ON fz.id_fazenda = pd.id_fazenda
		INNER JOIN Vendas vd
			ON pd.id_producao= vd.id_producao
GROUP BY fz.id_fazenda, fz.nome_fazenda
ORDER BY ROI DESC

-- Mostrar a produtividade média por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	AVG(produtividade_hectare) AS 'Media_produtividade'
FROM
	Produção pd
INNER JOIN Fazendas fz
	ON pd.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda
ORDER BY Media_produtividade DESC
