create schema prueba;
use prueba;
drop schema prueba;

create table tabla1(
id INT primary key,
nombre varchar(100),
apellido varchar(100)
);

SHOW TABLES;
SHOW COLUMNS FROM tabla1;
describe tabla1;

drop table tabla1;

insert into tabla1(id,nombre,apellido) values (1,'Homero','Simpson');
select * from tabla1;
insert into tabla1(id,apellido) values(2,'Perez');
insert into tabla1(id) values (3);
insert into tabla1(nombre,apellido) values ('Hola','Mundo');

delete from tabla1 where id = 2;
truncate tabla1;

update tabla1 set nombre = 'otro nombre' where id = 2;

alter table tabla1 modify column nombre varchar(100) not null;
alter table tabla1 add column telefono int;
alter table tabla1 drop column telefono;

