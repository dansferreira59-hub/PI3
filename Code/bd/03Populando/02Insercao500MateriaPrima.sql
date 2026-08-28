DO $$
DECLARE
    i INT;
    v_categoria_mat VARCHAR[] := ARRAY[
        'Miçanga Jablonex 6/0', 'Miçangão 8/0', 'Firma de Louça', 'Firma de Vidro', 
        'Búzio Africano', 'Búzio Fechado', 'Fio de Cordoalha', 'Fio de Nylon 0.50mm',
        'Palha da Costa', 'Pedra Natural Cristal', 'Pedra Natural Hematita', 'Pedra Natural Jaspe Red',
        'Pingente Espada de Ogum', 'Pingente Abebê', 'Pingente Tridente', 'Fita de Cetim 10mm',
        'Contas de Madeira 8mm', 'Pena de Pavão', 'Concha Marinha', 'Tinta Tecido Metalizada'
    ];
    v_cores VARCHAR[] := ARRAY['Azul Claro', 'Azul Escuro', 'Vermelho', 'Branco', 'Amarelo', 'Verde', 'Roxo', 'Preto', 'Dourado', 'Prateado', 'Coral', 'Multicolor'];
    v_unidades VARCHAR[] := ARRAY['g', 'kg', 'un', 'm', 'pacote'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO materias_primas (nome, unidade_medida, quantidade_estoque, estoque_minimo, custo_unitario_medio)
        VALUES (
            v_categoria_mat[1 + (i % ARRAY_LENGTH(v_categoria_mat, 1))] || ' ' || v_cores[1 + (i % ARRAY_LENGTH(v_cores, 1))] || ' - Lote ' || (100 + i),
            v_unidades[1 + (i % ARRAY_LENGTH(v_unidades, 1))],
            (10 + (i * 3.5))::numeric(10,3),
            (5 + (i % 20))::numeric(10,3),
            (2.50 + ((i % 50) * 1.25))::numeric(10,2)
        );
    END LOOP;
END $$;