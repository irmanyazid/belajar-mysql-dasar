CREATE TABLE products(
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT,
price INT UNSIGNED NOT NULL,
quantity INT UNSIGNED NOT NULL DEFAULT 0,
created_by TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

INSERT INTO products (id, name, price, quantity) 
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

INSERT INTO products (id, name, description, price, quantity) 
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100);

INSERT INTO products (id, name, price, quantity) 
VALUES ('P0003', 'Mie Ayam Ceker', 20000, 100),
('P0004', 'Mie Ayam Original', 25000, 100),
('P0005', 'Mie Ayam Yamin', 15000, 100);

select * from products;

select id, name, price, quantity from products;

alter table products
add primary key (id);

select * from products where quantity = 100;

select * from products where price = 20000;

desc products;

show tables;

alter table products
add column category enum('Makanan','Minunman','lain-lain')
after name;

select * from products where id = 'P0001'; 

update products 
set category = 'Makanan'
where id = 'P0001';

update products
set category = 'Makanan',
description = 'Mie Ayam + Ceker'
where id = 'P0003';

update products 
set category = 'Makanan'
where id = 'P0001';

update products 
set price = price + 5000
where id = 'P0005';

INSERT INTO products (id, name, price, quantity) 
VALUES ('P0009', 'Mie Ayam Original', 15000, 100);

/*Menghapus Data*/
delete from products
where id = 'P0009';

/*Cara untuk membuat alias untuk kolom*/
select id as Kode,
name as Nama,
category as Kategori,
price as Harga,
quantity as Jumlah
from products; 

/*Cara untuk membuat alias untuk tabel*/
select p.id as Kode,
	p.name as Nama,
	p.category as Kategori,
	p.price as Harga,
	p.quantity as Jumlah
from products as p; 

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0006', 'Bakso Rusuk', 'Makanan', 25000, 200),
       ('P0007', 'Es Jeruk', 'Minuman', 10000, 300),
       ('P0008', 'Es Campur', 'Minuman', 15000, 500),
       ('P0009', 'Es Teh Manis', 'Minuman', 5000, 400),
       ('P0010', 'Kerupuk', 'Lain-Lain', 2500, 1000),
       ('P0011', 'Keripik Udang', 'Lain-Lain', 10000, 300),
       ('P0012', 'Es Krim', 'Lain-Lain', 5000, 200),
       ('P0013', 'Mie Ayam Jamur', 'Makanan', 20000, 50),
       ('P0014', 'Bakso Telor', 'Makanan', 20000, 150),
       ('P0015', 'Bakso Jando', 'Makanan', 25000, 300);

alter table products
modify category enum('Makanan','Minunman','lain-lain') after name;

select * from products;

desc products;

select * from products where category = 'makanan';

select * from products where quantity >= 100;

alter table products
modify category enum('Makanan','Minuman','lain-lain');

/*MENCARI DATA DENGAN OPERATOR AND*/
select * from products 
where quantity > 100 AND price > 15000;

/*MENCARI DATA DENGAN OPERATOR OR*/
select * from products 
where category = 'Makanan' OR price < 20000;

/*MENCARI DATA DENGAN OPERATOR OR AND DENGAN PRIORITAS KURUNG()*/
select * from products
where (category = 'Makanan' OR price < 20000) AND quantity > 200;

/*MENCARI MENGGUNAKAN LIKE OPERATOR*/
select * from products
where name LIKE '%Mie%';

select * from products
where  name Like '%M';

/*MENCARI MENGGUNAKAN NULL OPERATOR*/
select * from products
where description IS NULL;

select * from products
where description IS NOT NULL;

/*MENCARI MENGGUNAKAN BETWEEN OPERATOR*/
select * from products
where price BETWEEN 10000 AND 20000;

select * from products
where price NOT BETWEEN 10000 AND 20000;

/*MENCARI MENGGUNAKAN IN OPERATOR*/
select * from products
where category IN ('Makanan','Minuman');

select * from products
where category NOT IN ('Makanan','Minuman');

/*MENGURUTKAN DATA*/
select * from products
ORDER BY price ASC, id DESC;

/*MEMBATASI HASIL QUERY*/
select * from products
ORDER BY id LIMIT 0, 5; 

