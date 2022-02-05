----------
--TIME FUNCTION
----------

--select current timestamp, format: YYYY-MM-DD HH:MM:SS
select current_timestamp

--extract is used to extract specified field
--let's say time_stamp value is 2022-02-01 10:25:34.20
--extract month from time_stamp -> February is 2
--extract day from the time_stamp -> 1
select current_timestamp, extract('quarter' from current_timestamp)

select current_timestamp, extract(minute from '2022-01-17 19:30:21'::timestamp)

select current_timestamp, to_char(current_timestamp, 'Month')

select current_timestamp, extract('month' from current_timestamp), date_trunc('month', current_timestamp)

select current_timestamp - '2021-12-18 13:11:20'

--interval can be used to make some operation on date-time data
select current_timestamp, current_timestamp + interval '30 days'

select current_timestamp, current_timestamp + interval '1 days 3 hours'


----------
--JOIN
----------

--JOIN is used to combine columns of 2 or more table
--join can be done because the relationship between tables
--relationship can be established using primary key and foreign key
--left table is defined in 'from' statement
--right table is defined in 'join' statement


--see all column (but, using * is actually not recommended)
select *
from datasource_sql_ds11.customer c 

--left join
--left table is customer table
--right table is transaction table
--ON statement is used to specified the primary key and foreign key
select
	c.id,
	c.city,
	c.email,
	c.gender,
	t.* 
from datasource_sql_ds11.customer c 
left join datasource_sql_ds11."transaction" t 
on c.id = t.customer_id 

--join on multiple table
select 
	c.id,
	sum(t.quantity)
from datasource_sql_ds11.customer c 
left join datasource_sql_ds11."transaction" t 
	on c.id = t.customer_id 
left join datasource_sql_ds11.product p 
	on t.product_id = p.id 
left join datasource_sql_ds11.store s 
	on t.store_id = s.id
group by 1
order by 2 desc
limit 10

----------
--UNION
----------

--UNION is used to combine rows of 2 or more table
--the table to be merged must have same number of columns
--make sure the order of column is also same

select id as nomor, email, gender 
from datasource_sql_ds11.customer c 
where email != 'Gmail'

union all 

select id, email, gender 
from datasource_sql_ds11.customer c 
where email = 'Gmail'