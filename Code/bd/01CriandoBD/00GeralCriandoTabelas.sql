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

-- ============================================================================
-- 2. CATÁLOGO E PRODUTOS FINAIS
-- ============================================================================

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    codigo_sku VARCHAR(30) UNIQUE NOT NULL, -- Código único do produto (ex: ART-BRINCO-001)
    nome VARCHAR(100) NOT NULL,
    id_categoria INT REFERENCES categorias(id_categoria),
    descricao TEXT,
    preco_venda NUMERIC(10,2) NOT NULL,
    link_instagram VARCHAR(255),
    quantidade_estoque INT DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ficha Técnica (Relacionamento N:N entre Matéria-Prima e Produto Final)
CREATE TABLE composicao_produto (
    id_produto INT REFERENCES produtos(id_produto) ON DELETE CASCADE,
    id_materia_prima INT REFERENCES materias_primas(id_materia_prima) ON DELETE RESTRICT,
    quantidade_usada NUMERIC(10,3) NOT NULL,
    PRIMARY KEY (id_produto, id_materia_prima)
);

-- ============================================================================
-- 3. CLIENTES
-- ============================================================================

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    whatsapp VARCHAR(20) NOT NULL,
    instagram_handle VARCHAR(50),
    email VARCHAR(100),
    cidade VARCHAR(50),
    estado CHAR(2),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- 4. ORÇAMENTOS E PEDIDOS (VENDAS)
-- ============================================================================

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente) ON DELETE SET NULL,
    tipo VARCHAR(15) CHECK (tipo IN ('Orcamento', 'Pedido')) DEFAULT 'Orcamento',
    status VARCHAR(20) CHECK (status IN ('Pendente', 'Aprovado', 'Em Producao', 'Enviado', 'Entregue', 'Cancelado')) DEFAULT 'Pendente',
    valor_total NUMERIC(10,2) DEFAULT 0.00,
    desconto NUMERIC(10,2) DEFAULT 0.00,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_entrega_prevista DATE,
    observacoes TEXT
);

CREATE TABLE itens_pedido (
    id_item_pedido SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_produto INT REFERENCES produtos(id_produto) ON DELETE RESTRICT,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10,2) NOT NULL
);