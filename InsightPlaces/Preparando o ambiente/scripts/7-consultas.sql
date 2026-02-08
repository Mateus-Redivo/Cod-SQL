USE insightplaces;

-- Display five rows from each table
SELECT * FROM proprietarios LIMIT 10;

SELECT * FROM clientes LIMIT 10;

SELECT * FROM enderecos LIMIT 10;

SELECT * FROM hospedagens LIMIT 10;

SELECT * FROM alugueis LIMIT 10;

SELECT * FROM avaliacoes LIMIT 10;

SELECT
  (SELECT COUNT(*) FROM proprietarios) AS total_proprietarios,
  (SELECT COUNT(*) FROM clientes) AS total_clientes,
  (SELECT COUNT(*) FROM enderecos) AS total_enderecos,
  (SELECT COUNT(*) FROM hospedagens) AS total_hospedagens,
  (SELECT COUNT(*) FROM alugueis) AS total_alugueis,
  (SELECT COUNT(*) FROM avaliacoes) AS total_avaliacoes;