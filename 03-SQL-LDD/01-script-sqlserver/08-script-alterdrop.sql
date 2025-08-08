--Crear base de datos
CREATE DATABASE empresacucha;
GO

--Utilizar la base de datos
USE empresacucha;
GO

--Crear tabla empleados
CREATE TABLE empleados
(
	IdEmpleado INT not null IDENTITY(1,1),
	Nombre varchar(100) not null,
	Puesto varchar(20),
	FechaIngreso DATE,
	Salario decimal(10,2)
	CONSTRAINT pk_empleado
	PRIMARY KEY (IdEmpleado),

);
GO

--Crear la tabla departamentos
CREATE TABLE departamentos
(
	IdDepto int not null primary key,
	NombreDepto varchar(50)
);
GO

--Agregar un columna a la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico varchar(20) null;
GO

--Modificar un tipo de dato de salario de la tabla empleados
ALTER TABLE empleados
ALTER COLUMN Salario money not null;
GO

--Renombrar una columna correo electronico de la tabla empleados
EXECUTE sp_rename 
				'empleados.CorreoElectronico',
				'Email','COLUMN';
GO

--Agregar columna a empleados para foreign key
ALTER TABLE empleados
ADD IdDepto int;
GO


--Agregar un constraint de foreign key
ALTER TABLE empleados
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY (IdDepto)
REFERENCES departamentos(IdDepto);
GO


--Agregar un constraint a salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (salario>=100 and salario<=100000);
GO

--Agregar un constraint unique al nombre del departamento
ALTER TABLE departamentos 
ADD CONSTRAINT unique_nombredepto
UNIQUE (NombreDepto);
GO


--Eliminar el constraint de foreign key
ALTER TABLE empleados 
DROP CONSTRAINT fk_empleado_depto;
GO

--Eliminar el constraint unico
ALTER TABLE departamentos
DROP CONSTRAINT unique_nombredepto;
GO

--Eliminar la primary key de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_empleado;
GO

--Eliminar la primary key de departamentos
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__7AEC424EBC693E70;
GO

--Eliminar columna
ALTER TABLE empleados
DROP COLUMN Email;
GO

--Eliminar una tabla
DROP TABLE departamentos;
GO

DROP TABLE empleados;
GO

SELECT *FROM empleados;
GO
