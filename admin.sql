
/*MEMBUAT TABEL AUTO INCREMENT*/
create table admin(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
) ENGINE InnoDB;

INSERT INTO admin (first_name, last_name)
VALUES ('Irman','Yazid'),
		('Dizay','Namri'),
        ('Budi','Sotoso');

/*MELIHAT ID TERAKHIR*/
SELECT last_insert_id();

select * from admin;

select curtime();

        
