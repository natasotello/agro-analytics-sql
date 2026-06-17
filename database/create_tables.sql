CREATE TABLE Produtores (
	id_produtor INT IDENTITY(1,1),
	nome_produtor VARCHAR(100) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	sexo VARCHAR(1) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR(100) NOT NULL,
	status_produtor VARCHAR(100)
	CONSTRAINT produtores_id_produtor_pk PRIMARY KEY(id_produtor),
	CONSTRAINT produtores_cpf_CK CHECK (cpf NOT LIKE '%[^0-9]%' AND LEN(cpf) = 11),
	CONSTRAINT produtores_sexo_ck CHECK(sexo IN ('F', 'M', 'O')),
	CONSTRAINT produtores_telefone_ck CHECK(telefone NOT LIKE '%[^0-9]%'),
	CONSTRAINT produtores_email_ck CHECK(email LIKE '%_@__%.__%')
),
	CONSTRAINT produtores_status_produtor_ck CHECK(status_produtor IN ('Ativo', 'Inativo'))

CREATE TABLE Fazendas(
	id_fazenda INT IDENTITY(1,1) NOT NULL,
	nome_fazenda VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estado CHAR(2) NOT NULL,
	status_fazenda VARCHAR(10),
	id_produtor INT NOT NULL,
	area_hectares DECIMAL(10,2) NOT NULL,
	latitude DECIMAL(9,6),
	longitude DECIMAL(9,6),
	altitude_metros INT,
	data_aquisicao DATE NOT NULL,
	data_cadastro DATETIME NOT NULL
	CONSTRAINT fazendas_data_cadastro_df DEFAULT GETDATE()
	CONSTRAINT fazendas_id_fazenda_pk PRIMARY KEY(id_fazenda),
	CONSTRAINT fazendas_status_fazenda_ck CHECK(status_fazenda IN ('Ativo', 'Inativo')),
	CONSTRAINT fazendas_id_produtor_fk FOREIGN KEY (id_produtor) REFERENCES Produtores(id_produtor)
)

CREATE TABLE Culturas(
	id_cultura INT IDENTITY(1,1),
	nome_cultura VARCHAR(50) NOT NULL,
	categoria_cultura VARCHAR(30) NOT NULL,
	unidade_medida VARCHAR(20) NOT NULL,
	ciclo_medio_dias INT NOT NULL,
	status_cultura VARCHAR(10),
	data_cadastro DATETIME CONSTRAINT culturas_data_cadastro_df DEFAULT GETDATE (),
	CONSTRAINT culturas_id_cultura_pk PRIMARY KEY (id_cultura),
	CONSTRAINT culturas_status_cultura_ck CHECK(status_cultura IN ('Ativa', 'Inativa'))
)

CREATE TABLE Safras(
	id_safra INT IDENTITY(1,1),
	nome_safra VARCHAR(20) NOT NULL,
	ano_inicio INT NOT NULL,
	ano_fim INT NOT NULL,
	periodo_plantio VARCHAR(20) NOT NULL,
	periodo_colheita VARCHAR(20) NOT NULL,
	status_safra VARCHAR(10) NOT NULL,
	data_cadastro DATETIME CONSTRAINT safras_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT safras_id_safra_pk PRIMARY KEY (id_safra),
	CONSTRAINT safras_status_safra_ck CHECK(status_safra IN ('Encerrada', 'Em andamento', 'Planejada'))
)

CREATE TABLE Producao(
	id_producao INT IDENTITY(1,1),
	id_fazenda INT NOT NULL,
	id_cultura INT NOT NULL,
	id_safra INT NOT NULL,
	area_plantada_hectares DECIMAL(10,2),
	quantidade_produzida DECIMAL(12,2),
	produtividade_hectare DECIMAL(10,2),
	custo_producao DECIMAL(14,2),
	data_inicio_plantio DATE,
	data_fim_colheita DATE,
	status_producao VARCHAR(20),
	data_cadastro DATETIME CONSTRAINT producao_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT producao_id_producao_pk PRIMARY KEY (id_producao),
	CONSTRAINT producao_id_fazenda_fk FOREIGN KEY (id_fazenda) REFERENCES Fazendas(id_fazenda),
	CONSTRAINT producao_id_cultura_fk FOREIGN KEY (id_cultura) REFERENCES Culturas(id_cultura),
	CONSTRAINT producao_id_safra_fk FOREIGN KEY (id_safra) REFERENCES Safras(id_safra),
	CONSTRAINT producao_status_producao_ck CHECK(status_producao IN ('Planejada','Em andamento','Finalizada'))
)

