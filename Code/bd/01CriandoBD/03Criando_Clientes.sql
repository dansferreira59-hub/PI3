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