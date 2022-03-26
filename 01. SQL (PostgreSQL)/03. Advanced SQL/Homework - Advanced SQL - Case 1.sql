with 
	customer_female as
	(
		select c.id
		from datasource_sql_ds11.customer c
		where c.gender = 'Female' and c.city = 'Jakarta' and c.email = 'Gmail'
	)
	
select
	cf.id customer_id, 
	count(t.*) as jumlah_transaksi
from customer_female cf
join datasource_sql_ds11."transaction" t 
	on cf.id = t.customer_id 
group by 1
having count(t.*) >= 10
