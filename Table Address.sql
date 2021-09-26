create table address(
address_id INT NOT NULL,
person_id INT NOT NULL,
address_line_1 VARCHAR(100),
city VARCHAR(20),
province VARCHAR(20),
postal_code INT  
) engine = InnoDB;

INSERT INTO address(address_id, person_id, address_line_1, city, province, postal_code)
VALUES (1, 7, 'Apartemen Bellagio','Jakarta','Jakarta','15417'),
	(2, 5, 'Cluster Nirwana','Bandung','West Java','13250'),
    (3, 3, 'Modern Land','Bekasi','West Java','31231'),
    (4, 4, 'Apartment Century','Jakarta','Jakarta','42154'),
    (5, 2, 'Cluster Sanjaya','Sidoarjo','East Java','62451'),
    (6, 1, 'Cluster New Surabaya','Surabaya','East Java','46724');
    
select * from address;
