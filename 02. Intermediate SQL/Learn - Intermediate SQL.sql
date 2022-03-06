--list of SQL statement on this session
select 
from 
where
group by 
having 
order by 
limit 

----------
--SELECT
----------

--select specified column with alias name (using AS)
select
	order_id as "ID untuk order",
	sales as "Total sales",
	profit as "Profit",
	quantity as "Jumlah pembelian",
	category as "Kategori",
	sub_category as "Sub kategori",
	cost as "Biaya",
	total_cost as "Total biaya",
	total_profit as "Total profit" 
from datasource.order_details_csv

--select unique value from specified column
select
	distinct category,
--	sub_category 
from datasource.order_details_csv odc 
order by category 

SELECT order_id
FROM datasource.order_details_csv odc 

----------
--STRING
----------

--string concatenate
SELECT 'US-' || order_id 
FROM datasource.order_details_csv odc 

SELECT DISTINCT char_length('US-' || order_id) 
FROM datasource.order_details_csv odc 

--convert to uppercase
SELECT UPPER('Us-' || order_id) 
FROM datasource.order_details_csv odc 

SELECT DISTINCT POSITION('2011' IN order_id)
FROM datasource.order_details_csv odc 

--SELECT substring('Indonesia' FROM 3 FOR 4) 
SELECT distinct(SUBSTRING(order_id FROM POSITION('2011' IN order_id) FOR 4))
FROM datasource.order_details_csv odc 

SELECT LEFT (order_id, 2)
FROM DATASOURCE.ORDER_DETAILS_CSV ODC 

select UPPER(LEFT('doni',1)) || SUBSTRING('doni' from 2 for (CHAR_LENGTH('doni') - 1))

select UPPER(LEFT(name,1)) || SUBSTRING(name from (CHAR_LENGTH(name) - 1) for 2)

----------
--AGGREGATION
----------

--aggregate specified column
select max(total_profit), min(total_profit), avg(total_profit), sum(total_profit)
from datasource.order_details_csv odc 

--median is not built in function, but it can be done using percentile_cont() function
select percentile_cont(0.5) within group (order by total_profit)
from datasource.order_details_csv odc 

----------
--CASE-WHEN
----------

--case-when is used to make selection, but with some action based on the condition
select 
	category,
	case
		when lower(category) = 'furniture' then 'C1'
		when lower(category) = 'office supplies' then 'C2'
		when lower(category) = 'technology' then 'C3'
--		else 'XXX'
	end 
from datasource.order_details_csv odc 

----------
--WHERE
----------

--where statement is used to filter data

--select all specified column
--where the category is 'Furniture' and sub_category is 'Chairs' or 'Tables'
--we can use relational operator (such as 'greater than')
--and use logical operator (such as 'or', 'and') to filter our data
select
	order_id,
	category,
	sub_category ,
	quantity ,
	sales ,
	profit 
from datasource.order_details_csv odc 
where 
	category = 'Furniture' and 
	(
		sub_category = 'Chairs' or
		sub_category = 'Tables'
	)

--it's produce same query with the previous script, but with IN statement
--IN statement can be used to combine more item
select
	order_id,
	category,
	sub_category ,
	quantity ,
	sales ,
	profit 
from datasource.order_details_csv odc 
where 
	category = 'Furniture' and 
	sub_category in ('Chairs','Tables')

----------
--GROUP BY
----------

--group by is used to summarize data (using aggregation) based on specified column
select
	category,
	sub_category ,
	sum(quantity),
	sum(sales),
	sum(profit)
from datasource.order_details_csv odc 
where
	quantity >= 2 and quantity <= 3
group by category, sub_category 

--we can use number to mention column name on the group by
--the order of number is based on column order in select statement
select
	category,
	sub_category ,
	sum(quantity),
	sum(sales),
	sum(profit)
from datasource.order_details_csv odc 
where
	quantity >= 2 and quantity <= 3
group by 1, 2

----------
--HAVING
----------

--having is like 'where' statement, to filter data
--but rather than filtering single data point, 'having' is used to filter on aggregated data
--so we can say that 'having' is paired with 'group by'
select
	category,
	sub_category ,
	sum(quantity) sum_qty,
	sum(sales) sum_sales,
	sum(profit) sum_profit
from datasource.order_details_csv odc 
where
	quantity >= 2 and quantity <= 3
group by 1, 2
having sum(quantity) > 400
order by category, sub_category 

--it's same with previous script
--but using number for column representation on 'group by' and 'order by' statement
select
	category,
	sub_category ,
	sum(quantity) sum_qty,
	sum(sales) sum_sales,
	sum(profit) sum_profit
from datasource.order_details_csv odc 
where
	quantity >= 2 and quantity <= 3
group by 1, 2
having sum(quantity) > 400
order by 1, 2

select
	category,
	sub_category ,
	sum(quantity) sum_qty,
	sum(sales) sum_sales,
	sum(profit) sum_profit
from datasource.order_details_csv odc 
where
	quantity >= 2 and quantity <= 3
group by 1,2
having sum(quantity) > 1000
order by 1,2