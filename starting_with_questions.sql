Answer the following questions and provide the SQL queries used to find the answer.

    
**Question 1: Which cities and countries have the highest level of transaction revenues on the site?**


SQL Queries:
select distinct city, country, "totalTransactionRevenue" 
from all_sessions
where city != 'not set'
and city != 'not available in demo dataset'
and "totalTransactionRevenue" is not null
order by "totalTransactionRevenue" desc


Answer:
the cities and countries witht the highest level of transaction revenues are the U.S with its top cities being Atlanta, Sunnyvale, and Los angeles, Isreal with Tel Aviv as its top city and Austrailia with Sydney as its top city



**Question 2: What is the average number of products ordered from visitors in each city and country?**


select al.country, al.city, al."productSku", al."ProductCategory",
avg (sr.total_ordered) as avg_orders
from all_sessions al
join sales_report sr
on sr."productSku" = al."productSku"
where city != '(not set)'
and city !='not available in demo dataset'
and al.city is not null
group by al."ProductCategory",al.city,al.country, al."productSku"
order by avg_orders desc



Answer:
I used this function to help create a table which shows the categories, skus, and total ordered. 





**Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


WITH country_categories AS (SELECT DISTINCT ON (country)country,
"ProductName", "ProductCategory",
COUNT("productSku") AS order_amount
FROM all_sessions
GROUP BY country, "ProductName","ProductCategory"
ORDER BY country, COUNT("productSku") 
DESC)
SELECT *
FROM country_categories
ORDER BY order_amount DESC
limit 5

with city_categories as (select distinct on(city) city, 
"ProductName", "ProductCategory", 
count("productSku") as order_amount
from all_sessions
where city != '(not set)'
and city !='not available in demo dataset'
and city is not null
group by city, "ProductName", "ProductCategory"
order by city, count("productSku") desc)
select * from city_categories
order by order_amount desc
limit 5



Answer: I made two different queries to find what the top categories were in each city/country and product within
that category. with this query you can see that overall it's youtube brand merch that is the most popular
category by country. but when you check by country it's items by nest which are the most commonly bought





**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:

WITH city_orders AS (SELECT DISTINCT ON (city)city, "ProductName", 
COUNT("productSku") AS order_amount
FROM all_sessions
WHERE city != 'not available in demo dataset' 
AND city IS NOT NULL
and city !='(not set)'
GROUP BY city, "ProductName"
ORDER BY city, COUNT("productSku") 
DESC)
SELECT *
FROM city_orders
ORDER BY order_amount DESC
limit 5


WITH country_orders AS (SELECT DISTINCT ON (country)country,
"ProductName",
COUNT("productSku") AS order_amount
FROM all_sessions
WHERE city != 'not available in demo dataset' 
AND city IS NOT NULL
and country !='(not set)'
GROUP BY country, "ProductName"
ORDER BY country, COUNT("productSku") 
DESC)
SELECT *
FROM country_orders
ORDER BY order_amount DESC
limit 5






Answer:

I made 2 seperate queries. one for cities and another for countries with this I was able to get a table which would show which Sku showed up the most for each country and city and how often it did. 
one pattern I noticed after looking at both tables was overall it was clothing items which were appearing in the highest 
quantities. I used a cte because it could create a table that I could filter data out of to get the answer I specifically 
wanted.



**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:

select ("totalTransactionRevenue"/1000000) as 
totaltransaction_fixed,country, "ProductName",
count("productSku") as order_amount
from all_sessions
where "totalTransactionRevenue" is not null
group by country, "totalTransactionRevenue", "ProductName"
order by order_amount desc

select ("totalTransactionRevenue"/1000000) as totaltransaction_fixed, city
, "ProductName", count("productSku") as order_amount
from all_sessions
where "totalTransactionRevenue" is not null
and city !='(not set)'
and city != 'not available in demo dataset'
and city is not null
group by city, "totalTransactionRevenue","ProductName"
order by order_amount desc

Answer:

with these queries I wrote you can find the products which made the most money for each city and country by the amount
of times they were ordered. this way you can see what places are buying the most of certain products or categories





