-- Q1: Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1;

-- Q2: Which countries have the most Invoices?

SELECT COUNT(*) AS c, billing_country
FROM Invoice
GROUP BY billing_country
ORDER BY c DESC;

-- Q3: What are top 3 values of total invoice

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3;

-- Q4: Which city has the best customers? We would like to throw a 
-- promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of
-- invoice totals. Return both the city name & sum of all invoice totals.

SELECT SUM(total) AS invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC;

-- Q5: Who is the best customer? The customer who has spent the most
-- money will be declared the best customer. Write a query that returns
-- the person who has spent the most money.

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1;