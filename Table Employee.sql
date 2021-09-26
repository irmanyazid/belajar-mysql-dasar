create table Employee(
person_id INT NOT NULL,
employee_number INT NOT NULL,
last_name varchar(100),
sex varchar(10),
marital_status varchar(20),
hire_date date
) engine = InnoDB;

desc employee;

INSERT INTO Employee (person_id, employee_number, last_name, sex, marital_status, hire_date)
VALUES (1,1111,'John Palmer','M','Married','2005-09-15'),
	(2,1112,'Selma Blair','F','Married','2000-05-5'),
    (3,1113,'Bernard Wang','M','Married','2002-07-17'),
    (4,1114,'Christian Joll','M','Single','2001-04-25'),
    (5,1115,'Alex Nirmo','M','Single','2011-01-13'),
    (6,1116,'Cathy Smith','F','Single','2007-12-27'),
    (7,1117,'Derek Vaila','M','Single','2005-03-3');
    
select * from employee;




select Employee.employee_number, Employee.last_name, Address.city
from Employee, Address
where Employee.person_id = Address.person_id; /*direlasikan dengan menggunakan person_id*/

select  Employee.employee_number,  Employee.last_name, Address.province
from Employee, Address
where Employee.person_id = Address.person_id /*direlasikan dengan menggunakan person_id*/
AND Employee.marital_status = 'Married'

select employee_number, hire_date
from Employee
ORDER BY hire_date DESC 

select sex, count(*) from employee group by sex; /*GROUP BY = menampilkan total semua product per category*/

select Employee.marital_status, Address.province, count(*)
from Employee, Address
where Employee.person_id = Address.person_id /*direlasikan dengan menggunakan person_id*/
GROUP BY Employee.marital_status, Address.province

/*memakai Where (penghubung tabel menggunakan kolom yg unik seperti id, kolom yg mana untuk join nya)*/

select * from employee;

/*coba coba sendiri*/
select employee_number, last_name, city from employee
JOIN address ON (employee.person_id = address.person_id); /*direlasikan dengan menggunakan person_id*/	

select employee_number, last_name, province from employee
JOIN address ON (employee.person_id = address.person_id) /*direlasikan dengan menggunakan person_id*/
AND employee.marital_status = 'Married';

select employee_number, hire_date from employee
ORDER BY hire_date DESC;

select sex, count(*) from employee
GROUP BY sex;

select marital_status, province, count(*) from employee
JOIN address ON (employee.person_id = address.person_id) /*direlasikan dengan menggunakan person_id*/
GROUP BY employee.marital_status, address.province;

/*memakai ON (penghubung tabel menggunakan kolom yg unik seperti id, kolom yg mana untuk join nya)*/

select * from employee;












    