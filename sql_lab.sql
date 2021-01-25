use sakila;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

select title, length, rating, rank() over (partition by rating order by length) as "Ranks"
from film
WHERE length not in ('',' ', 0);

-- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, rating and the rank.
select title, length, rating,RANK() OVER (partition by length order by rating) as rank_length
from film
where length not in ('', 0, ' ');


-- How many films are there for each of the categories in the category table. 

SELECT c.name, count(film_id) as number_of_films
from film_category as f
join category as c
on c.category_id=f.category_id
group by c.name;


-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(f.film_id) as number_of_films 
from actor as a
join film_actor as f
on a.actor_id=f.actor_id
group by a.last_name;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name,  count(r.rental_id) as total_rentals 
from customer as c
join rental as r
on c.customer_id=r.customer_id
group by c.last_name
order by total_rentals DESC;


-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. 
-- Give it a try. We will talk about queries with multiple join statements later in the lessons.
SELECT 

select a.account_id, a.frequency, l.loan_id, l.amount, l.duration, l.payments, l.status
from bank.account a
join bank.loan l 
on a.account_id = l.account_id
where l.duration = 12
order by l.payments desc
limit 10;
