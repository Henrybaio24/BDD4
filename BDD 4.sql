CREATE TABLE Instrumentos(
id Serial PRIMARY KEY,
nombre text NOT NULL,
tipo text NOT NULL,
tamaño int NOT NULL,
material varchar(50)

);

//MUESTRA LA TABLA
select * from Instrumentos

//INSERTAR VALORES
INSERT INTO Instrumentos(nombre,tipo,tamaño,material)
VALUES ('guitarra','cuerda',120,'tabla' );

INSERT INTO Instrumentos(nombre,tipo,tamaño,material)
VALUES ('tambor','percusion',300,'madera' );

INSERT INTO Instrumentos(nombre,tipo,tamaño,material)
VALUES ('piano','percusion',150,'madera' );

INSERT INTO Instrumentos(nombre,tipo,tamaño,material)
VALUES ('trompeta','viento',100,'metal' );

INSERT INTO Instrumentos(nombre,tipo,tamaño,material)
VALUES ('flauta','viento',40,'madera' );

//NUEVA TABLA

CREATE TABLE estado(
id Serial PRIMARY KEY,

descripcion text NOT NULL
);

select * from estado


//INGRESAR VALORES

INSERT INTO estado(descripcion)
VALUES ('El instrumento esta en muy buen estado' );

INSERT INTO estado(descripcion)
VALUES ('El instrumento esta en buen estado');

INSERT INTO estado(descripcion)
VALUES ('El instrumento esta en muy mal estado');

INSERT INTO estado(descripcion)
VALUES ('El instrumento esta en muy buen estado');

INSERT INTO estado(descripcion)
VALUES ('El instrumento merece ser cambiado');



CREATE TABLE InstrumentosEstado(
id SERIAL,
idInstrumentos INT,
idEstado INT
);

//FORANEA

ALTER TABLE InstrumentosEstado ADD FOREIGN KEY (idInstrumentos) REFERENCES Instrumentos(id);

ALTER TABLE InstrumentosEstado ADD FOREIGN KEY (idEstado) REFERENCES estado(id);


INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(1,5);

INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(1,1);

INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(2,3);

INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(2,2);

INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(3,1);

INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(5,3);

INSERT INTO InstrumentosEstado(idInstrumentos, idEstado)values(4,4);


//RELACION

SELECT
Instrumentos.nombre,
estado.descripcion
FROM InstrumentosEstado
INNER JOIN Instrumentos ON Instrumentos.id = InstrumentosEstado.idInstrumentos
INNER JOIN estado ON estado.id = InstrumentosEstado.idEstado




//VISTA

CREATE VIEW verVista AS
SELECT nombre,descripcion
FROM Instrumentos,estado
WHERE nombre=nombre;

SELECT * FROM verVista


select * from estado
select * from Instrumentos
select * from InstrumentosEstado