
/*MEMBUAT TABLE DENGAN FOREIGN KEY*/
CREATE TABLE wishlist (
id INT NOT NULL auto_increment,
id_product VARCHAR(10) NOT NULL,
description TEXT,
PRIMARY KEY (id),
CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id) 
) engine = InnoDB;

/*MENAMBAH / MENGHAPUS FOREIGN KEY*/
ALTER TABLE wishlist
DROP constraint fk_wishlist_product;

/*MENGUBAH BEHAVIOR MENGHAPUS RELASI*/
ALTER TABLE wishlist
ADD constraint fk_wishlist_product 
FOREIGN KEY (id_product) REFERENCES products (id)
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO wishlist (id_product, description)
VALUES ('Pxxxx','Makanan Kesukaan');

DELETE from products
WHERE id = 'Pxxxx';

/*MELAKUKAN JOIN TABLE*/
select * from wishlist
join products on (wishlist.id_product = products.id);

select w.id AS id_wishlist, 
	p.id AS id_product, 
    p.name AS product_name, 
    w.description AS wishlist_description from wishlist AS w 
JOIN products AS p on (w.id_product = p.id);

/*Membuat Relasi ke Table Customers*/
ALTER TABLE wishlist
ADD COLUMN id_customer INT;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_customer) REFERENCES customers(id);

update wishlist
set id_customer = 1
where id = 2;

/*Melakukan JOIN Multiple Table*/
SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (products.id = wishlist.id_product)
JOIN customers ON (customers.id = wishlist.id_customer);





show create table wishlist;

desc wishlist;

select * from wishlist;

select * from customers;








