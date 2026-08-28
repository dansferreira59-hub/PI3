SELECT 'fornecedores' AS tabela, COUNT(*) AS total FROM fornecedores
UNION ALL
SELECT 'materias_primas', COUNT(*) FROM materias_primas
UNION ALL
SELECT 'fornecedor_materia_prima', COUNT(*) FROM fornecedor_materia_prima
UNION ALL
SELECT 'clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'pedidos', COUNT(*) FROM pedidos
UNION ALL
SELECT 'itens_pedido', COUNT(*) FROM itens_pedido;