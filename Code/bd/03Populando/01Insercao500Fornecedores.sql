DO $$
DECLARE
    i INT;
    v_tipos VARCHAR[] := ARRAY['Armarinho', 'Distribuidora', 'Importadora', 'Feira Artesanal', 'Atacado de Artefatos', 'Pedras & Metais'];
    v_nomes VARCHAR[] := ARRAY['Egbé', 'Sagrado Insumos', 'Ori', 'Axé Comércio', 'Luz do Oriente', 'Encanto dos Orixás', 'Fundanga', 'Elementos da Terra', 'Fios & Contas', 'Abaçá Insumos'];
    v_cidades VARCHAR[] := ARRAY['São Paulo', 'Salvador', 'Rio de Janeiro', 'Recife', 'Belo Horizonte', 'Cachoeira'];
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO fornecedores (nome_empresa, nome_contato, telefone, email, cnpj_cpf)
        VALUES (
            v_tipos[1 + (i % ARRAY_LENGTH(v_tipos, 1))] || ' ' || v_nomes[1 + (i % ARRAY_LENGTH(v_nomes, 1))] || ' ' || i,
            'Contato ' || i,
            '(11) 9' || LPAD((80000000 + i)::text, 8, '0'),
            'fornecedor' || i || '@arroboboifornecedores.com.br',
            LPAD(i::text, 14, '0')
        );
    END LOOP;
END $$;