CREATE TABLE Clima(
	id_clima INT IDENTITY(1,1),
	id_fazenda INT NOT NULL,
	id_safra INT NOT NULL,
	precipitacao_mm DECIMAL(8,2) NOT NULL,
	temperatura_media DECIMAL(4,1) NOT NULL,
	umidade_media DECIMAL(5,2) NOT NULL,
	indice_seca VARCHAR(10) NOT NULL,
	ocorrencia_geada VARCHAR(3),
	observacao VARCHAR(200),
	data_cadastro DATETIME CONSTRAINT clima_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT clima_id_clima_pk PRIMARY KEY (id_clima),
	CONSTRAINT clima_id_fazenda_fk FOREIGN KEY (id_fazenda) REFERENCES Fazendas(id_fazenda),
	CONSTRAINT clima_id_safra_fk FOREIGN KEY (id_safra) REFERENCES Safras(id_safra),
	CONSTRAINT clima_indice_seca_ck CHECK(indice_seca IN ('Baixo','Moderado','Alto')),
	CONSTRAINT clima_ocorrencia_geada_ck CHECK(ocorrencia_geada IN ('Sim','Não'))
)

CREATE TABLE Vendas(
	id_venda INT IDENTITY(1,1),
	id_producao INT NOT NULL,
	comprador VARCHAR(100) NOT NULL,
	quantidade_vendida DECIMAL(12,2) NOT NULL,
	preco_unitario DECIMAL(10,2) NOT NULL,
	valor_total DECIMAL(14,2) NOT NULL,
	data_venda DATE NOT NULL,
	forma_pagamento VARCHAR(20) NOT NULL,
	status_venda VARCHAR(20) NOT NULL,
	data_cadastro DATETIME CONSTRAINT vendas_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT vendas_id_venda_pk PRIMARY KEY (id_venda),
	CONSTRAINT vendas_id_producao_fk FOREIGN KEY (id_producao) REFERENCES Produção(id_producao),
	CONSTRAINT vendas_status_venda_ck CHECK(status_venda IN ('Pendente','Concluída','Cancelada'))
)

CREATE TABLE Funcionarios(
	id_funcionario INT IDENTITY(1,1),
	id_fazenda INT NOT NULL,
	nome_funcionario VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	sexo VARCHAR(1) NOT NULL,
	data_nascimento DATE NOT NULL,
	cargo VARCHAR(50) NOT NULL,
	salario DECIMAL(10,2) NOT NULL,
	data_admissao DATE NOT NULL,
	status_funcionario VARCHAR(20),
	data_cadastro DATETIME CONSTRAINT funcionarios_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT funcionarios_id_funcionario_pk PRIMARY KEY (id_funcionario),
	CONSTRAINT funcionarios_id_fazenda_fk FOREIGN KEY (id_fazenda) REFERENCES Fazendas(id_fazenda),
	CONSTRAINT funcionarios_sexo_ck CHECK(sexo IN ('M', 'F')),
	CONSTRAINT funcionarios_status_funcionario_ck CHECK(status_funcionario IN ('Ativo','Afastado','Desligado'))
)

CREATE TABLE Maquinas(
	id_maquina INT IDENTITY(1,1),
	id_fazenda INT NOT NULL,
	tipo_maquina VARCHAR(30) NOT NULL,
	fabricante VARCHAR(30) NOT NULL,
	modelo VARCHAR(50) NOT NULL,
	ano_fabricacao INT NOT NULL,
	potencia_cv INT NOT NULL,
	status_maquina VARCHAR(20),
	data_aquisicao DATE NOT NULL,
	valor_aquisicao DECIMAL(12,2),
	data_cadastro DATETIME CONSTRAINT maquinas_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT maquinas_id_maquina_pk PRIMARY KEY (id_maquina),
	CONSTRAINT maquinas_id_fazenda_fk FOREIGN KEY (id_fazenda) REFERENCES Fazendas(id_fazenda),
	CONSTRAINT status_maquina_ck CHECK(status_maquina IN ('Operando','Manutenção','Inativa'))
)

CREATE TABLE Compradores(
	id_comprador INT IDENTITY(1,1),
	nome_empresa VARCHAR(100) NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	segmento VARCHAR(50) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR(100) NOT NULL,
	status_comprador VARCHAR(10),
	data_cadastro DATETIME CONSTRAINT compradores_data_cadastro_df DEFAULT GETDATE(),
	CONSTRAINT compradores_id_comprador_pk PRIMARY KEY (id_comprador),
	CONSTRAINT compradores_status_comprador_ck CHECK(status_comprador IN ('Ativo','Inativo'))
)
