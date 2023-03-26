CREATE DATABASE TA15_Ejercicio_1;

USE TA15_Ejercicio_1;

CREATE TABLE DESPACHOS (
numero INT NOT NULL PRIMARY KEY,
capacidad INT NOT NULL
);

CREATE TABLE DIRECTORES (
dni VARCHAR(8) NOT NULL PRIMARY KEY,
nom_apels NVARCHAR(255),
dni_jefe VARCHAR(8),
despacho INT NOT NULL,
KEY (dni_jefe),
FOREIGN KEY (dni_jefe) REFERENCES DIRECTORES (dni)
ON DELETE NO ACTION ON UPDATE CASCADE,
KEY (despacho),
FOREIGN KEY (despacho) REFERENCES DESPACHOS (numero)
ON DELETE NO ACTION ON UPDATE CASCADE
);

USE TA15_Ejercicio_1;

INSERT INTO DESPACHOS VALUES
(0, 10),
(1, 2),
(2, 3),
(3, 1),
(4, 5),
(5, 15),
(6, 20),
(7, 7),
(8, 9),
(9, 6);

INSERT INTO DIRECTORES VALUES
('3409506Y',"Rodrigo Rodri", NULL , 0 ),
('2409506Y',"Gustazo del Gusto",'3409506Y', 0 ),
('5555506Y',"Adrianno García", '2409506Y', 1 ),
('9999999Y',"Remiendos Lopez", '2409506Y', 2 ),
('8888888Y',"Robert Schumann", '2409506Y', 3 ),
('6666606Y',"Clara Schumann", '2409506Y', 3 ),
('6555556Y',"Rodrigo Fernandez", '2409506Y', 4 ),
('5555555Y',"Encalabrado Rasurado", '2409506Y', 5 ),
('4444444Y',"Aitor Menta", '2409506Y', 8 ),
('2222222Y',"Gustavo Mendez", '2409506Y', 6 );

SELECT * FROM DESPACHOS;
SELECT * FROM DIRECTORES;

# DROP DATABASE TA15_Ejercicio_1;
