drop schema if exists pruebaMVC;
create schema pruebaMVC;
use pruebaMVC;

create table persona(
 per_identificacion int,
 per_nombre varchar(100),
 per_apellido varchar(100),
 per_fecha_nacimiento date,
 primary key (per_identificacion)
);

create table telefono(
tel_numero int,
tel_id_cliente int,
tel_uso varchar(300),
primary key (tel_numero),
foreign key (tel_id_cliente) references persona(per_identificacion)
);

create table hijos(
hi_identificacion int,
hi_nombre varchar(100),
hi_fecha_nacimiento date,
hi_genero varchar(1),
hi_id_padre int,
primary key (hi_identificacion),
foreign key (hi_id_padre) references persona(per_identificacion)
);
