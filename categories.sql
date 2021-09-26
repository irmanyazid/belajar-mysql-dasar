/*MEMBUAT TABLE CATEGORIES*/
CREATE TABlE categories (
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
) engine=InnoDB;

desc categories; 

ALTER TABLE products
DROP COLUMN categories;

ALTER TABLE products
ADD COLUMN id_category VARCHAR(10);

ALTER TABLE products
ADD CONSTRAINT fk_products_categories 
FOREIGN KEY (id_category) REFERENCES categories(id);

show create table products;

select * from categories;

select * from products;

INSERT INTO categories (id, name)
VALUES ('C0001','Makanan'),
	('C0002','Minuman'),
    ('C0003','Lain-lain');
    
UPDATE products
SET id_category = 'C0001'
where id in ('P0001','P0002','P0003','P0004','P0005','P0006','P00013','P00014','P00015');

UPDATE products
SET id_category = 'C0002'
where id in ('P0007','P0008','P0009');

UPDATE products
SET id_category = 'C0003'
where id in ('P0010','P0011','P0012','P0016');

SELECT products.id, products.name, categories.name 
FROM products
JOIN categories ON (categories.id = products.id_category)
ORDER BY id ASC;

INSERT INTO categories (id, name)
VALUES ('C0004','Oleh-Oleh'),
	('C0005','Gadget');
    
/*MELAKUKAN INNER JOIN (hanya mengambil data yang berelasi)*/
SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);

SELECT * FROM categories
JOIN products ON (products.id_category = categories.id);

/*MELAKUKAN LEFT JOIN (semua data table pertama akan di ambil juga)*/
SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);

/*MELAKUKAN RIGHT JOIN (semua data table kedua akan di ambil juga)*/
SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);

/*MENGGUNAKAN CROSS JOIN (join dengan cara mengkalikan data di tabel pertama dengan dada di table kedua) jarang sekali digunakan*/
SELECT * FROM categories
CROSS JOIN products;

CREATE TABLE numbers(
id INT NOT NULL,
PRIMARY KEY (id) 
) engine = InnoDB;

INSERT INTO numbers (id) 
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

/*Cross Join Tabel Perkalian*/
select numbers1.id, numbers2.id, (numbers1.id * numbers2.id) as result from numbers as numbers1 
CROSS JOIN numbers as numbers2
ORDER BY numbers1.id, numbers2.id;










