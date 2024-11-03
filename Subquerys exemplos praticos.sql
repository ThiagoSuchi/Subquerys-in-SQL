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
           
           
           