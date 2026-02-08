USE insightplaces;

CREATE VIEW view_metricas_proprietario AS
SELECT
    p.nome AS Proprietario,
    COUNT(DISTINCT h.hospedagem_id) AS total_hospedagens,
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
    p.proprietario_id;
    
SELECT * from view_metricas_proprietario;


CREATE VIEW view_dados_regiao AS
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
    
SELECT * FROM view_dados_regiao;

CREATE VIEW ocupacao_por_regiao_tempo AS
SELECT
    r.regiao,
    YEAR(data_inicio) AS ano,
    MONTH(data_inicio) AS mes,
    COUNT(*) AS total_alugueis
FROM
    alugueis a
JOIN
    hospedagens h ON a.hospedagem_id = h.hospedagem_id
JOIN
    enderecos e ON h.endereco_id = e.endereco_id
JOIN
    regioes_geograficas r ON r.estado = e.estado
GROUP BY
    r.regiao, YEAR(data_inicio), MONTH(data_inicio)
ORDER BY
    r.regiao, ano, mes;
    
SELECT * from ocupacao_por_regiao_tempo;

SELECT * from ocupacao_por_regiao_tempo
WHERE regiao='Sudeste' AND ano = 2023;