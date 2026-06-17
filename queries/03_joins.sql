-- Mostrar todas as fazendas e seus respectivos produtores.
SELECT 
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	fz.status_fazenda,
	fz.id_produtor,
	pt.nome_produtor,
	pt.cpf
FROM
	Fazendas fz
INNER JOIN Produtores pt
	ON fz.id_produtor = pt.id_produtor

-- Calcular a área total (hectares) por produtor.
SELECT
	SUM(fz.area_hectares) AS 'Area_total_hectares',
	fz.id_produtor,
	pt.nome_produtor,
	pt.cpf
FROM
	Fazendas fz
INNER JOIN Produtores pt
	ON fz.id_produtor = pt.id_produtor
GROUP BY fz.id_produtor, pt.nome_produtor, pt.cpf

-- Mostrar a quantidade de fazendas por produtor.
SELECT
	COUNT(*) AS 'Quantidade_fazendas',
	fz.id_produtor,
	pt.nome_produtor,
	pt.cpf
FROM
	Fazendas fz
INNER JOIN Produtores pt
	ON fz.id_produtor = pt.id_produtor
GROUP BY fz.id_produtor, pt.nome_produtor, pt.cpf
ORDER BY Quantidade_fazendas DESC

-- Calcular a produção total por cultura.
SELECT
	ct.id_cultura,
	ct.nome_cultura,
	ct.categoria_cultura,
	SUM(pd.custo_producao) AS 'Producao_total'
FROM
	Produção pd
INNER JOIN Culturas ct
	ON pd.id_cultura = ct.id_cultura
GROUP BY ct.id_cultura, ct.nome_cultura, ct.categoria_cultura
ORDER BY Producao_total DESC

-- Calcular a receita total obtida por cultura.
SELECT
	ct.id_cultura,
	ct.nome_cultura,
	SUM(vd.valor_total) AS 'Receita_total'
FROM
	Culturas ct
INNER JOIN Produção pd
	ON ct.id_cultura = pd.id_cultura
		INNER JOIN Vendas vd
			ON pd.id_producao = vd.id_producao
GROUP BY ct.id_cultura, ct.nome_cultura
ORDER BY Receita_total DESC

-- Mostrar quantas produções foram realizadas em cada safra.
SELECT
	sf.id_safra,
	sf.nome_safra,
	SUM(pd.quantidade_produzida) AS 'Quantidade_produzida'
FROM
	Produção pd
INNER JOIN Safras sf
	ON pd.id_safra = sf.id_safra
WHERE pd.status_producao = 'Finalizada'
GROUP BY sf.id_safra, sf.nome_safra
ORDER BY Quantidade_produzida DESC

-- Calcular a média de produtividade por cultura.
SELECT
	ct.id_cultura,
	ct.nome_cultura,
	AVG(pd.produtividade_hectare) AS 'Media_produtividade'
FROM
	Produção pd
INNER JOIN Culturas ct
	ON pd.id_cultura = ct.id_cultura
GROUP BY ct.id_cultura, ct.nome_cultura
ORDER BY Media_produtividade DESC

-- Mostrar o valor total investido em máquinas por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	COUNT(mq.id_maquina) AS 'Quantidade_maquinas',
	SUM(mq.valor_aquisicao) AS 'Valor_total_investido'
FROM
	Fazendas fz
INNER JOIN Maquinas mq
	ON fz.id_fazenda = mq.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
ORDER BY Valor_total_investido DESC

-- Mostrar a quantidade de funcionários por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	COUNT(*) AS 'Quantidade_funcionarios'
FROM
	Funcionarios fn
INNER JOIN Fazendas fz
	ON fn.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda
ORDER BY Quantidade_funcionarios DESC

-- Calcular a folha salarial mensal por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	SUM(fr.salario) AS 'Folha_salarial_fazenda'
FROM
	Funcionarios fr
INNER JOIN Fazendas fz
	ON fr.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda
ORDER BY Folha_salarial_fazenda DESC

-- Mostrar quantas máquinas existem por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	COUNT(*) AS 'Quantidade_maquinas'
FROM
	Maquinas mq
INNER JOIN Fazendas fz
	ON mq.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
ORDER BY Quantidade_maquinas DESC

-- Mostrar o total produzido por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	SUM(pd.quantidade_produzida) AS 'Total_produzido'
FROM
	Produção pd
INNER JOIN Fazendas fz
	ON pd.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
ORDER BY Quantidade_produzida DESC

-- Calcular o faturamento por comprador.
SELECT
	comprador,
	SUM(valor_total) AS 'Faturamento_total'
FROM
	Vendas
WHERE status_venda = 'Concluída'
GROUP BY comprador
ORDER BY Faturamento DESC

-- Mostrar a precipitação média por fazenda.
SELECT
	fz.id_fazenda,
	fz.nome_fazenda,
	fz.estado,
	AVG(cl.precipitacao_mm) AS 'Media_precipitacao'
FROM
	Clima cl
INNER JOIN Fazendas fz
	ON cl.id_fazenda = fz.id_fazenda
GROUP BY fz.id_fazenda, fz.nome_fazenda, fz.estado
ORDER BY Media_precipitacao DESC

-- Mostrar a temperatura média por safra.
SELECT
	sf.id_safra,
	sf.nome_safra,
	sf.status_safra,
	AVG(cl.temperatura_media) AS 'Temperatura_media'
FROM
	Clima cl
INNER JOIN Safras sf
	ON cl.id_safra = sf.id_safra
GROUP BY sf.id_safra, sf.nome_safra, sf.status_safra
ORDER BY Temperatura_media DESC
