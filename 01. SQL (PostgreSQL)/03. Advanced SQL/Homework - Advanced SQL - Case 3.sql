--Query 1 region saja (Jakarta)

with
	customer_region as
	(
		select
				c.id,
			c.gender 
		from datasource_sql_ds11.customer c 
		where c.city = 'Jakarta'	
	)
select
	s.type,
	cr.gender,
	sum(t.quantity) barang_terjual
from customer_region cr
join datasource_sql_ds11."transaction" t 
	on cr.id = t.customer_id 
join datasource_sql_ds11.store s
	on t.store_id = s.id
group by 1, 2
order by 3 desc
limit 2

--Query seluruh region

select
	s."type",
	c.gender,
	sum(t.quantity) as total_barang_terjual,
	sum(t.quantity)
		filter(where c.city = 'Jakarta') as barang_terjual_jakarta,
	sum(t.quantity)
		filter(where c.city = 'Tangerang') as barang_terjual_tangerang,
	sum(t.quantity)
		filter(where c.city = 'Depok') as barang_terjual_depok,
	sum(t.quantity)
		filter(where c.city = 'Bogor') as barang_terjual_bogor
from datasource_sql_ds11.customer c 
join datasource_sql_ds11."transaction" t 
	on c.id = t.customer_id 
join datasource_sql_ds11.store s 
	on t.store_id = s.id 
group by 1, 2
order by 3 desc
limit 2