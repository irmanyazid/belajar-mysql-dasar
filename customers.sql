/*Membuat Table dengan Unique Constraint*/
CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100),
PRIMARY KEY (id),
UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

desc customers; 

/*Menambah/Menghapus Unique Constraint*/
ALTER TABLE customers
DROP constraint email_unique;

ALTER TABLE customers
ADD constraint email_unique UNIQUE (email);

INSERT INTO customers (email, first_name, last_name)
VALUES ('irman@gmail.com', 'irman', 'yazid');

INSERT INTO customers (email, first_name, last_name)
VALUES ('yazid@gmail.com', 'irman', 'yazid');




