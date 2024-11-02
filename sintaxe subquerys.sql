-- Exemplo de sintaxes:

# Consulta de livro de acordo com sua editora:
select l.titulo, l.preco, l.codigo_editora
from livros l
where codigo_editora = 
			(select codigo_editora
			 from editoras
			 where nome_editora = 'Pontes');
			
select*from editoras;
select*from livros;

# Atualizando o preco de um livrocom:
update livros
set preco = preco * 1.12
where codigo_editora = 
			(select codigo_editora
			 from editoras
			 where nome_editora = 'Pontes');
