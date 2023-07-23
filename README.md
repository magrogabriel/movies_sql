# SQL Queries

Olá. O intuito desse projeto é analisar de forma simples as informações contidas nas tabelas do projeto.
Para isso, utilizei a linguagem **SQL** e o SGBD **MySql**.
<hr>

### Estrutura do projeto
**O projeto é composto por 5 tabelas no formado .sql, sendo elas:**
1. `hashtagmovie_alugueis.sql`
2. `hashtagmovie_atores.sql`
3. `hashtagmovie_atuacoes.sql`
4. `hashtagmovie_clientes.sql`
5. `hashtagmovie_filmes.sql`

**Nessa primeira análise, nem todas as tabelas foram utilizadas, ficando para uma análise mais complexa posteriormente.**
<hr>

### Explicação das queries

1) Visualizei o conteúdo de todas as tabelas para uma análise mais geral das informações:

```
SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;
```

2) Criei agrupamentos de algumas informações da tabela **filmes**. As informações foram a média arredondada do preço do aluguel dos filmes `(AVG(preco_aluguel), 2)` e a contagem total de filmes `COUNT(*)`. FInalmente essas informações foram agrupadas por gênero `(GROUP BY genero)`:

```
SELECT
  genero,
  round(AVG(preco_aluguel), 2) as preco_medio,
  COUNT(*) as qtde_filmes
FROM filmes
GROUP BY genero;
```

&emsp; Uma nova consulta foi feita, mas dessa vez retornando somente as informações pertencentes ao ano de 2011 `(WHERE ano_lancamento = 2011)`:

```
SELECT
  genero,
  round(AVG(preco_aluguel), 2) as preco_medio,
  COUNT(*) as qtde_filmes
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero;
```

3) Criei uma subquery que retorna todos os aluguéi com notas acima da média `(SELECT AVG(nota) FROM alugueis)`:
```
SELECT 
  * 
FROM alugueis
WHERE nota >= (SELECT AVG(nota) FROM alugueis);
```

4) Criei uma <i>view</i> chamada `resutado` para armazenar a query feita no tópico `2`:
```
CREATE VIEW resultado AS
SELECT
  genero,
  round(AVG(preco_aluguel), 2) as preco_medio,
  COUNT(*) as qtde_filmes
FROM filmes
GROUP BY genero;
```

5) Selecionei a <i>view</i> resultado para analizar as informações:
```
SELECT * FROM resultado;
```

6) Deletei a <i>view</i> com `DROP VIEW`:
```
DROP VIEW resultado;
```
<hr>

**Apesar de simples, as queries serviram para fundamentar e embasar o conhecimento que vem sendo construindo em SQL por mim. Obrigado por ler até aqui e até logo.**
