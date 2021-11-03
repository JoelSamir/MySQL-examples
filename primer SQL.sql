create schema primera;
use primera;#se da uso a la baseDatos
drop schema primera;#borrar base de datos

create table tabla1(
id int auto_increment primary key,
nombre varchar(100) not null,
apellido varchar(100) null
);

create table tabla2(
id int primary key,
nombre varchar(100),
apellido varchar(100)
);

show tables;
show columns from tabla1;#ver las columnas de la tabla
describe tabla1;
drop table tabla1;#borrar tabla

#insertar valores a las tablas
insert into tabla2 (id,nombre,apellido)values(1,"Homero","Simpson");
insert into tabla2 (id,nombre,apellido)values(2,"Marge","Simpson");
insert into tabla1 (nombre,apellido)values("Homero","Simpson");
insert into tabla1 (nombre,apellido)values("Lisa","Simpson");
insert into tabla1 (apellido)values("Gómez");

#el * me trae todos los valores de la tabla
select * from tabla1;
select * from tabla2;

#ver 1 ó varios campos de la tabla
select nombre from tabla1;
select id,apellido from tabla1;

#borrar registros de tabla
delete from tabla1;#se borran todos los registros de la tabla
delete from tabla1 where id=2;#se borra fila con el id igual a 2
delete from tabla2 where id=1;#se borra fila con el id igual a 1

#actualizacion de registros update
update tabla2 set nombre="cambio nombre" where id=2;

#alterar-adicionar-borrar columnas de una tabla
alter table tabla1 alter column nombre set default null;
alter table tabla1 add column telefono int;
alter table tabla1 drop column telefono;