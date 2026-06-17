-- Objetivo: Contar quantos produtores existem no banco.
SELECT
	COUNT(*) AS 'Produtores'
FROM
	Produtores

-- Objetivo: Contar quantos funcionários estão ativos.
SELECT
	COUNT(*) AS 'Funcionarios_ativos'
FROM
	Funcionarios
WHERE status_funcionario = 'Ativo'

-- Objetivo: Contar quantas máquinas estão operando.
SELECT
	COUNT(*) AS 'Maquinas_operando'
FROM
	Maquinas
WHERE status_maquina = 'Operando'

-- Objetivo: Calcular a área total (hectares) das fazendas cadastradas.
SELECT
	SUM(area_hectares) AS 'Area_total_hectares'
FROM
	Fazendas

-- Objetivo: Calcular a quantidade total produzida registrada no banco.
SELECT
	SUM(quantidade_produzida) AS 'Quantidade_total_produzida'
FROM
	Produção

-- Objetivo: Calcular o valor total movimentado nas vendas.
SELECT
	SUM(valor_total) AS 'Valor_total_vendas'
FROM
	Vendas

-- Objetivo: Descobrir qual foi o maior custo de produção registrado.
SELECT
	MAX(custo_producao) AS 'Maior_custo_producao'
FROM
	Produção

-- Objetivo: Descobrir qual foi o menor salário registrado entre os funcionários.
SELECT
	MIN(salario) AS 'Menor_salario'
FROM
	Funcionários

-- Objetivo: Calcular o salário médio dos funcionários.
SELECT
	AVG(salario) AS 'Media_salario'
FROM
	Funcionários

-- Objetivo: Calcular a precipitação média registrada na tabela Clima.
SELECT
	AVG(precipitacao_mm) AS 'Media_precipitacao'
FROM
	Clima

-- Mostrar a quantidade de vendas realizadas por forma de pagamento.
SELECT
	COUNT(*) AS 'Quantidade_pagamento',
	forma_pagamento
FROM
	Vendas
GROUP BY forma_pagamento
ORDER BY Quantidade_pagamento DESC
