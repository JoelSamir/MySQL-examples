DROP SCHEMA IF EXISTS BDReto4;
create schema BDReto4;
use BDReto4;

#---------creacion de tablas-------------
create table cliente(
	cli_id int primary key,
    cli_nombre varchar(30),
    cli_apellido varchar(30),
    cli_direccion varchar(30),
    cli_telefono varchar(30),
    cli_fecha_nacimiento datetime
);

create table factura(
	ven_nro_factura int primary key,
    ven_valor_compra int,
    ven_fecha_compra datetime,
    ven_sucursal varchar(30),
    ven_nombre_vendedor varchar(30)
);

create table producto(
	pro_codigo int primary key,
    pro_nombre varchar(30),
    pro_valor int,
    pro_cantidad int,
    pro_material varchar(30)
);

create table proveedor(
	prov_codigo int primary key,
    prov_nombre varchar(30),
    prov_direccion varchar(30),
    prov_telefono int,
    prov_pais varchar(30),
    prov_ciudad varchar(30)
);

create table ofrece(
	prov_codigo int references proveedor(prov_codigo),
    prod_codigo int references producto(pro_codigo)
);

create table compra(
	cli_id int references cliente(cli_id),
    ven_nro_factura int references factura(ven_nro_factura)
);

create table vendido(
	prod_codigo int references producto(prod_codigo),
    ven_nro_factura int references factura(ven_nro_factura)
);
#----------FIN creación de tablas

#----------------Inserción de datos a las tablas ----------------
insert into cliente values (1,'Juan','Rogers','calle 13 # 12 - 32',2111201450,'1998-10-01');
insert into cliente values (2,'Joselin','Martin','carrera 1 # 2 - 19',310524875,'1975-07-12');
insert into cliente values (3,'Pedro','China','calle 2 # 5 - 23',311002547,'1989-08-05');
insert into cliente values (4,'Raul','Grande','carrera 23 # 21 - 108',200457895,'1994-01-07');
insert into cliente values (5,'Caudia','Pizarro','calle 56 # 90 - 45',2100023458,'1977-10-08');
insert into cliente values (6,'Omar','Drinvet','carrera 11 # 102 - 13',2019852252,'1988-08-10');
insert into cliente values (7,'Daniela','Vita','transversal 3 # 9 - 1',350124583,'1991-05-25');

insert into proveedor values (123,'productos s.a.','av la belleza # 3 - 21',3211456,'Colombia','Cali');
insert into proveedor values (124,'procesos y ventas','calle 16 N 12 -17',32444778,'Colombia','Bogotá');
insert into proveedor values (125,'la natural ltda','car principal # 23s - 11',65478523,'Colombia','Cúcuta');
insert into proveedor values (126,'lo mejor ltda','diag. a la alcaldía # 39w - 23',35715946,'Colombia','Barranquilla');
insert into proveedor values (127,'la altura s.a.','trans 7 # 32 - 1',12457896,'Colombia','Cartagena');
insert into proveedor values (128,'los cocos','av la caracas # 34c - 221',3217894,'Colombia','Sopó');
insert into proveedor values (129,'el mejor','carrera 30 # 12 - 9',3215487,'Colombia','Medellín');
insert into proveedor values (130,'solo cosas s.a.','calle la noche # 32a - 12',85521459,'Colombia','la vega');

insert into producto values (2001,'super cuerdas',11000,12,'nylon');
insert into producto values (2002,'los tenis',210000,2,'tela');
insert into producto values (2003,'las medias',5000,1,'tela');
insert into producto values (2004,'pantalonetas cuerdas',10000,23,'nylon');
insert into producto values (2005,'camisetas',9000,33,'nylon');
insert into producto values (2006,'zapatos',320000,1,'tela');
insert into producto values (2007,'bicicletas',980000,3,'acero');

insert into factura values (7001,251320,'2021-02-12','las maletas','Jesús Daniel');
insert into factura values (7002,51350,'2021-02-13','las nubes','Pedro Banco');
insert into factura values (7003,23000,'2021-02-14','las maletas','Oscar Marx');
insert into factura values (7004,120000,'2021-02-15','las ciudadela','Petrona Daniel');
insert into factura values (7005,231000,'2021-02-16','las maletas','Jesús Daniel');
insert into factura values (7006,19000,'2021-02-17','las nubes','Claudio Rodri');
insert into factura values (7007,25000,'2021-02-18','las maletas','Jesús Daniel');

insert into ofrece values (123,2001);
insert into ofrece values (124,2002);
insert into ofrece values (125,2003);
insert into ofrece values (126,2004);
insert into ofrece values (127,2005);
insert into ofrece values (128,2006);
insert into ofrece values (129,2007);
insert into ofrece values (130,2008);

insert into compra values (1,7001);
insert into compra values (3,7001);
insert into compra values (4,7001);
insert into compra values (1,7003);
insert into compra values (2,7003);
insert into compra values (1,7004);
insert into compra values (2,7004);
insert into compra values (7,7005);
insert into compra values (1,7006);
insert into compra values (1,7007);
insert into compra values (5,7007);
insert into compra values (6,7007);

insert into vendido values (123,7001);
insert into vendido values (125,7001);
insert into vendido values (127,7001);
insert into vendido values (129,7001);
insert into vendido values (123,7002);
insert into vendido values (122,7003);
insert into vendido values (126,7004);
insert into vendido values (125,7005);
insert into vendido values (124,7006);
insert into vendido values (129,7007);
#----------------FIN Inserción de datos a las tablas ----------------

#--------Actualización de registros -----------
update proveedor set prov_nombre="la superior ltda" where prov_codigo=126;
update cliente set cli_telefono=5556565 where cli_id=4;
delete from proveedor where prov_codigo=130;
delete from ofrece where prov_codigo=130;
#--------FIN Actualización de registros -----------

#-----------ejecución de consultas-----------------
Select 'Consulta 1';
select * from proveedor;
Select 'Consulta 2';
select * from cliente;
Select 'Consulta 3';
select * from producto where pro_valor>10000;
Select 'Consulta 4';
select * from factura where ven_nombre_vendedor="Jesús Daniel";
Select 'Consulta 5';
select * from compra inner join cliente on compra.cli_id = cliente.cli_id order by compra.cli_id ASC;
Select 'Consulta 6';
SET sql_mode=PIPES_AS_CONCAT;
select cliente.cli_nombre || ' ' || cliente.cli_apellido as NombreApellido,count(compra.cli_id) as TotalCompras
	from cliente inner join compra on compra.cli_id = cliente.cli_id group by compra.cli_id order by TotalCompras asc, NombreApellido desc;
#-----------FIN ejecución de consultas-----------------
