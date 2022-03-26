with
	transaction_q4 as
	(
		select
			t.product_id,
			t.quantity
		from datasource_sql_ds11."transaction" t 
		where (extract('quarter' from t.created_at) = 4) and (t.store_id = 2)
	),
	
	sum_product_q4 as 
	(
		select 
			tq.product_id,
			sum(tq.quantity) barang_terjual
		from transaction_q4 tq
		group by 1
	),
	
	avg_product_q4 as
	(
		select avg(s.barang_terjual)
		from sum_product_q4 s
	)

select
	tq.product_id,
	tq.barang_terjual
from sum_product_q4 tq
where tq.barang_terjual > (select * from avg_product_q4)
order by 2 desc
limit 5