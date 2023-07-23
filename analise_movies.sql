-- Olhando as tabelas do banco de dados

SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

-- 1) Criando agrupamentos

-- Preço médio de aluguel dos filmes
SELECT AVG(preco_aluguel) FROM filmes;

-- Preço médio e contagem de filmes por gênero
SELECT
	genero,
    round(AVG(preco_aluguel), 2) as preco_medio,
	COUNT(*) as qtde_filmes
FROM filmes
GROUP BY genero;

-- Preço médio e contagem de filmes por gênero no ano de 2011
SELECT
	genero,
    round(AVG(preco_aluguel), 2) as preco_medio,
	COUNT(*) as qtde_filmes
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero;

-- 2) Subqueries
-- Análise de desempenho dos alugueis.
SELECT 
	* 
FROM alugueis
WHERE nota >= (SELECT AVG(nota) FROM alugueis);

-- 3) Criando views para guardar o resultado de uma consulta no BD.
CREATE VIEW resultado AS
SELECT
	genero,
    round(AVG(preco_aluguel), 2) as preco_medio,
	COUNT(*) as qtde_filmes
FROM filmes
GROUP BY genero;

-- Selecionando e visualizando a view criada.
SELECT * FROM resultado;

-- Deletando a view criada.
DROP VIEW resultado;

