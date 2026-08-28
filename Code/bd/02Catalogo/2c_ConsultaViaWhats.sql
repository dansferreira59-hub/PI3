SELECT 
    p.codigo_sku,
    p.nome AS produto,
    c.nome AS categoria,
    CONCAT('R$ ', REPLACE(p.preco_venda::text, '.', ',')) AS preco,
    p.quantidade_estoque AS em_estoque,
    p.link_instagram
FROM produtos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.ativo = TRUE AND p.quantidade_estoque > 0
ORDER BY c.nome, p.nome
LIMIT 20;