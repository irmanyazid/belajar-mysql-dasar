CREATE TABLE barang(
id int,
nama varchar(100),
harga int,
jumlah int
) engine = InnoDB;

show create table barang;

alter table barang 
add column deskripsi text;

alter table barang
add column salah text;

alter table barang
drop column salah;

alter table barang 
rename column nama to nama_baru;

alter table barang 
rename column nama_baru to nama;

alter table barang
modify nama varchar(200) after deskripsi;

alter table barang
modify nama varchar(100) after id;

alter table barang
modify nama varchar(100) first;

alter table barang
modify nama varchar(100) after id;

alter table barang 
modify id int not null;

alter table barang
modify nama varchar(100) not null;

alter table barang 
modify harga int not null default 0;

alter table barang 

modify jumlah int not null default 0;

alter table barang 
add waktu_dibuat timestamp not null default current_timestamp;

select * from barang;

desc products; 

truncate barang;

drop table barang;

show tables;







