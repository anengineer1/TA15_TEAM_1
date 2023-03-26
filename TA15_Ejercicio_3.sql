CREATE DATABASE cientificos;

USE cientificos;

create table cientificos(
DNI varchar (8),
NomApels nvarchar(255),
primary key (DNI)
);

create table proyecto(
ID char(4),
Nombre nvarchar (255),
Horas int,
primary key (ID)
);

create table Asignado_a(
cientifico varchar(8),
proyecto char(4),
key (cientifico),
foreign key (cientifico)
references cientificos (DNI)
on delete no action on update cascade,
key (proyecto),
foreign key(proyecto)
references proyecto (ID)
on delete no action
on update cascade,
primary key (cientifico, proyecto)
);

INSERT INTO cientificos VALUES
('0000000S', 'Gordon Freeman'),
('1111111S', 'Michael Newman'),
('2222222S', 'Rogrigo García'),
('3333333S', 'Redbull Daalas'),
('4444444S', 'Maravillas Martínez'),
('5555555S', 'Núria Style'),
('6666666S', 'Arrebato Liendre'),
('7777777S', 'Xavier Cassanyes'),
('8888888S', 'Razones Grandes'),
('9999999S', 'Remiendos Menta');

INSERT INTO proyecto VALUES
('0000', 'Métodos numéricos', 8),
('0001', 'Métodos Algebraicos', 10),
('03R0', 'Radioactividad en portales', 4),
('005Y', 'Motores de combustión híbrida', 40),
('RY00', 'Motores de combustión externa', 80),
('0020', 'Motor Wanker', 250),
('0400', 'Las posibilidades de Rust en industria aeroespacial', 8),
('6000', 'Explosivos de tierra', 8),
('8000', 'La lluvia de ácido', 8),
('9000', 'La lluvia de oro', 8);

INSERT INTO Asignado_a VALUES
('0000000S', '03R0'),
('1111111S', '0000'),
('2222222S', '8000'),
('3333333S', '005Y'),
('4444444S', '9000'),
('5555555S', '0001'),
('6666666S', '6000'),
('7777777S', '0400'),
('8888888S', 'RY00'),
('9999999S', '0020');

SELECT * FROM cientificos;
SELECT * FROM proyecto;
SELECT * FROM Asignado_a;
