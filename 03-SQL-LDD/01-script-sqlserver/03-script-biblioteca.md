```sql

--Crear base de datos Biblioteca
CREATE DATABASE Biblioteca;
GO

--Usar base de datos Biblioteca
USE Biblioteca;
GO

--Creaci�n de la tabla Libro
CREATE TABLE libro
(
	ISBN varchar(13) not null,
	titulo varchar(50) not null,
	autor varchar(30) not null,
	CONSTRAINT pk_libro
	PRIMARY KEY (ISBN),
	CONSTRAINT unique_isbn
	UNIQUE (ISBN)
);
GO

--Creaci�n de la tabla Lector
CREATE TABLE lector
(
	numMembresia int not null,
	nombre varchar(20) not null,
	apellidoP varchar(20) not null,
	apellidoM varchar(20),
	CONSTRAINT pk_lector
	PRIMARY KEY (numMembresia),
	CONSTRAINT unique_numbrebresia
	UNIQUE (numMembresia)
);
GO

--Creaci�n de la tabla Prestamo
CREATE TABLE Prestamo
(
	num_Membresia int not null,
	isbn varchar(13) not null, 
	fecha_prestamo date,
	CONSTRAINT pk_prestamo
	PRIMARY KEY (num_membresia,isbn),
	CONSTRAINT fk_prestamo_lector
	FOREIGN KEY (num_membresia)
	REFERENCES lector(numMembresia),
	CONSTRAINT fk_prestamo_libro
	FOREIGN KEY(isbn)
	REFERENCES libro(ISBN)
);
GO

```