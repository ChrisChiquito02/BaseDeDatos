--Crear bd
CREATE DATABASE bdmorgan;

--Usar bd morgan
USE bdmorgan;
GO

--Crear tabla
CREATE TABLE empleado
(
	IdEmpleado int not null identity(1,1),
	Nombre varchar(50) not null,
	Apellido1 varchar(20) not null,
	Apellido2 varchar(20),
	Edad int not null,
	estatus char(1) not null default 'A',
	IdDepto int not null,
);
GO

--Crear la tabla departamentos
CREATE TABLE departamentos
(
	IdDepart int not null identity(1,1),
	NombreDepto varchar(20) not null,
	IdEmpleado int not null,
	CONSTRAINT pk_depto
	PRIMARY KEY (IdDepart)
	
);
GO

--Agregar jefe a empleados
ALTER TABLE empleado
ADD jef int;
GO

--Restricciones
ALTER TABLE empleado
ADD CONSTRAINT pk_empleado
PRIMARY KEY (IdEmpleado);
GO

ALTER TABLE empleado
ADD CONSTRAINT chk_edad
CHECK (edad between 18 and 60);
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_empljefe
FOREIGN KEY (jef)
REFERENCES empleado(IdEmpleado);
GO