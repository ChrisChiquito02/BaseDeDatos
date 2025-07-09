--Crear base de datos renta-vehiculos
CREATE DATABASE rentaVehiculos;
GO

--Usar base de datos renta-vehiculos
USE rentaVehiculos;
GO

--Crear tabla cliente
CREATE TABLE cliente
(
	numCliente int not null,
	nombre nvarchar(20) not null,
	ap1 nvarchar(20) not null,
	ap2 nvarchar(20), 
	CURP nchar(18) not null,
	telefono nchar(12) not null, 
	numero int not null,
	cuidad nvarchar(20) not null
	CONSTRAINT pk_cliente
	PRIMARY KEY (numCliente)
);
GO

--Crear tabla sucursal
CREATE TABLE sucursal
(
	numSuc int not null,
	nombre nvarchar(20) not null,
	ubicacion nvarchar(20) not null,
	CONSTRAINT pk_sucursal
	PRIMARY KEY (numSuc)

);
GO

--Crear tabla vehiculo
CREATE TABLE vehiculo
(
	numVehiculo int not null,
	placa nchar(8) not null,
	marca nvarchar(20) not null,
	modelo nvarchar(20) not null,
	anio int not null,
	numcliente int not null,
	numsucursal int not null,
	CONSTRAINT pk_vehiculo
	PRIMARY KEY (numVehiculo),
	CONSTRAINT fk_vehiculo_cliente
	FOREIGN KEY (numcliente)
	REFERENCES cliente(numCliente),
	CONSTRAINT fk_vehiculo_sucursal
	FOREIGN KEY (numsucursal)
	REFERENCES sucursal(numSuc)
);
GO