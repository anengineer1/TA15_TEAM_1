CREATE DATABASE TA15_Ejercicio_2;

USE TA15_Ejercicio_2;

CREATE TABLE PIEZAS (
codigo INT PRIMARY KEY,
nombre NVARCHAR(100)
);

CREATE TABLE PROVEEDORES (
id CHAR(4) PRIMARY KEY,
nombre NVARCHAR(100)
);

CREATE TABLE SUMINISTRA (
codigo_pieza INT NOT NULL,
id_proveedores CHAR(4) NOT NULL,
precio INT,
KEY (codigo_pieza),
FOREIGN KEY (codigo_pieza) REFERENCES PIEZAS (codigo)
ON DELETE NO ACTION ON UPDATE CASCADE,
KEY (id_proveedores),
FOREIGN KEY (id_proveedores) REFERENCES PROVEEDORES (id)
ON DELETE NO ACTION ON UPDATE CASCADE,
PRIMARY KEY (codigo_pieza, id_proveedores)
);

USE TA15_Ejercicio_2;


INSERT INTO PIEZAS VALUES			        
(0, 'Brida neumática'),
(1, 'Pistón'),
(2, 'Din 912 M8'),
(3, 'Tubo cuadrado 40x40 AISI 304'),
(4, 'Chapa 130x0,3 AISI 304'),
(5, 'Pomo'),
(6, 'Pulsador de Seta (Parada de emergencia)'),
(7, 'Arandela DIN 125 M8'),
(8, 'Esparrago roscado DIN 976'),
(9, 'Brida hidráulica');


INSERT INTO PROVEEDORES VALUES
(0, 'SMC'),
(1, 'Elesa Ganter'),
(2, 'Forjados Pepe'),
(3, 'Tunkers'),
(4, 'Parker'),
(5, 'Igus'),
(6, 'Ferretería Industrial Gili'),
(7, 'Ultimakers'),
(8, 'Electrónica Riba'),
(9, 'Ferretería Riba');

INSERT INTO SUMINISTRA VALUES
(0, 0, 200),
(1, 0, 150),
(2, 6, 1),
(3, 2, 10),
(4, 2, 10),
(5, 2, 2),
(6, 5, 50),
(7, 9, 1),
(8, 9, 1),
(9, 3, 300);

SELECT * FROM PIEZAS;
SELECT * FROM PROVEEDORES;
SELECT * FROM SUMINISTRA;
