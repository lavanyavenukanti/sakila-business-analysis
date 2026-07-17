/*Find customers who placed an order greater than the average order amount.*/

select avg(amount) from orders;

select customer_id, amount from orders
where amount> (select avg(amount) from orders);

/*Question 2
Find the customer(s) who placed the highest value order.*/

select max(amount) from orders;

select customers.customer_id, customer_name, amount from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount = (select max(amount) from orders);

select customer_id, amount from orders
where amount >= (select max(amount) from orders);

/*Question 3
Find orders whose amount is greater than Rahul's average order amount.*/

select avg(amount) from orders ;

select customer_name, customer_id from customers where customer_name = 'rahul';
select avg(amount) from orders where customer_id = '1';

select * from orders
where amount > (select avg(amount) from orders where customer_id = 
(select customer_id from customers where customer_name = 'rahul'));

select customer_name, customers.customer_id, order_id, amount, order_date from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount > (select avg(amount) from orders where customer_id =
(select customer_id from customers where customer_name = 'rahul'));
/*Question 4
Find customers who have placed an order equal to the minimum order amount.*/

select customer_id, amount from orders
where amount = ( select min(amount) from orders);

select customer_name, customers.customer_id, orders.amount from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount = ( select min(amount) from orders);

/*Question 5
Find orders placed after the earliest order date.*/

select order_id, order_date from orders
order by order_date asc;

select * from orders where order_date > (select min(order_date) from orders);

/* Q1. Find all orders whose amount is greater than the average order amount.*/

select * from orders;
select avg(amount) from orders;

select customer_name, customers.customer_id, amount from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount > (select avg(amount) from orders);

/* Q2. Find the order(s) with the lowest amount.*/

select min(amount) from orders;

select * from orders
where amount < (select max(amount) from orders);

select min(order_date) from orders;

select * from orders where order_date < (select max(order_date) from orders);

select customer_name, customer_id from customers
where customer_name = 'rahul';

select customer_id, max(amount) from orders
where customer_id = 1;

select customer_name, customers.customer_id, amount from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount > (select max(amount) from orders
where customer_id = (select customer_id from customers
where customer_name = 'rahul'));

/* Q6. Find all orders whose amount is less than Rahul's highest order amount.*/

select customer_name, customer_id from customers 
where customer_name = 'rahul';

select max(amount) from orders where customer_id = 1;

select customer_name, customers.customer_id, amount from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount < (select max(amount) from orders where customer_id = 
(select customer_id from customers 
where customer_name = 'rahul'));

/* Find all orders whose amount is exactly equal to Rahul's highest order amount.*/

select customer_name, customers.customer_id, amount from customers
inner join orders
on customers.customer_id = orders.customer_id
where amount = (select max(amount) from orders where customer_id = 
(select customer_id from customers 
where customer_name = 'rahul'));

/*Find the customer(s) who placed the earliest order.*/

select min(order_date) from orders;

select customer_name, order_date from customers
inner join orders
on customers.customer_id = orders.customer_id
where order_date = (select min(order_date) from orders);

select customer_name, customer_id, order_id from customers
inner join orders
on customers.customer_id = orders.customer_id 