create schema tienda;
use tienda;

create table usuario(
usu_identificacion int,
usu_nombre varchar(100),
usu_apellido varchar(100),
usu_fecha_nacimiento date,
primary key (usu_identificacion)
);

create table factura(
fac_id int,
fac_fecha_factura date,
fac_valor double,
primary key (fac_id)
);

create table producto(
pro_codigo int,
pro_nombre varchar(100),
pro_descripcion varchar(200),
primary key (pro_codigo)
);

create table entrega(
ent_id int,
ent_cod_producto int,
ent_id_fac int,
primary key (ent_id),
foreign key(ent_id_fac) references factura(fac_id),
foreign key(ent_cod_producto) references producto(pro_codigo)
);

create table venta(
ven_id int,
ven_id_cliente int,
ven_id_factura int,
primary key (ven_id),
foreign key (ven_id_cliente) references usuario(usu_identificacion),
foreign key(ven_id_factura) references factura(fac_id)
);