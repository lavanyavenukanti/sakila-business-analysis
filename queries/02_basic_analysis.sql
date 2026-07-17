/* =====================================================
   Module 1 - Basic Business Analysis
   ===================================================== */

/* Question 1
How many customers does the company have? */
SELECT COUNT(*) AS total_customers
FROM customer;

/* Question 2
How many films are available? */
SELECT COUNT(*) AS available_films
FROM film;

/* Question 3
How many rentals have been made? */
SELECT COUNT(*) AS total_rentals
FROM rental;

/* Question 4
What is the total revenue earned by the company? */
SELECT SUM(amount) AS total_revenue
FROM payment;

/* Question 5
How many stores does the company operate? */
SELECT COUNT(*) AS total_stores
FROM store;