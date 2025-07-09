--Lenguaje SQL-LDD (create, alter y drop)

--Crear la base de datos empresag2
CREATE DATABASE empresag2;
GO

--utilizar la base de datos
USE empresag2;

--crear la tabla categorias
CREATE TABLE categorias
(
	CategoriaId int primary key,
	nombrecatgeoria nvarchar(30) not null unique
);
GO

--crear tabla empleado
CREATE TABLE empleado
(
EmpleadoId int not null identity(1,1),
	Nombre nvarchar(20) not null,
	ApellidoPaterno nvarchar(15) not null,
	curp char(10) not null,
	telefono char(15),
	sexo char(1) not null,
	activo bit not null,
	CONSTRAINT pk_empleado
	PRIMARY KEY (EmpleadoId),
	CONSTRAINT unique_curp
	UNIQUE (curp),
	CONSTRAINT chk_sexo
	CHECK (sexo in ('M','F'))
);
GO

--Insertar en categorias
INSERT INTO categorias(CategoriaId, nombrecatgeoria)
VALUES (1,'CARNES FRIAS');
GO

INSERT INTO categorias(CategoriaId, nombrecatgeoria)
VALUES (2,'VINOS Y LICORES');
GO

SELECT *FROM categorias;
GO
--Insertar en empleado
INSERT INTO empleado (Nombre, ApellidoPaterno,curp, telefono, sexo, activo)
VALUES ('Monico', 'Panfilo', 'asdsadas', '123456789', 'M', 1);
GO

INSERT INTO empleado (Nombre, ApellidoPaterno,curp, telefono, sexo, activo)
VALUES ('Sarai', 'Vitoria', 'aksjdhas', '987654321', 'F', 1);
GO

-- Creacion de primary keys compuestas

CREATE TABLE Tabla1
(
	Tabla1id1 int not null,
	Tabla1id2 int not null,
	Nombre nvarchar(20) not null,
	CONSTRAINT pk_tabla1 
	PRIMARY KEY (Tabla1id1, Tabla1id2)
);
GO

-- Razon de cardinalidad 1:N

CREATE TABLE Tabla2
(
	Tabla2id int not null identity(1,1),
	Nombre varchar(20),
	Tabla1id1 int,
	Tabla1id2 int,
	CONSTRAINT pk_tabla2
	PRIMARY KEY (Tabla2id),
	CONSTRAINT fk_tabla2_tabla1
	FOREIGN KEY (Tabla1id1, Tabla1id2)
	REFERENCES Tabla1(Tabla1id1,Tabla1id2)
);
GO


--Raz�n de cardinalidad de 1:1 (Fidelidad)

CREATE TABLE Employee
(
	Id int not null identity(1,1),
	Nombre varchar(20) not null,
	Ap1 varchar(15) not null,
	Ap2 varchar(15),
	Sexo char(1) not null,
	Salario money not null
	CONSTRAINT pk_employee
	PRIMARY KEY (Id), 
	CONSTRAINT chk_Sexo2
	CHECK (Sexo in('M', 'F')),
	CONSTRAINT chk_salario
	CHECK (Salario>0.0)
);
GO

CREATE TABLE Department
(
	Id int not null identity(1,1),
	NombreProyecto varchar(20) not null,
	Ubicacion varchar(15) not null,
	FechaInicio date not null,
	IdEmployee int not null,
	CONSTRAINT pk_department
	PRIMARY KEY (Id),
	CONSTRAINT unique_nombreproyecto
	UNIQUE (NombreProyecto),
	CONSTRAINT unique_idemployee
	UNIQUE (IdEmployee),
	CONSTRAINT fk_department_employee
	FOREIGN KEY (IdEmployee)
	REFERENCES Employee(Id)
);
GO

--Crear tabla project (M:N)

CREATE TABLE Project
(
	ProjectId int not null identity(1,1),
	nombreProject varchar(20),
	CONSTRAINT pk_project
	PRIMARY KEY (ProjectId)
);
GO

CREATE TABLE Works_On
(
	horas int not null,
	employeeId int not null,
	projectId int not null,
	CONSTRAINT pk_works_on
	PRIMARY KEY (employeeId,projectId),
	CONSTRAINT fk_works_on_employee
	FOREIGN KEY (employeeId)
	REFERENCES Employee(Id),
	CONSTRAINT fk_works_on_project
	FOREIGN KEY (projectId)
	REFERENCES Project(ProjectId)
);
GO