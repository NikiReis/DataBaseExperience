drop view v_today;
create or replace view v_today(amanha) as select current_date();
select * from v_today;

desc v_today;
show databases;
use information_schema;
show tables;
select * from views;

-- exemplo de seguranca 
Grant priv_type [column_list] on [object_type] to user;

-- outro exemplo de seguranca
Create View active_custumer_vw
(custumer_id,first_name,last_name,email)
As 
Select custumer_id,first_name,last_name,
concat(substr(email,1,2)'*****',substr(email,-4))email 
From custumer where active = 1;

-- Exemplo de Agregacao
Create View sales_by_film_category
As Select c.name As category,Sum(p.amount)
As total_sales From payment as p
inner join rental As r on p.rental_id = r.rental_id
inner join inventory As i on r.inventory_id = i.inventory_id
inner join film As f on i.film_id = f.film_id
inner join film_category As fc on f.film_id = fc.film_id
inner join category As c On fc.category_id = c.category_id
group by c.name order by total_sales desc; 

-- mais exemplos de view
-- retorna as estatiscas de um filme 
create view film_stats
as 
select f.film_id,f.title,f.description,f.rating,
(select c.name from category c
		inner join film_category fc
        on c.category_id = fc.category_id
where fc.film_id = f.film_id) category_name,
(select count(*) from film_actor fa where fa.film_id = f.film_id
) num_actors,
(select count(*) from inventory i where i.film_id = f.film_id
)inventory_cont,
		(select count(*) from inventory i 
        inner join rental r on i.inventory_id = r.inventory_id
        where i.film_id = f.film_id
) num_rentals from film f;
select * from film_stats;

-- exemplo de juncao
create view payment_all (payment_id,custumer_id,staff_id,
rental_id,amount,payment,payment_date,last_update)
as 
select payment_id,custumer_id,staff_id,rental_id,
amount,payment_date,last_update from payment_historic
union all
select payment_id, custumer_id,staff_id,rental_id,
amount,payment_date,last_update from payment_current;
select * from payment_all;