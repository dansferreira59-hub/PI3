DO $$
DECLARE
    i INT;
    v_tipos VARCHAR[] := ARRAY['Orcamento', 'Pedido'];
    v_status VARCHAR[] := ARRAY['Pendente', 'Aprovado', 'Em Producao', 'Enviado', 'Entregue', 'Cancelado'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO pedidos (id_cliente, tipo, status, valor_total, desconto, data_criacao, data_entrega_prevista, observacoes)
        VALUES (
            1 + (i % 500), -- Associa aos clientes criados anteriormente
            v_tipos[1 + (i % 2)],
            v_status[1 + (i % ARRAY_LENGTH(v_status, 1))],
            (50.00 + ((i % 30) * 15.00))::numeric(10,2),
            (CASE WHEN i % 5 = 0 THEN 10.00 ELSE 0.00 END)::numeric(10,2),
            CURRENT_TIMESTAMP - (i || ' hours')::INTERVAL,
            CURRENT_DATE + ((i % 15) || ' days')::INTERVAL,
            'Pedido/Orçamento referente a personalização de guia/artefato espiritual nº ' || i
        );
    END LOOP;
END $$;