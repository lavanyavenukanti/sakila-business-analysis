/*
====================================================================
Project : Sakila DVD Rental Business Analysis
File    : 01_basic_analysis.sql
Author  : Lavanya Venukanti

Description:
This module performs basic exploratory analysis on the Sakila
DVD Rental database to understand the overall size and
performance of the business.

Skills Demonstrated:
- Aggregate Functions
- COUNT()
- SUM()
====================================================================
*/

-- ================================================================
-- Query 1: Total Number of Customers
-- Business Question:
-- How many customers are registered in the DVD rental system?
-- ================================================================

SELECT COUNT(*) AS total_customers
FROM customer;

-- ================================================================
-- Query 2: Total Number of Films
-- Business Question:
-- How many films are available for rental?
-- ================================================================

SELECT COUNT(*) AS available_films
FROM film;

-- ================================================================
-- Query 3: Total Number of Rentals
-- Business Question:
-- How many rentals have been completed?
-- ================================================================

SELECT COUNT(*) AS total_rentals
FROM rental;

-- ================================================================
-- Query 4: Total Revenue
-- Business Question:
-- What is the total revenue generated from all rentals?
-- ================================================================

SELECT SUM(amount) AS total_revenue
FROM payment;

-- ================================================================
-- Query 5: Total Number of Stores
-- Business Question:
-- How many stores does the company operate?
-- ================================================================

SELECT COUNT(*) AS total_stores
FROM store;