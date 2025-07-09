--Crecación de la Base de Datos bdinstruccion

CREATE DATABASE bdinstruccion;

--Utilizar la base de datos
USE bdinstruccion;
GO

--Crear la tabla Instructor
CREATE TABLE Instructor
(
	SSN int not null identity(1,1),
	Fname varchar(20),
	Lname varchar(20),
	CONSTRAINT pk_instructor
	PRIMARY KEY (SSN)
);
GO

--Crear la tabla Class
CREATE TABLE Class
(
	CourseNum int,
	anio int,
	term varchar(20),
	section varchar(20)
	CONSTRAINT pk_class
	PRIMARY KEY (CourseNum, anio, term, section)
);
GO

--Creación de la tabla Teaches
CREATE TABLE Teaches
(
	SSN int not null,
	CourseNum int,
	anio int,
	term varchar(20),
	section varchar(20)
	CONSTRAINT pk_teaches
	PRIMARY KEY(SSN, CourseNum, anio,term,section),
	CONSTRAINT fk_instructor_teaches
	FOREIGN KEY (SSN)
	REFERENCES Instructor(SSN),
	CONSTRAINT fk_class_teaches
	FOREIGN KEY (CourseNum,anio,term,section)
	REFERENCES Class(CourseNum,anio,term,section)
);
GO

drop table Teaches