-- Joins homework question 1
select first_name, last_name, district 
from customer 
inner join address 
on customer.address_id = address.address_id
where district = 'Texas';

--Joins homework question 2
select first_name, last_name, amount
from customer 
inner join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;

--Joins homework question 3
select first_name, last_name
from customer 
where customer_id in(
	select customer_id from payment where amount > 175
);

--Joins homework question 4
select first_name, last_name, city, country
from customer 
inner join address
on customer.address_id = address.address_id 
inner join city 
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id
where country = 'Nepal';

--Joins homework question 5
select first_name, last_name, count(staff.staff_id) as transactions
from staff 
inner join payment
on staff.staff_id = payment.staff_id
group by staff.first_name, staff.last_name
order by transactions desc;

--Joins homework question 6
select rating, count(rating) as film_amount 
from film 
group by rating;

--Joins homework question 7
select first_name, last_name
from customer 
where customer_id in(
	select customer_id from payment where amount > 6.99 group by customer_id having count(amount) = 1
);

--Joins homework question 8
select * from rental;
select count(amount) as free_rentals
from payment
where amount = 0;
