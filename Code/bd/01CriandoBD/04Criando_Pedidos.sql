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