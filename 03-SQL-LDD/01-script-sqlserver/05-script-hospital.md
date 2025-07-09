```sql

--Crear base de datos hospital
CREATE DATABASE hospital;
GO

--Usar base de datos hospital
USE hospital;
GO

--Crear tabla doctor
CREATE TABLE doctor
(
	idDoc int not null,
	nombre nvarchar(20) not null,
	ap1 nvarchar(20) not null,
	ap2 nvarchar(20),
	edad int not null,
	CONSTRAINT pk_doctor
	PRIMARY KEY (idDoc)
);
GO

--Crear tabla paciente
CREATE TABLE paciente
(
	numPaciente int not null,
	nombre nvarchar(20) not null,
	ap1 nvarchar(20) not null,
	ap2 nvarchar(20),
	edad int not null,
	peso nvarchar(20) not null,
	altura nvarchar(20) not null
	CONSTRAINT pk_paciente
	PRIMARY KEY (numPaciente)
);
GO

--Crear tabla especialidad
CREATE TABLE especialidad
(
	iddoc int not null,
	especialidad nvarchar(50) not null,
	CONSTRAINT pk_especialidad
	PRIMARY KEY (iddoc),
	CONSTRAINT fk_especialidad
	FOREIGN KEY (iddoc)
	REFERENCES doctor (idDoc)
);
GO


--Crear tabla atiende
CREATE TABLE atiende
(
	iddoctor int not null,
	numpaciente int not null, 
	fecha date not null,
	diagnostico nvarchar(50) not null,
	CONSTRAINT pk_atiende
	PRIMARY KEY (iddoctor,numpaciente),
	CONSTRAINT fk_atiende_doctor
	FOREIGN KEY (iddoctor)
	REFERENCES doctor(idDoc),
	CONSTRAINT fk_atiende_paciente
	FOREIGN KEY (numpaciente)
	REFERENCES paciente(numPaciente)
);
GO

```