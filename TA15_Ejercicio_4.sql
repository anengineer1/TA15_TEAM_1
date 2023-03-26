/*Creación de la Base de datos*/

CREATE DATABASE IF NOT EXISTS TA15_Ejercicio_4;
USE TA15_Ejercicio_4;

/*Creación de tablas*/

CREATE TABLE IF NOT EXISTS Cajeros (
    codigo INT UNIQUE AUTO_INCREMENT,
    nomApels VARCHAR(255) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS Productos (
    codigo INT UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio INT,
    PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS Maquinas_registradoras (
    codigo INT UNIQUE AUTO_INCREMENT,
    piso INT,
    PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS Venta (
    FK_codigo_cajero INT,
    FK_codigo_maquina INT,
    FK_codigo_producto INT,
    PRIMARY KEY (FK_codigo_cajero , FK_codigo_maquina , FK_codigo_producto),
    CONSTRAINT FK_codigo_cajero FOREIGN KEY (FK_codigo_cajero)
        REFERENCES Cajeros (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_codigo_maquina FOREIGN KEY (FK_codigo_maquina)
        REFERENCES Maquinas_registradoras (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_codigo_producto FOREIGN KEY (FK_codigo_producto)
        REFERENCES Productos (codigo)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/*Inserción de 10 tuplas por cada tabla creada*/

INSERT INTO Cajeros (nomApels) VALUES
("Arya Stark"),
("Tyrion Lannister"),
("Jon Snow"),
("Bran Stark"),
("Rob Stark"),
("Cersei Lannister"),
("Daenerys Targaryen"),
("Jaime Lannister"),
("Theon Greyjoy"),
("Brienne de Tarth");

INSERT INTO Productos (nombre, precio) VALUES
("Manzanas", 5),
("Peras", 3),
("Pimientos", 3),
("Pizza", 10),
("Pan", 2),
("Croquetas", 12),
("Macarrones con queso", 15),
("Patatas", 8),
("Chorizo", 4), 
("Lomo", 7);

INSERT INTO Maquinas_registradoras (piso) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO Venta (FK_codigo_cajero, FK_codigo_maquina, FK_codigo_producto) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);

/*Realizamos varias pruebas para comprobar que todo funciona correctamente y salen los resultados esperados*/

SELECT FK_codigo_cajero AS "Código Cajero", FK_codigo_maquina AS "Código Maquina", FK_codigo_producto AS "Código Producto" FROM Venta;
SELECT * FROM Productos;
SELECT codigo, nomApels AS "Nombre Completo" FROM Cajeros; 
SELECT * FROM Maquinas_registradoras;
SELECT * FROM Productos;
