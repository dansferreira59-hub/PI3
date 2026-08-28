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
