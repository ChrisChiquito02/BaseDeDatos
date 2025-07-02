```sql

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
```