SELECT * FROM sakila.rental;

SELECT * FROM customer;

SELECT * FROM actor;

SELECT * FROM film;

-- sakila sample codes
-- Date is already in correct format and you might apply functins to it such as DAY, MONTH, YEAR 
-- 1. Find Overdue DVDs

-- To create such a list, search the rental table for films with a return date that is NULL
-- and where the rental date is further in the past than the rental duration specified in the film table.
-- If so, the film is overdue and we should produce the name of the film along with the customer name and phone number.
-- The INTERVAL ... DAY syntax is used to add this number of days to rental_date, calculating the due date
SELECT CONCAT(customer.last_name, ', ', customer.first_name) AS customer,
           address.phone, film.title
           FROM rental  JOIN customer ON rental.customer_id = customer.customer_id
            JOIN address ON customer.address_id = address.address_id
            JOIN inventory ON rental.inventory_id = inventory.inventory_id
            JOIN film ON inventory.film_id = film.film_id
           WHERE rental.return_date IS NULL
           AND rental_date + INTERVAL film.rental_duration DAY < CURRENT_DATE()
           ORDER BY title
           LIMIT 5;
           

-- 2. Get the Inventory Count for Each Film

SELECT f.title, COUNT(i.inventory_id) AS inventory_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.title;

SELECT * FROM inventory;

-- 3. List Customers Who Rented a Specific Film

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

 -- 4. Find the Most Frequently Rented Films


SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

-- 5. Find Films by a Specific Actor

SELECT f.film_id, f.title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JULIA' AND a.last_name = 'BARRYMORE';

