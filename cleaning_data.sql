What issues will you address by cleaning the data?


there were a lot of null values and columns that needed reformatting. 
I did most of the cleaning and reformatting that invlolved time/dates using excel.
the city, column in the all_sessions table had a lot of rows filled with "not available in demo dataset"
to get rid of those I would make sure I'd use
where city != "not available in demo dataset" to make sure that it would not affect my queries
also I would do the same for null values with is not null




Queries:
Below, provide the SQL queries you used to clean your data.
select *
from all_sessions
where city != 'not set'
and city is not null
and city != 'not available in demo dataset'
  */ I used these queries to get rid of all values that I could not use for cities/*
  
*/ I used this one to filter out all the other countries in the table to get the one I needed for my question. /*
 FROM all_sessions
where country = 'United States'
GROUP BY country, "ProductName","ProductCategory"

  
  
