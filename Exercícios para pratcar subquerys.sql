-- Subquerys: Uma subquery é uma consulta dentro de outra 
-- consulta. Ela ajuda a fazer operações complexas, buscando dados 
-- adicionais que a consulta principal usa como referência.

# Exemplo 01
SELECT nome 
FROM funcionarios 
WHERE salario > (SELECT AVG(salario) FROM funcionarios);

# Exemplo 02
select nome, (select count(*) from livros where
CPF_funcionarios = funcionarios.CPF) as total_cd_funcionarios
from funcionarios;

# Exemplo 03
select l.titulo, l.preco 
from livros as l
where l.codigo_editora = 
			  (select e.codigo_editora 
			   from editoras as e 
			   where e.nome_editora = "Pontes");
                            
# Exemplo 04
select l.titulo
from livros as l
where l.numero in 
		(select la.numero_livro
         from livros_autores as la
         where la.codigo_autor in
                  (select a.codigo
                   from autores as a));


-- Exercício 01: Faça uma consulta que retorne o nome dos funcionários que cadastraram os livros
select f.nome as Nome_dos_funcionários
from funcionarios as f
where f.CPF in
		(select l.CPF_funcionario
         from livros as l);

-- Exercício 02: Faça uma consulta que retorne o nome das editoras e a quantidade de livros por editora. 
select e.nome_editora, 
		(select count(*) from livros as l
         where l.codigo_editora = e.codigo_editora) as "Quantidade"
		 from editoras as e;
		
-- Exercício 03: Faça uma consulta que retorne o nome dos usuários que reservaram os livros.
select u.nome 
from usuarios as u
where u.CPF_usuario in
		(select l.CPF_usuarioReservar 
         from livros as l
         where l.CPF_usuarioReservar is not null);

-- Exercício 04: Faça uma consulta que retorne o nome dos autores dos livros e a quantidade por autor.
select a.nome,
		(select count(*) from livros_autores as la
         where la.codigo_autor = a.codigo) as "Quantidade de livros do autor"
         from autores as a;