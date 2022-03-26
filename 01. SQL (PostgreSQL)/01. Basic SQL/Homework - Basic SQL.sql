--HOMEWORK 5 - BASIC SQL


CREATE TABLE IF NOT EXISTS batch_11.entropy_team
(
	id INT PRIMARY KEY,
	nama_depan VARCHAR(20) NOT NULL,
	nama_belakang VARCHAR(20) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	linkedin VARCHAR(255) UNIQUE NOT NULL,
	pekerjaan_impian VARCHAR(255) NOT NULL,
	alasan_ikut_digitalskola VARCHAR(255) NOT NULL
)


INSERT INTO batch_11.entropy_team
	(
		id, nama_depan, nama_belakang, email,
		linkedin,
		pekerjaan_impian,
		alasan_ikut_digitalskola
	)
values
	(
		1, 'Adhang', 'Muntaha', '@gmail.com',
		'https://www.linkedin.com/in/adhangmuntaha/',
		'Data Scientist',
		'upgrade skill, menambah koneksi, portofolio, dan pengalaman'
	),
	
	(
		2, 'Iwan', 'Wahyu', '@gmail.com',
		'http://www.linkedin.com/in/iwan-wahyu-setyawan-506809183',
		'CEO',
		'update skill'
	),
	
	(
		3, 'Marcellina', 'Alvita F', '@gmail.com',
		'https://www.linkedin.com/in/marcellina-alvita-faustina-63a284226',
		'Engineer',
		'Update skill'
	),
	
	(
		4, 'Ramadhan', 'Luthfan M', '@gmail.com',
		'https://www.linkedin.com/in/luthfan-mahathir-91369b18b',
		'Aquaculturist',
		'update skill'
	),
	
	(
		5, 'Aziz', 'Fauzi', '@gmail.com',
		'https://www.linkedin.com/in/aziz-fauzi-a6904711b',
		'Data Scientist',
		'upgrade skill, menambah penghasilan'
	)

	
	
	
	
--update batch_11.entropy_team 
--set alasan_ikut_digitalskola = 'upgrade skill, menambah koneksi, portofolio, dan pengalaman'
--where id = 1
	
--delete from batch_11.entropy_team where id = 1
--drop table batch_11.entropy_team 