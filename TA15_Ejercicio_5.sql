/*Creación de la Base de datos*/

CREATE DATABASE IF NOT EXISTS TA15_Ejercicio_5;
USE TA15_Ejercicio_5;

/*Creación de tablas*/

CREATE TABLE Facultad (
    codigo INT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE Investigadores (
    DNI VARCHAR(8),
    nomApels VARCHAR(255),
    FK_cod_investigadores_facultad INT,
    PRIMARY KEY (DNI),
    CONSTRAINT FK_cod_investigadores_facultad FOREIGN KEY (FK_cod_investigadores_facultad)
        REFERENCES Facultad (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Equipos (
    numSerie CHAR(4),
    nombre VARCHAR(100) NOT NULL,
    FK_cod_equipos_facultad INT,
    PRIMARY KEY (numSerie),
    CONSTRAINT FK_cod_equipos_facultad FOREIGN KEY (FK_cod_equipos_facultad)
        REFERENCES Facultad (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Reserva (
    FK_dni_investigadores VARCHAR(8),
    FK_numSerie_equipos CHAR(4),
    comienzo DATETIME,
    fin DATETIME,
    PRIMARY KEY (FK_dni_investigadores , FK_numSerie_equipos),
    CONSTRAINT FK_dni_investigadores FOREIGN KEY (FK_dni_investigadores)
        REFERENCES Investigadores (DNI)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_numSerie_equipos FOREIGN KEY (FK_numSerie_equipos)
        REFERENCES Equipos (numSerie)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/*Inserción de 10 tuplas por cada tabla creada*/

INSERT INTO Facultad(codigo, nombre) VALUES 
(1, "Fisica"),
(2, "Matemáticas"),
(3, "Química"),
(4, "Psicología"),
(5, "Derecho"),
(6, "Biología"),
(7, "Ingenieria Forestal"),
(8, "Economía"),
(9, "Ingeniería Informática"),
(10, "Turismo");

INSERT INTO Investigadores (DNI, nomApels, FK_cod_investigadores_facultad) VALUES
("4557878B", "Michael Scott", 4),
("1278997C", "Dwight Schrute", 7),
("4459898D", "Pamela Beesly", 10),
("4798863E", "Phyllis Vance", 6),
("4778863R", "Ryan Howard", 5),
("1458789A", "Kevin Malone", 2),
("2557888E", "Jim Halpert", 1),
("4555996C", "Kelly Kapoor", 10),
("7889882T", "Toby Flenderson", 9),
("1456897D", "Angela Martin", 3);

INSERT INTO Equipos (numSerie, nombre, FK_cod_equipos_facultad) VALUES
('AA', "Equipo1", 1),
('BB', "Equipo2", 2),
('CC', "Equipo3", 3),
('DD', "Equipo4", 4), 
('EE', "Equipo5", 5),
('FF', "Equipo6", 6),
('GG', "Equipo7", 7),
('LL', "Equipo8", 8),
('MM', "Equipo9", 9),
('NN', "Equipo10", 10);

INSERT INTO Reserva (FK_dni_investigadores, FK_numSerie_equipos, comienzo, fin) VALUES
("4557878B", 'AA', '2020-03-15', '2021-03-01'),
("1278997C", 'BB', '2021-03-15', '2021-04-01'),
("4459898D", 'DD', '2022-05-02', '2023-02-28'),
("4798863E", 'MM', '2019-12-01', '2020-07-10'),
("4778863R", 'AA', '2020-03-15', '2020-04-30'),
("1458789A", 'CC', '2005-08-22', '2005-12-01'),
("2557888E", 'DD', '2022-05-02', '2023-02-28'),
("4555996C", 'NN', '2019-04-10', '2021-03-01'),
("7889882T", 'LL', '2020-01-01', '2023-03-01'),
("1456897D", 'GG', '2018-11-10', '2021-05-01');

/*Realizamos varias pruebas para comprobar que todo funciona correctamente y salen los resultados esperados*/

SELECT numSerie AS "Número de Série", nombre AS "Nombre", FK_cod_equipos_facultad AS "Código Facultad" FROM Equipos;
SELECT codigo AS "Código", nombre AS "Nombre Facultad" FROM Facultad;
SELECT DNI, nomApels AS "Nombre Completo", FK_cod_investigadores_facultad AS "Código Facultad" FROM Investigadores;
SELECT FK_dni_investigadores AS "DNI Investigadores", FK_numSerie_equipos AS "Número de Série", comienzo, fin FROM Reserva;

SELECT nomApels AS "Nombre" FROM Investigadores i JOIN
 Facultad f ON f.codigo = i.FK_cod_investigadores_facultad
 WHERE nombre LIKE "Psicología";

