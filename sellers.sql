
/*MEMBUAT TABLE DENGAN INDEX*/
CREATE TABLE sellers (
id INT NOT NULL auto_increment,
name VARCHAR(100) NOT NULL,
name2 VARCHAR(100),
name3 VARCHAR(100),
email VARCHAR(100) NOT NULL,
primary key(id),
unique key email_unique (email),
index name_index (name),
index name_index2 (name2),
index name_index3 (name3),
index name1_name2_name3_index (name, name2, name3)
) engine = InnoDB;

show create table sellers;

select * from sellers;

desc sellers;

/*MENGHAPUS INDEX*/
ALTER TABLE sellers
DROP INDEX name_index;



