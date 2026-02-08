USE insightplaces;

SELECT
    p.nome AS proprietario,
    COUNT(DISTINCT h.hospedagem_id) AS total_hospedagens
FROM
    hospedagens h
JOIN
    proprietarios p ON h.proprietario_id = p.proprietario_id
GROUP BY
    p.proprietario_id
ORDER BY
    total_hospedagens DESC;


SELECT
    p.nome AS Proprietario,
    MIN(primeira_data) AS primeira_data,
    SUM(total_dias) AS total_dias,
    SUM(dias_ocupados) AS dias_ocupados,
    ROUND((SUM(dias_ocupados) / SUM(total_dias)) * 100) AS taxa_ocupacao
FROM(
    SELECT 
        hospedagem_id,
        MIN(data_inicio) AS primeira_data,
        SUM(DATEDIFF(data_fim, data_inicio)) AS dias_ocupados,
        DATEDIFF(MAX(data_fim), MIN(data_inicio)) AS total_dias
    FROM 
        alugueis
    GROUP BY 
        hospedagem_id
    ) tabela_taxa_ocupacao
JOIN
    hospedagens h ON tabela_taxa_ocupacao.hospedagem_id = h.hospedagem_id
JOIN
    proprietarios p ON h.proprietario_id = p.proprietario_id
GROUP BY
    p.proprietario_id
ORDER BY
    total_dias DESC;    


SELECT
    YEAR(data_inicio) AS ano,
    MONTH(data_inicio) AS mes,
    COUNT(*) AS total_alugueis
FROM
    alugueis
GROUP BY
    ano, mes
ORDER BY
    ano, mes;

SELECT
    MONTH(data_inicio) AS mes,
    COUNT(*) AS total_alugueis
FROM
    alugueis
GROUP BY
    mes
ORDER BY
    total_alugueis DESC;
    
    
    
SELECT
    a.hospedagem_id,
    a.preco_total,
    DATEDIFF(a.data_fim, a.data_inicio) AS dias_aluguel,
    a.preco_total / DATEDIFF(a.data_fim, a.data_inicio) AS preco_dia
FROM
    alugueis a
ORDER BY
    preco_dia DESC;
;  


SELECT
    e.estado,
    AVG(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)) AS media_preco_aluguel,
    MAX(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)) AS max_preco_dia,
    MIN(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)) AS min_preco_dia,
    AVG(DATEDIFF(a.data_fim, a.data_inicio)) AS media_dias_aluguel
FROM
    alugueis a
JOIN
    hospedagens h ON a.hospedagem_id = h.hospedagem_id
JOIN
    enderecos e ON h.endereco_id = e.endereco_id
GROUP BY
    e.estado; 
    
SELECT
    r.regiao,
    AVG(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)) AS media_preco_aluguel,
    MAX(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)) AS max_preco_dia,
    MIN(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)) AS min_preco_dia,
    AVG(DATEDIFF(a.data_fim, a.data_inicio)) AS media_dias_aluguel
FROM
    alugueis a
JOIN
    hospedagens h ON a.hospedagem_id = h.hospedagem_id
JOIN
    enderecos e ON h.endereco_id = e.endereco_id
JOIN 
	regioes_geograficas r ON r.estado = e.estado
GROUP BY
    r.regiao; 

