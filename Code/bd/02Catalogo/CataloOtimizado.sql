DO $$
DECLARE
    i INT;
    v_id_cat INT;
    v_orixas VARCHAR[] := ARRAY[
        'Oxumarê', 'Ogum', 'Iemanjá', 'Oxum', 'Xangô', 'Iansã', 'Oxóssi', 
        'Obaluaê', 'Nana Buruku', 'Exu', 'Pombagira', 'Preto Velho', 
        'Caboclo', 'Zé Pilintra', 'Cigano', 'Eparrey', 'Deusa Tríplice', 'Cernunnos'
    ];
    v_tipos_prod VARCHAR[] := ARRAY[
        'Guia de Miçangas', 'Brajá de Búzios', 'Pulseira Consagrada', 
        'Chicote de Firma', 'Patuá de Proteção', 'Taça Rituística', 
        'Incensário de Cerâmica', 'Pentáculo de Madeira', 'Ferramenta de Metal'
    ];
    v_detalhes VARCHAR[] := ARRAY[
        'com Firma e Cristais', 'com Búzios Africanos', 'Trançado Especial 7 Fios',
        'com Pingente Niquelado', 'Edição Limitada Arroboboi', 'Acabamento Ouro Velho',
        'Consagrado com Ervas', 'Com Cordão de Cordoalha'
    ];
    v_sku VARCHAR(30);
    v_nome VARCHAR(100);
    v_preco NUMERIC(10,2);
BEGIN
    FOR i IN 1..500 LOOP
        -- Seleciona categoria ciclicamente (1 a 6)
        v_id_cat := 1 + (i % 6);
        
        -- Monta SKU padronizado (Ex: ARB-CAT1-0001)
        v_sku := 'ARB-C' || v_id_cat || '-' || LPAD(i::text, 4, '0');
        
        -- Monta Nome do produto baseado nas egrégoras
        v_nome := v_tipos_prod[1 + (i % ARRAY_LENGTH(v_tipos_prod, 1))] || ' ' ||
                  v_orixas[1 + (i % ARRAY_LENGTH(v_orixas, 1))] || ' ' ||
                  v_detalhes[1 + (i % ARRAY_LENGTH(v_detalhes, 1))];
                  
        -- Preço proporcional à complexidade
        v_preco := (35.00 + ((i % 40) * 4.50))::numeric(10,2);
        
        INSERT INTO produtos (
            codigo_sku, 
            nome, 
            id_categoria, 
            descricao, 
            preco_venda, 
            link_instagram, 
            quantidade_estoque, 
            ativo
        ) VALUES (
            v_sku,
            v_nome,
            v_id_cat,
            'Item confecionado artesanalmente pelo Ateliê Arroboboi para a egrégora de ' || v_orixas[1 + (i % ARRAY_LENGTH(v_orixas, 1))] || '. Produto final de alta qualidade.',
            v_preco,
            'https://www.instagram.com/arroboboi.atelie/p/post_' || i || '/',
            (5 + (i % 25)),
            TRUE
        )
        ON CONFLICT (codigo_sku) DO UPDATE 
        SET nome = EXCLUDED.nome, preco_venda = EXCLUDED.preco_venda;
    END LOOP;
END $$;