-- ============================================================================
-- 1. FORNECEDORES E MATÉRIA-PRIMA (ESTOQUE INSUMOS)
-- ============================================================================

CREATE TABLE fornecedores (
    id_fornecedor SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    nome_contato VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cnpj_cpf VARCHAR(20) UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE materias_primas (
    id_materia_prima SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(10) NOT NULL, -- Ex: 'm', 'cm', 'g', 'kg', 'un'
    quantidade_estoque NUMERIC(10,3) DEFAULT 0.000,
    estoque_minimo NUMERIC(10,3) DEFAULT 0.000,
    custo_unitario_medio NUMERIC(10,2) DEFAULT 0.00
);

CREATE TABLE fornecedor_materia_prima (
    id_fornecedor INT REFERENCES fornecedores(id_fornecedor) ON DELETE CASCADE,
    id_materia_prima INT REFERENCES materias_primas(id_materia_prima) ON DELETE CASCADE,
    preco_ultima_compra NUMERIC(10,2),
    data_ultima_compra DATE,
    PRIMARY KEY (id_fornecedor, id_materia_prima)
);
