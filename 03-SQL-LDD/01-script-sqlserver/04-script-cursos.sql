--Crear base de datos Cursos
CREATE DATABASE cursos;
GO

--Usar base de datos cursos
USE cursos;
GO

--Crear tabla estudiante
CREATE TABLE estudiante
(
	id_estudiante int not null,
	matricula int not null,
	nombre varchar(20) not null,
	ape1 varchar(20) not null,
	ape2 varchar(20),
	CONSTRAINT pk_estudiante
	PRIMARY KEY (id_estudiante),
	CONSTRAINT unique_matricula
	UNIQUE (matricula)
);
GO

--Crear la tabla curso
CREATE TABLE curso
(
	id_curso int not null,
	nombreCurso nvarchar(20) not null,
	codigo int not null,
	CONSTRAINT pk_curso
	PRIMARY KEY (id_curso)
);
GO

--Crear la tabla instruccion
CREATE TABLE instruccion
(
	idEst int not null,
	idCurso int not null,
	CONSTRAINT pk_instruccion
	PRIMARY KEY (idEst, idCurso),
	CONSTRAINT fk_instrccion_idEst
	FOREIGN KEY (idEst)
	REFERENCES estudiante(id_estudiante),
	CONSTRAINT fk_instruccion_idCurso
	FOREIGN KEY (idCurso)
	REFERENCES curso(id_curso)
);
GO