DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO fornecedor_materia_prima (id_fornecedor, id_materia_prima, preco_ultima_compra, data_ultima_compra)
        VALUES (
            i,
            i,
            (3.00 + ((i % 40) * 1.50))::numeric(10,2),
            CURRENT_DATE - (i || ' days')::INTERVAL
        )
        ON CONFLICT DO NOTHING;
    END LOOP;
END $$;