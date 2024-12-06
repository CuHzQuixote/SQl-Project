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


SQL Queries:



Answer:





**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:
with product_rankings as (select al.country ,al.city, al."ProductName", sr.total_ordered,
rank() over (partition by al."ProductName" order by sr.total_ordered desc)as rank from
all_sessions al
join sales_report sr
on sr."productname" = al."ProductName"
where city != '(not set)'
and city !='not available in demo dataset'
and city is not null)
select distinct country,city, "ProductName", total_ordered
from product_rankings
order by total_ordered desc


Answer:

From what I have seen after inputting my query it seems that the ballpoint pen is the most popular product
across most countries. I'll have to come back and fix this later on



**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:



Answer:







