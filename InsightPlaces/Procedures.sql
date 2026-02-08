USE insightplaces;
SELECT
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
	regioes_geograficas r ON e.estado = r.estado
WHERE 
	r.regiao = "Sudeste"
GROUP BY
    ano, mes
ORDER BY
    ano, mes;
    
    
DELIMITER //
DROP PROCEDURE IF EXISTS get_dados_por_regiao;
CREATE PROCEDURE get_dados_por_regiao(regiao_nome VARCHAR(255))
BEGIN
	SELECT
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
		regioes_geograficas r ON e.estado = r.estado
	WHERE 
		r.regiao = regiao_nome
	GROUP BY
		ano, mes
	ORDER BY
		ano, mes;
END//
DELIMITER ;    

CALL get_dados_por_regiao("Sul");

CALL get_dados_por_regiao("Norte");

USE insightplaces;

DROP PROCEDURE IF EXISTS calcular_taxa_ocupacao;
DELIMITER //
CREATE procedure calcular_taxa_ocupacao(ID VARCHAR(255))
BEGIN
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
	WHERE 
		p.proprietario_id = ID
	GROUP BY
		p.proprietario_id
	ORDER BY
		total_dias DESC;
END//
DELIMITER ;

SELECT proprietario_id, nome
FROM proprietarios;

CALL calcular_taxa_ocupacao("11");

CALL calcular_taxa_ocupacao("21");

