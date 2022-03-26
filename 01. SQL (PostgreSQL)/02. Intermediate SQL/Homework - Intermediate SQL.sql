--HOMEWORK 6 - INTERMEDIATE SQL

create table if not exists batch_11.test_adhang
(
	id_peserta int primary key,
	kelas int not null,
	nilai int not null
)

insert into batch_11.test_adhang values
(1, 1, 50),
(2, 1, 70),
(3, 2, 90),
(4, 2, 70),
(5, 3, 100),
(6, 3, 80)

select
	kelas,
	avg(nilai) as avg_nilai,
	sum(nilai) as sum_nilai
from batch_11.test_adhang ta 
group by 1
order by 1

SELECT
	id_peserta,
	kelas,
	nilai,
	avg(nilai) OVER (partition by kelas) AS avg_nilai,
	sum(nilai) OVER (partition by kelas order by id_peserta) AS sum_nilai
FROM batch_11.test_adhang ta 


select
	id_peserta ,
	case 
		when nilai in
		(
			select nilai
			from batch_11.test_adhang ta 
			where nilai >= (select avg(nilai) from batch_11.test_adhang)
		)	
		then 'Lulus'
		else 'Tidak lulus'
	end as kelulusan
from batch_11.test_adhang ta 


with
t1 as
(
	select avg(nilai)
	from batch_11.test_adhang ta 
),
t2 as
(
	select nilai
	from batch_11.test_adhang ta 
	where nilai >= (select * from t1)
)

select
	id_peserta ,
	case 
		when nilai in (select * from t2) then 'Lulus'
		else 'Tidak lulus'
	end as kelulusan
from batch_11.test_adhang ta 

select *, avg(nilai) OVER (partition by kelas) AS avg_nilai
from batch_11.test_adhang ta 

select
	kelas,
	avg(nilai) as avg_nilai
from batch_11.test_adhang ta
group by 1
having avg(nilai) > 70