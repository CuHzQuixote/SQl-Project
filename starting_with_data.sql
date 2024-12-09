Question 1: find the 5 most popular items bought in the US

SQL Queries: 
WITH USA_Items AS (SELECT country,
"ProductName", "ProductCategory",
COUNT("productSku") AS order_amount
FROM all_sessions
where country = 'United States'
GROUP BY country, "ProductName","ProductCategory"
ORDER BY country, COUNT("productSku") 
DESC)
SELECT *
FROM USA_Items
ORDER BY order_amount DESC
limit 5

Answer: 
the 22oz youtube bottle infuser, white google short sleeve hero tee, nest indoor camera, nest outdoor camera, google vintage tee
black were the top 5 items bought in the united states. 


Question 2: what was the most popular categories of item bought in Atlanta?

SQL Queries:
WITH Atlanta_Items AS (SELECT city,
"ProductName", "ProductCategory",
COUNT("productSku") AS order_amount
FROM all_sessions
where city = 'Atlanta'
GROUP BY city, "ProductName","ProductCategory"
ORDER BY city, COUNT("productSku") 
DESC)
SELECT *
FROM Atlanta_Items
ORDER BY order_amount DESC
limit 5


Answer:

the nest smoke alarm, youtube decals, heather google short sleeve shirt, android engineer tee shirt charcoal
and androind vintage henley were the most bought items in atlanta

Question 3: In which cities were google items the most popular?

SQL Queries:
WITH google_cities AS (SELECT distinct on (city)city,
"ProductName", "ProductCategory",
COUNT("productSku") AS order_amount
FROM all_sessions
where city != 'not available in demo dataset'
and city is not null
and city !='(not set)'
and "ProductName" like '%Google%'
GROUP BY city, "ProductName","ProductCategory"
ORDER BY city, COUNT("productSku") 
DESC)
SELECT *
FROM google_cities
ORDER BY order_amount DESC
limit 5


Answer:
in order
Mountainview, New York, Hyderabad, san fransisco, and san jose were the cities that bought the most items related to google.

Question 4: 

SQL Queries:

Answer:



Question 5: 

SQL Queries:

Answer:
