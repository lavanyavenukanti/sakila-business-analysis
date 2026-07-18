/*
====================================================================
Project : Sakila DVD Rental Business Analysis
File    : 04_film_inventory_analysis.sql
Author  : Lavanya Venukanti

Description:
This module analyzes film inventory, rental performance,
film categories, and movie ratings to identify popular
films and profitable categories.

Skills Demonstrated:
- INNER JOIN
- LEFT JOIN
- GROUP BY
- Aggregate Functions
- ORDER BY
- LIMIT
====================================================================
*/
-- =====================================================
-- Question 1
-- Business Question:
-- Which film categories generate the highest total revenue?
SELECT category.category_id, category.name, SUM(amount) as highest_total_revenue from payment
INNER JOIN rental
ON payment.rental_id = rental.rental_id
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film 
ON inventory.film_id = film.film_id
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category_id, name
order by SUM(amount) DESC
LIMIT 3; 
-- =====================================================

-- =====================================================
-- Question 2
-- Business Question:
-- Which are the Top 10 most rented films?
SELECT title, COUNT(rental.rental_id) AS total_rentals FROM rental
JOIN inventory
ON rental.inventory_id = inventory.inventory_id
JOIN film
ON inventory.film_id = film.film_id
GROUP BY title, film.film_id
ORDER BY total_rentals DESC
LIMIT 10;
-- =====================================================

-- =====================================================
-- Question 3
-- Business Question:
-- Which films have never been rented?
SELECT title, film.film_id FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
LEFT JOIN rental
ON inventory.inventory_id = rental.inventory_id
WHERE rental_id IS NULL;
-- =====================================================

-- =====================================================
-- Question 4
-- Business Question:
-- How many films belong to each category?

SELECT count(film.film_id) AS total_films, name FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY name
ORDER BY total_films DESC;
-- =====================================================

-- =====================================================
-- Question 5
-- Business Question:
-- Which film rating (G, PG, PG-13, R, NC-17) has the highest number of rentals?
SELECT rating, COUNT(rental.rental_id) AS total_rentals FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
INNER JOIN rental
ON inventory.inventory_id = rental.inventory_id
GROUP BY rating
ORDER BY total_rentals DESC;
/*
====================================================================
End of Module 4 - Film & Inventory Analysis
====================================================================
*/