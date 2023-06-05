drop database if exists Polleria_Juan;
create database if not exists Polleria_Juan;
use Polleria_Juan;

create table if not exists puesto(
	id int not null auto_increment,
	nombre_local varchar(30) not null,
    nombre_encargado varchar(15) not null,
    num_local int not null,
    constraint primary key (id),
    constraint unique (num_local)
)ENGINE=InnoDB;

create table if not exists proveedores(
	id int not null auto_increment,
    nombre varchar(25) not null,
    CIF varchar(9) not null,
    tipo_producto varchar(25) not null,
    constraint primary key (id),
    constraint unique (CIF)
)ENGINE=InnoDB;

create table if not exists clientes(
	id int not null auto_increment,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    DNI varchar(9) not null,
    num_telefono bigint not null,
    constraint primary key (id),
    constraint unique (DNI)
)ENGINE=InnoDB;

create table if not exists producto(
	id int not null auto_increment,
    nombre varchar(35) not null,
    fecha_cad date not null,
    cant_abastecida int not null,
    precio_unit float(5,2) not null,
    num_lote varchar(20) not null not null,
    proveedores_id int not null,
    constraint primary key (id),
    constraint unique (num_lote),
    constraint foreign key (proveedores_id) references proveedores (id)
)ENGINE=InnoDB;

create table if not exists puesto_has_proveedores(
	puesto_id int not null,
	proveedores_id int not null,
	constraint primary key(puesto_id, proveedores_id),
    constraint foreign key (puesto_id) references puesto(id),
    constraint foreign key (proveedores_id) references proveedores (id)
)ENGINE=InnoDB;


create table if not exists producto_has_clientes(
	clientes_id int,
    producto_id int,
    cant_prod_comprado int,
    constraint primary key (clientes_id, producto_id),
    constraint foreign key (clientes_id) references clientes (id),
    constraint foreign key (producto_id) references producto (id)
)ENGINE=InnoDB;

/* insercion de datos */ 

insert into puesto (nombre_local, nombre_encargado, num_local) values ("Polleria Juan", "Juan", 39);

insert into proveedores (nombre, CIF, tipo_producto) values ("Povesa", "A39502392", "Carnes de pollo");
insert into proveedores (nombre, CIF, tipo_producto) values ("Ecotemple", "A38503712", "huevos");
insert into proveedores (nombre, CIF, tipo_producto) values ("Sertina", "B28906592", "rellenos de pollo");

insert into producto (nombre, fecha_cad, cant_abastecida, precio_unit, num_lote, proveedores_id) values ("alitas de pollo", 20230130, 50, 3.50, "NL32389", 1);
insert into producto (nombre, fecha_cad, cant_abastecida, precio_unit, num_lote, proveedores_id) values ("pechuga de pollo", 20230115, 40, 4.00, "NL58349", 1);
insert into producto (nombre, fecha_cad, cant_abastecida, precio_unit, num_lote, proveedores_id) values ("docena de huevos", 20230110, 15, 2.10, "NL8293023", 2);
insert into producto (nombre, fecha_cad, cant_abastecida, precio_unit, num_lote, proveedores_id) values ("Perdiz escabechada", 20230301, 10, 11.00, "NL3298", 3);
insert into producto (nombre, fecha_cad, cant_abastecida, precio_unit, num_lote, proveedores_id) values ("Salsa Asturiana", 20230115, 20, 4.00, "NL8429312-2", 3);

insert into clientes (nombre, apellido, DNI, num_telefono) values ("Sergio", "Fontan", "59834952R", 642384722);
insert into clientes (nombre, apellido, DNI, num_telefono) values ("Carlos", "Rufiangel", "48329029P", 902839228);
insert into clientes (nombre, apellido, DNI, num_telefono) values ("Antonio", "Carmona", "29837231N", 655348320);

insert into puesto_has_proveedores (puesto_id, proveedores_id) values (1, 1);
insert into puesto_has_proveedores (puesto_id, proveedores_id) values (1, 2);
insert into puesto_has_proveedores (puesto_id, proveedores_id) values (1, 3);

insert into producto_has_clientes (clientes_id, producto_id, cant_prod_comprado) values (1, 3, 1);
insert into producto_has_clientes (clientes_id, producto_id, cant_prod_comprado) values (2, 4, 2);
insert into producto_has_clientes (clientes_id, producto_id, cant_prod_comprado) values (3, 1, 1);