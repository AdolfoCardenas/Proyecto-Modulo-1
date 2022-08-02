create database proyecto;
use proyecto;

select * from cat_publicador
where publicador_desc = '';

select * from cat_publicador;

create table venta(
id_videojuego int,
id_plataforma int,
id_genero int,
id_publicador int,
NA_Sales double,
EU_Sales double,
JP_Sales double,
Other_Sales double
);

##drop table venta;

describe cat_genero;
alter table cat_genero rename column ï»¿id_genero to id_genero;

describe cat_plataforma;
alter table cat_plataforma rename column ï»¿id_plataforma to id_plataforma;

describe cat_publicador;
alter table cat_publicador rename column ï»¿id_publicador to id_publicador;

describe cat_videojuego;
alter table cat_videojuego rename column ï»¿id_videojuego to id_videojuego;

SELECT COUNT(*), id_videojuego, id_plataforma, id_genero, id_publicador
from venta
group by id_videojuego, id_plataforma, id_genero, id_publicador;

select * from venta
where id_videojuego = 11084 and id_plataforma = 6 and na_sales = 0;

select * from cat_videojuego;
where id_videojuego = 11084;

##delete from venta
where id_videojuego = 453 and id_plataforma = 6 and na_sales = 0;

create view venta_totales as
select t5.desc_videojuego, t4.publicador_desc, t3.plataforma_desc, t2.genero_desc,
sum(t1.NA_Sales + EU_Sales + t1.JP_Sales + t1.Other_Sales) "Total Venta"
from venta t1 inner join cat_genero t2 on t1.id_genero = t2.id_genero
inner join cat_plataforma t3 on t1.id_plataforma = t3.id_plataforma
inner join cat_publicador t4 on t1.id_publicador = t4.id_publicador
inner join cat_videojuego t5 on t1.id_videojuego = t5.id_videojuego
group by t5.desc_videojuego, t4.publicador_desc, t3.plataforma_desc, t2.genero_desc
order by sum(t1.NA_Sales + EU_Sales + t1.JP_Sales + t1.Other_Sales) desc;

select * from venta_totales;