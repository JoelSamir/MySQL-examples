CREATE SCHEMA peliculas;
USE peliculas;

create table director(
	dir_id int auto_increment primary key,
    dir_name varchar(30)
);

insert into director(dir_name) values('Angie Baños');
insert into director(dir_name) values('joel samir');
insert into director(dir_name) values('Jose Belen');
insert into director(dir_name) values('Maria Sabina');
insert into director(dir_name) values('Martha Yulieth');
insert into director(dir_name) values('Mario Bladimir');

create table peli(
	pel_id int primary key,
    pel_titulo varchar(40)not null,
    pel_tema varchar(30),
    pel_genero varchar(30) not null default 'unknown',    
    pel_annio_estreno int not null,
    dir_id int,
    foreign key (dir_id) references director(dir_id)
);

update peli set pel_id=10,pel_titulo='pelicula 1',pel_tema='sobre el 1',pel_genero='accion',pel_annio_estreno=1998,dir_id=1 where pel_id=1;

insert into peli values (10,'pelicula 1','sobre el 1','accion',1998,1);
insert into peli values (20,'pelicula 2','sobre el 22','eventura',1999,3);
insert into peli values (30,'pelicula 3','sobre el 133','comico',2001,2);
insert into peli values (40,'pelicula 4','sobre el 144','miedo',2016,3);
insert into peli values (50,'pelicula 5',null,'terror',1978,4);
insert into peli values (60,'pelicula 6','sobre el 166','niños',2021,6);
insert into peli values (70,'pelicula 7',null,'accion',2014,5);
insert into peli values (80,'pelicula 8','sobre el 188','comico',1993,1);
insert into peli values (90,'pelicula 9',null,'aventura',1991,6);
insert into peli values (100,'pelicula 10','sobre el 11010','fantasia',1985,4);
insert into peli values (110,'pelicula 11','sobre el 11111','fantasia',2019,5);
insert into peli(pel_id,pel_titulo,pel_tema,pel_annio_estreno,dir_id) values (120,'pelicula 11',null,2019,5);
insert into peli(pel_id,pel_titulo,pel_tema,pel_annio_estreno,dir_id) values (130,'pelicula 12',null,2020,6);
insert into peli(pel_id,pel_titulo,pel_tema,pel_annio_estreno,dir_id) values (140,'pelicula 13',null,2017,1);
insert into peli(pel_id,pel_titulo,pel_tema,pel_annio_estreno,dir_id) values (150,'pelicula 11',null,2019,2);
insert into peli(pel_id,pel_titulo,pel_tema,pel_annio_estreno,dir_id) values (160,'pelicula 12',null,2020,4);
insert into peli(pel_id,pel_titulo,pel_tema,pel_annio_estreno,dir_id) values (170,'pelicula 13',null,2017,3);

alter table peli add column peli_duracion int default 0;
alter table peli add column peli_calif double (2,1);

update peli set peli_calif=4.3 where pel_annio_estreno > 1999;
update peli set peli_calif=0.0 where pel_annio_estreno < 2000;

select avg(pel_annio_estreno) from peli;