DO $$
DECLARE
    i INT;
    v_prenomes VARCHAR[] := ARRAY['Ana', 'Carlos', 'Beatriz', 'Lucas', 'Fernanda', 'Gabriel', 'Juliana', 'Rodrigo', 'Camila', 'Thiago', 'Mariana', 'Vinicius', 'Patricia', 'Renato', 'Vanessa'];
    v_sobrenomes VARCHAR[] := ARRAY['Silva', 'Santos', 'Oliveira', 'Souza', 'Rodrigues', 'Ferreira', 'Alves', 'Pereira', 'Lima', 'Gomes', 'Costa', 'Ribeiro', 'Martins', 'Carvalho'];
    v_cidades VARCHAR[] := ARRAY['São Paulo', 'Santo André', 'Bernardo do Campo', 'Osasco', 'Campinas', 'Rio de Janeiro', 'Niterói', 'Salvador', 'Curitiba', 'Porto Alegre'];
    v_estados CHAR(2)[] := ARRAY['SP', 'SP', 'SP', 'SP', 'SP', 'RJ', 'RJ', 'BA', 'PR', 'RS'];
    v_idx INT;
BEGIN
    FOR i IN 1..500 LOOP
        v_idx := 1 + (i % ARRAY_LENGTH(v_cidades, 1));
        INSERT INTO clientes (nome, whatsapp, instagram_handle, email, cidade, estado)
        VALUES (
            v_prenomes[1 + (i % ARRAY_LENGTH(v_prenomes, 1))] || ' ' || v_sobrenomes[1 + (i % ARRAY_LENGTH(v_sobrenomes, 1))],
            '(11) 9' || LPAD((90000000 + i)::text, 8, '0'),
            '@cliente_axe_' || i,
            'cliente' || i || '@email.com',
            v_cidades[v_idx],
            v_estados[v_idx]
        );
    END LOOP;
END $$;