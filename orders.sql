/*MEMBUAT TABLE ORDERS*/
CREATE TABLE orders (
id INT NOT NULL AUTO_INCREMENT,
total INT NOT NULL,
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
) engine = InnoDB;

desc orders;

/*MEMBUAT TABLE ORDER DETAIL*/
CREATE TABLE orders_detail (
id_product VARCHAR(10) NOT NULL,
id_order INT NOT NULL,
price INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (id_product, id_order)
) engine = InnoDB;

desc orders_detail;

/*MEMBUAT FOREIGN KEY*/
ALTER TABLE orders_detail
ADD CONSTRAINT fk_order_detail_product
FOREIGN KEY (id_product) REFERENCES products(id);

ALTER TABLE orders_detail
ADD CONSTRAINT fk_order_detail_orders
FOREIGN KEY (id_order) REFERENCES orders(id);

show create table orders_detail;

INSERT INTO orders (total)
VALUES (50000);

INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P0001', 1, 25000, 1),
		('P0002', 1, 25000, 1);
    
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P0003', 2, 25000, 1),
		('P0004', 3, 25000, 1);
    
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P0001', 2, 25000, 1),
		('P0003', 3, 25000, 1);
    
/*MELIHAT DATA ORDER, DETAIL DAN PRODUCTNYA*/
SELECT * FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);

SELECT orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price 
FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);

select * from orders_detail;










