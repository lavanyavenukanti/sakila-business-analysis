/*
====================================================================
Project : Sakila DVD Rental Business Analysis
File    : 02_customer_analysis.sql
Author  : Lavanya Venukanti

Description:
This module analyzes customer behavior, spending patterns,
payment activity, and geographic distribution to identify
valuable customers and support business decision-making.

Skills Demonstrated:
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- Aggregate Functions
- Subqueries
- ORDER BY
====================================================================
*/
-- =====================================================
-- Question 6
-- Business Question:
-- Who are the Top 10 customers by total amount spent?

select customer.customer_id, first_name, last_name, SUM(amount) as total_amount from customer
inner join payment
on customer.customer_id = payment.customer_id
group by first_name, last_name, customer_id
order by total_amount desc
limit 10;
-- =====================================================

-- =====================================================
-- Question 7
-- Business Question: 
-- Which customers have made more than 30 payments?

select count(payment_id) as total_payments, customer.customer_id, first_name, last_name 
from customer
inner join payment 
on customer.customer_id = payment.customer_id
group by customer_id, first_name, last_name
having count(payment_id) > 30
order by total_payments desc;
-- =====================================================

-- =====================================================
-- Question 8
-- Business Question: 
-- What is the average amount spent per customer?
select avg(customer_total) as avg_spent from 
(select customer_id, sum(amount) as customer_total from payment
group by customer_id) as customer_spent;
-- =====================================================

-- =====================================================
-- Question 9
-- Business Question: 
-- Which city has the highest number of customers?

select city, count(customer_id) as total_customers 
from customer 
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
group by city 
order by total_customers desc
limit 1;
-- =====================================================

-- =====================================================
-- Question 10
-- Business Question: 
-- List customers who have never made a payment.

select customer.customer_id, first_name, last_name, payment_id from customer
left join payment
on customer.customer_id = payment.customer_id
where payment_id is NULL;
-- =====================================================