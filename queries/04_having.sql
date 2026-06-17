-- Mostrar culturas cuja produção total ultrapassa 100000 unidades.
SELECT
	ct.id_cultura,
	ct.nome_cultura,
	ct.categoria_cultura,
	SUM(pd.quantidade_produzida) AS 'Producao_total'
FROM
	Produção pd
INNER JOIN Culturas ct
	ON pd.id_cultura = ct.id_cultura
GROUP BY ct.id_cultura, ct.nome_cultura, ct.categoria_cultura
HAVING SUM(pd.quantidade_produzida) > 100000
ORDER BY Producao_total DESC

-- Mostrar fazendas com mais de 2 funcionários cadastrados.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	COUNT(*) AS 'Quantidade_funcionarios'
FROM
	Funcionarios fr
INNER JOIN Fazendas fz
	ON fr.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda
HAVING COUNT(*) > 2
ORDER BY Quantidade_funcionarios DESC

-- Mostrar produtores cuja área total das fazendas seja superior a 1500 hectares.
SELECT
	pt.id_produtor,
	pt.nome_produtor,
	pt.cpf,
	SUM(fz.area_hectares) AS 'Area_total'
FROM
	Produtores pt
INNER JOIN Fazendas fz
	ON pt.id_produtor = fz.id_produtor
GROUP BY pt.id_produtor, pt.nome_produtor, pt.cpf
HAVING SUM(fz.area_hectares) > 1500
ORDER BY Area_total DESC

-- Mostrar fazendas cujo investimento em máquinas ultrapasse R$ 2.000.000,00.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	SUM(mq.valor_aquisicao) AS 'Investimento_maquinas'
FROM
	Fazendas fz
INNER JOIN Maquinas mq
	ON fz.id_fazenda = mq.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
HAVING SUM(mq.valor_aquisicao) > 2000000.00
ORDER BY Investimento_maquinas DESC
