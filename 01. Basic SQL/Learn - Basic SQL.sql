----------
--INSERT INTO
----------

--insert data from another table
insert into batch_11.employee_adhang
select * from batch_11.employee_digitalskola 

--insert data from manual input
insert into batch_11.employee_adhang
(
	employee_id, first_name, last_name,
	email, phone_number, hire_date,
	job_id, salary, commission_pct,
	manager_id, department_id
)
values
(
	9999, 'Adhang', 'Muntaha',
	'adhang', '089675759050', current_date,
	'DS', 9999, 0,
	99, 99
)

----------
--UPDATE
----------

--update specific data point
update batch_11.employee_adhang 
set
	first_name = 'Belajar',
	last_name = 'SQL',
	email = 'ds11_sql',
	hire_date = current_date,
	salary = 55123
where employee_id = 100

update batch_11.employee_adhang 
set
	first_name = 'Adhang',
	last_name = 'Muntaha',
	email = 'adhang',
	hire_date = current_date,
	salary = 99999
where employee_id = 101

update batch_11.employee_adhang 
set
	first_name = NULL,
	last_name = NULL,
	email = null,
	hire_date = null,
	salary = null
where employee_id = 102

--select all column to see the update
select * from batch_11.employee_adhang

--select specified column to see the update
select employee_id, first_name, last_name, salary
from batch_11.employee_adhang

----------
--ALTER TABLE
----------

--add new column (hobby)
alter table batch_11.employee_adhang
add hobby varchar(20)

--update the table to assign data on 'hobby' column
update batch_11.employee_adhang 
set hobby = 'Test'
where employee_id = 100 or employee_id = 101

--drop specified column name
alter table batch_11.employee_adhang
--drop column department_id 
--drop column manager_id
drop column commission_pct

--drop sepcified row
delete from batch_11.employee_adhang
where employee_id != 100

--clear all data from table
--column is still exist, but with empty data
--please be carefule because it can't be undone
truncate table batch_11.employee_adhang 

--delete table
--please be careful because it can't be undone
drop table batch_11.employee_adhang 