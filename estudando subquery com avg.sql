-- Subquery - selecionar os filmes que tem a maior duração
select title 
from film
where length = 
		 (select max(length)
		  from film);

select * from film;

-- Exercício 01 - Selecionar filmes com o tempo de aluguel acima da media AVG
select title, rental_duration
from film 
where rental_duration > 
                (select avg(rental_duration)
				 from film);
        
-- Média:
select avg(rental_duration)
from film;