/*SKIP HASIL QUERY*/
select * from products
ORDER BY id LIMIT 5, 5;

/*MENAMPILKAN MENGHILANGKAN DATA DUPLIKAT*/
select distinct category FROM products;

/*MENGGUNAKAN ARITHMETIC OPERATOR*/
select id,name, price, price 
DIV 1000 AS 'PRICE IN K' from products;

/*MENGGUNAKAN MATHEMATICAL FUNCTION*/
select id, COS(price), SIN(price), TAN(price) from products; 

select * from products;

/*MENGGUNAKAN STRING FUNCTION*/
select id, upper(name) as 'name',
	lower(category) as 'category',
    length(name) as 'panjang karakter', 
    curtime() as 'time'
from products;

/*MENAMBAHKAN KOLOM DATE DAN TIMESTAMP*/
select id, created_by, 
extract(YEAR FROM created_by) as year,
extract(MONTH FROM created_by) as month
FROM products;

select id, created_by, 
	YEAR(created_by) as 'year', 
    MONTH(created_by) as 'month' 
from products;

/*MENGGUNAKAN CONTROL FLOW CASE*/
select id, category,
CASE CATEGORY		
	WHEN 'MAKANAN' THEN 'ENAK'
	WHEN 'MINUMAN' THEN 'SEGER'
    ELSE 'APA ITU?'
    END AS 'category'
from products;

/*MENGGUNAKAN CONTROL FLOW IF*/
select id, price,
	IF (PRICE <= 15000, 'Murah', 
	IF (PRICE <= 20000, 'Mahal',
    'Mahal Banget')) as 'Murah/Mahal/MahalBanget'
from products;

/*MENGGUNAKAN CONTROL FLOW IFNULL*/
select id, name, 
IFNULL(description,'kosong')
as description from products;

/*MENGGUNAKAN AGGREGATE FUNCTION*/
select count(id) as 'Total Product' from products;

select max(price) as 'product termahal' from products;

select min(price) as 'product termurah' from products;

select avg(price) as 'rata-rata harga' from products;

select sum(quantity) as 'total stock' from products;


/*MENGGUNAKAN GROUP BY*/
select category, count(id) category from products group by category;

select count(id) as 'Total Product', category from products GROUP BY category;

select max(price) as 'product termahal', category from products GROUP BY category;

select min(price) as 'product termurah', category from products GROUP BY category;

select avg(price) as 'rata-rata harga', category from products GROUP BY category;

select sum(quantity) as 'total stock', category from products GROUP BY category;


/*MENGGUNAKAN HAVING Clause*/
select * from products;

select COUNT(id) as total_product, category
from products
GROUP BY category
having total_product > 1;

select * from products;

/*Menambah/Menghapus Check Constraint*/
INSERT INTO products (id, name, category, price, quantity)
VALUES ('P0017','Permen','lain-lain','500','1000');

ALTER TABLE products
ADD constraint price_check CHECK (price >= 1000); 

UPDATE products
set price = 1000
where id = 'P0016';

/*MENAMBAHKAN FULLTEXT SEARCH*/
ALTER TABLE products
ADD fulltext product_fulltext (name, description);

/*MENCARI DENGAN NATURAL LANGUAGE MODE*/
SELECT * FROM products
where name LIKE '%ayam%' OR description LIKE '%ayam%';

SELECT * FROM products
WHERE MATCH (name, description)
AGAINST('ayam' IN NATURAL LANGUAGE MODE);

/*MENCARI DENGAN BOOLEAN MODE*/
SELECT * FROM products
WHERE MATCH (name, description)
AGAINST('+ayam -bakso' IN BOOLEAN MODE);

/*MENCARI DENGAN QUERY EXPANSION MODE*/
SELECT * FROM products
WHERE MATCH (name, description)
AGAINST('bakso' WITH QUERY EXPANSION);


INSERT INTO products (id, name, category, price, quantity)
VALUES ('Pxxxx','Permen','lain-lain','1000','1000');


show create table products;

desc products;

select * from products; 

INSERT INTO products(id, name, price, quantity)
VALUES ('X0001', 'X Satu', 25000, 200),
       ('X0002', 'X Dua', 10000, 300),
       ('X0003', 'X Tiga', 15000, 500);















 