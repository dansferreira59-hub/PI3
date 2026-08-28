DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
        VALUES (
            i, -- 1 item para cada pedido (1 a 500)
            1 + (i % 50), -- Associa aos IDs de produtos (de 1 a 50)
            (1 + (i % 4)), -- Quantidades entre 1 e 4
            (25.00 + ((i % 20) * 5.00))::numeric(10,2)
        );
    END LOOP;
END $$;