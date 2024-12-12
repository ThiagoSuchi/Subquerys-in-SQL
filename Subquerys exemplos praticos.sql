-- 01 - Calcular a média dos salários dos funcionarios
select avg(salario) from funcionarios; -- 1285,71

-- 02 - Filtrar a tabela employees baseado no valor acima.
select*from funcionarios
where salario > 1285.71; -- jamais faça assim! o código 
						 -- tem que ser perfomático.

----------------------------------------------------------------------------------------------------

## O SUBQUERY EXISTE JUSTAMENTE PRA ISSO, SIMPLIFICAR OS CÓDIGOS
## NO CASO DOS CÓDIGOS ACIMA COM O SUBQUERY FICARIA ASSIM:

select*from funcionarios
where salario < 
		  (select avg(salario)
		   from funcionarios);
           
-- Exe01 - Liste os autores que possuem mais de um livro registrado na tabela livros_autores.
select a.nome
from autores a
where (select count(*)
	   from livros_autores la
	   where la.codigo_autor = a.codigo) > 1;
       
-- Exe02 - Liste os títulos dos livros publicados pela editora com o nome "Editora Exemplo". Use uma subquery para obter o código da editora.
select l.titulo
from livros l
where l.codigo_editora = 
				(select e.codigo_editora
				 from editoras e
				 where e.nome_editora = 'Saraiva');
        
select*from autores;


-- Exe04 - Identifique os nomes dos funcionários que cadastraram mais de cinco livros
select f.nome
from funcionarios f
where (select count(*)
	   from livros l
	   where l.CPF_funcionario = f.CPF) > 5;

	   
					  