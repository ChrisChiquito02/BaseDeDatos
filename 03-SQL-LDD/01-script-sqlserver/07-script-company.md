```sql

-- Crear base de datos empresa
CREATE DATABASE empresa;
GO

-- Usar base de datos empresa
USE empresa;
GO

-- Crear tabla Department
CREATE TABLE Department
(
	numberdepartment INT NOT NULL,
	namedepartment NVARCHAR(20) NOT NULL,
	ssn INT,
	startdate DATE,
	CONSTRAINT pk_department
	PRIMARY KEY (numberdepartment)
);
GO

-- Crear tabla Employee
CREATE TABLE Employee
(
	SSN INT NOT NULL,
	firstname NVARCHAR(20),
	lastname NVARCHAR(20),
	address NVARCHAR(30),
	birthdate DATE,
	salary MONEY,
	sex NVARCHAR(20),
	numberdepto INT,
	supervisor NVARCHAR(20),
	CONSTRAINT pk_employee
	PRIMARY KEY (SSN),
	CONSTRAINT fk_employee_department
	FOREIGN KEY (numberdepto)
	REFERENCES Department(numberdepartment)
);
GO

-- Crear tabla Dependent
CREATE TABLE Dependent
(
	SSN INT NOT NULL,
	name NVARCHAR(20) NOT NULL,
	relationship NVARCHAR(20),
	sex NVARCHAR(20),
	birthdate DATE,
	CONSTRAINT pk_dependent
	PRIMARY KEY (SSN, name),
	CONSTRAINT fk_dependent_employee
	FOREIGN KEY (SSN)
	REFERENCES Employee(SSN)
);
GO

-- Crear tabla Project
CREATE TABLE Project
(
	numberproject INT NOT NULL,
	nameproject NVARCHAR(20),
	location NVARCHAR(30),
	numberdepartment INT NOT NULL,
	CONSTRAINT pk_project
	PRIMARY KEY (numberproject),
	CONSTRAINT fk_project_department
	FOREIGN KEY (numberdepartment)
	REFERENCES Department(numberdepartment)
);
GO

-- Crear tabla Works_On
CREATE TABLE Works_On
(
	SSN INT NOT NULL,
	numberproject INT NOT NULL,
	hours INT,
	CONSTRAINT pk_works_on
	PRIMARY KEY (SSN, numberproject),
	CONSTRAINT fk_works_employee
	FOREIGN KEY (SSN)
	REFERENCES Employee(SSN),
	CONSTRAINT fk_works_project
	FOREIGN KEY (numberproject)
	REFERENCES Project(numberproject)
);
GO

-- Crear tabla DepLocation
CREATE TABLE DepLocation
(
	numberdepart INT NOT NULL,
	Dlocation NVARCHAR(20) NOT NULL,
	CONSTRAINT pk_deplocation
	PRIMARY KEY (numberdepart, Dlocation),
	CONSTRAINT fk_deplocation_department
	FOREIGN KEY (numberdepart)
	REFERENCES Department(numberdepartment)
);
GO


```