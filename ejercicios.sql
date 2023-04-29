CREATE DATABASE IF NOT EXISTS administracion2 
DEFAULT CHARACTER SET utf8  
DEFAULT COLLATE utf8_general_ci;

USE administracion2;

-- 1- Elimine las tablas si existen
DROP TABLE IF EXISTS socios;
DROP TABLE IF EXISTS inscriptos;

-- 2- Cree las tablas:
 create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

 create table inscritos(
  documento char(8) not null, 
  deporte varchar(15) not null,
  año year,
  matricula char(1), /*si esta paga ='s' sino 'n'*/
  primary key(documento,deporte,año)
 );

-- 3- Ingrese algunos registros para ambas tablas:
 insert into socios values('22333444','Juan Perez','Colon 234');
 insert into socios values('23333444','Maria Lopez','Sarmiento 465');
 insert into socios values('24333444','Antonio Juarez','Caseros 980');

 insert into inscritos values ('22333444','natacion','2005','s');
 insert into inscritos values ('22333444','natacion','2006','n');
 insert into inscritos values ('23333444','natacion','2005','s');
 insert into inscritos values ('23333444','tenis','2006','s');
 insert into inscritos values ('23333444','natacion','2006','s');
 insert into inscritos values ('24333444','tenis','2006','n');
 insert into inscritos values ('24333444','basquet','2006','n');

SELECT * FROM socios;
SELECT * FROM inscritos;

-- mostrar el nombre del socio, y todos los campos de la tabla inscriptos

SELECT s.nombre, i.*
FROM socios AS s
INNER JOIN inscritos AS i
ON s.documento=i.documento;

SELECT p.id, p.fecha_prestamo, p.fecha_entrega,p.socio_id,p.libro_id,l.titulo,l.editorial_id,l.tema_id,
a.nombre_autor, e.nombre_editorial,e.direccion,e.telefono,t.nombre_tema,s.nombre_completo,s.direccion,
s.correo,s.telefono,s.foto
FROM prestamos as p
INNER JOIN libros as l
INNER JOIN autores as a
INNER JOIN editoriales as e
INNER JOIN temas as t
INNER JOIN socios as s
ON p.socio_id= s.id AND p.libro_id=l.id AND l.autor_id= s.id AND l.editorial_id= e.id AND l.tema_id= t.id;

DELIMITER
CREATE PROCEDURE ejercicio
DECLARE numero1 INT,