-- Objetivo: listar todos os produtores ativos.
SELECT
	id_produtor,
    	nome_produtor,
    	estado produtor,
	status_produtor
FROM
	Produtores
WHERE status_produtor = 'Ativo'


-- Objetivo: listar as fazendas ativas em ordem decrescente de área.
SELECT
	id_fazenda,
	nome_fazenda,
	cidade,
	estado,
	status_fazenda
FROM
	Fazendas
WHERE status_fazenda = 'Ativo'
ORDER BY area_hectares DESC


-- Objetivo: identificar máquinas em manutenção.
SELECT
	id_maquina,
	tipo_maquina,
	modelo,
	ano_fabricacao,
	status_maquina
FROM
	Maquinas
WHERE status_maquina = 'Manutenção'


-- Objetivo: Mostrar funcionários afastados.
SELECT
	id_funcionario,
	nome_funcionario,
	cpf,
	cargo,
	status_funcionario
FROM
	Funcionarios
WHERE status_funcionario = 'Afastado'


-- Objetivo: Listar todas as culturas ativas em ordem alfabética.
SELECT
	id_cultura,
	nome_cultura,
	categoria_cultura,
	status_cultura
FROM
	Culturas
WHERE status_cultura = 'Ativa'
ORDER BY nome_cultura ASC


-- Objetivo: Mostrar as vendas canceladas.
SELECT
	id_venda,
	comprador,
	quantidade_vendida,
	data_venda,
	status_venda
FROM
	Vendas
WHERE status_venda = 'Cancelada'


-- Objetivo: Exibir as produções que estão em andamento.
SELECT
	id_producao,
	area_plantada_hectares,
	custo_producao,
	status_producao
FROM
	Produção
WHERE status_producao = 'Em andamento'

-- Objetivo: Mostrar as 10 maiores produções por quantidade produzida.
SELECT TOP(10)
	id_producao,
	area_plantada_hectares,
	quantidade_produzida,
	status_producao
FROM
	Produção
ORDER BY quantidade_produzida DESC


-- Objetivo: Mostrar os 5 equipamentos mais caros adquiridos.
SELECT TOP(5)
	id_maquina,
	tipo_maquina,
	fabricante,
	modelo,
	valor_aquisicao
FROM
	Maquinas
ORDER BY valor_aquisicao DESC


-- Objetivo: Listar os estados distintos onde existem fazendas cadastradas.
SELECT 
	DISTINCT estado
FROM
	Fazendas
