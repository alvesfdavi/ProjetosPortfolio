# Fonte de Dados: https://archive.ics.uci.edu/dataset/14/breast+cancer

/* Contexto do Problema: O conjunto de dados disponível sobre câncer de mama, apresenta variáveis no formato categórico. 
Para otimizar a análise, optamos por realizar o pré-processamento dos dados, aplicando técnicas como categorização, codificação e binarização.
Essa abordagem visa aprimorar a representação das informações, facilitando a interpretação e a aplicação de técnicas analíticas subsequentes. */

-- Binarização da variável classe (0/1)

SELECT
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0
		WHEN classe = 'recurrence-events' THEN 1
	END AS classe 
FROM tb_dados

-- Binarização da variável irradiando (0/1)

SELECT
	CASE
		WHEN irradiando = 'no' THEN 0
        	WHEN irradiando = 'yes' THEN 1
	END AS irradiando
FROM tb_dados

-- Codificação da variável node_caps (0/1)

SELECT
	CASE 
		WHEN node_caps = 'no' THEN 0
		WHEN node_caps = 'yes' THEN 1
		ELSE 2	
	END AS node_caps
FROM tb_dados

-- Categorização da variavel seio (E/D)

SELECT 
	CASE
		WHEN seio = 'left' THEN 'E'
        	WHEN seio = 'right' THEN 'D'
	END AS seio
FROM tb_dados

-- Categorização da variavel tamanho_tumor (6 Categorias)

SELECT 
	CASE
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        	WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        	WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        	WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        	WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        	WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END AS tamanho_tumor
FROM tb_dados

-- Label Encoding da variavel quadrante (1,2,3,4,5)

SELECT
	CASE 
		WHEN quadrante = 'left_low' THEN 1
		WHEN quadrante = 'right_up' THEN 2
		WHEN quadrante = 'left_up' THEN 3
		WHEN quadrante = 'right_low' THEN 4
		WHEN quadrante = 'central' THEN 5
		ELSE 0
	END AS quadrante
FROM tb_dados

-- Criação de um novo Dataset após as transformações

CREATE TABLE cap03.tb_dados
AS
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0
        	WHEN classe = 'recurrence-events' THEN 1
    	END AS classe,
    	idade,
    	menopausa,
	CASE
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        	WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        	WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        	WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        	WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        	WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END AS tamanho_tumor,
    	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0
		WHEN node_caps = 'yes' THEN 1
		ELSE 2	
	END AS node_caps,
    	deg_malig,
	CASE
		WHEN seio = 'left' THEN 'E'
        WHEN seio = 'right' THEN 'D'
	END AS seio,
	CASE 
		WHEN quadrante = 'left_low' THEN 1
		WHEN quadrante = 'right_up' THEN 2
		WHEN quadrante = 'left_up' THEN 3
		WHEN quadrante = 'right_low' THEN 4
		WHEN quadrante = 'central' THEN 5
		ELSE 0
	END AS quadrante,
	CASE
		WHEN irradiando = 'no' THEN 0
        	WHEN irradiando = 'yes' THEN 1
	END AS irradiando
FROM tb_dados


