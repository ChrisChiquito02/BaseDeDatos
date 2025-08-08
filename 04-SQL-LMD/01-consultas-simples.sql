-- SQL-LMD (insert, delete, update, select)

USE NORTHWND;
GO

SELECT *
FROM Categories;

SELECT *
FROM Products;

SELECT *
FROM Suppliers;

SELECT *
FROM Customers;

SELECT *
FROM Employees;

SELECT *
FROM Shippers;

SELECT *
FROM Orders;

SELECT *
FROM [Order Details];

-- Proyección 
SELECT CustomerID,CompanyName,City
FROM Customers;

--Alias de Columna
SELECT CustomerID AS 'Numero Empleado',
		CompanyName Empresa,
		City AS Cuidad,
		ContactName AS [Nombre del Contacto]
FROM Customers;

-- Alias de Tablas
SELECT Customers.CustomerID AS [Número CLiente],
		Customers.ContactName AS [Empresa],
		Customers.ContactName AS [Nombre del Contacto]
FROM Customers;


SELECT c.CustomerID AS [Número CLiente],
		c.ContactName AS [Empresa],
		c.ContactName AS [Nombre del Contacto]
FROM Customers AS c;

SELECT c.CustomerID AS [Número CLiente],
		c.ContactName AS [Empresa],
		c.ContactName AS [Nombre del Contacto]
FROM Customers c;

-- Campo calculado
SELECT *,(UnitPrice * Quantity) AS [Total]
FROM [Order Details];

SELECT od.OrderID AS [Número de Orden],
od.ProductID AS [Número de Producto],
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad],
(UnitPrice * Quantity) AS [Total]
FROM [Order Details] AS od;


-- Seleccionar todos los productos de la categoria 1
--Total de los productos
SELECT p.ProductID AS [Número],
		p.ProductName AS [Nombre],
		p.CategoryID AS [Categoria],
		p.UnitPrice AS [Precio],
		p.UnitsInStock AS [Cantidad de productos],
		(p.UnitPrice * p.UnitsInStock) AS [Costo del inventario]
FROM
Products AS P
WHERE CategoryID=1;

--Seleccionar todos los productos de la categoria condiments

SELECT *
FROM Categories;

SELECT p.ProductID AS [Número],
		p.ProductName AS [Nombre],
		p.CategoryID AS [Categoria],
		p.UnitPrice AS [Precio],
		p.UnitsInStock AS [Cantidad de productos],
		(p.UnitPrice * p.UnitsInStock) AS [Costo del inventario]
FROM
Products AS P
WHERE CategoryID=2;

-- Seleccionar todos los productos que su precio sea mayor a 40.3

SELECT *
FROM Products AS p;

SELECT p.ProductID AS [ID del Producto],
		p.ProductName AS [Nombre del Producto],
		p.UnitPrice AS [Precio]
FROM
Products AS P
WHERE p.UnitPrice>40.3;

-- Seleccionar todos los productos que su categoria sea diferente de 3
SELECT p.ProductID AS [ID del Producto],
		p.ProductName AS [Nombre del Producto],
		p.UnitPrice AS [Precio]
FROM
Products AS P
WHERE p.CategoryID <> 3;

-- Seleccionar todas las ordenes que ean de Brazil - Rio de Janeiro, mostrando solo el número de orden, 
-- la fecha de orden, páis de envio, la Cuidad y su transportista

SELECT *
FROM Orders;

SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
		o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipCity = 'Rio de Janeiro';

-- Seleccionar todas las ordenes, mostrando lo mismo que la consulta anterior, pero todas aquellas que no tengan región de envío
SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
		o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipRegion is null;

-- Seleccionar todas las ordenes, mostrando lo mismo que la consulta anterior, pero todas aquellas que si tengan región de envío
SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
		o.ShipVia AS [Transportista],
		o.ShipRegion AS [Región]
FROM Orders AS o
WHERE ShipRegion is not null;

--Seleccionar todas las ordenes enviadas a Brazil, Alemania, México y con región

SELECT *
FROM Orders;

SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
			o.ShipVia AS [Transportista],
			o.ShipRegion AS [Región]
	FROM Orders AS o
	WHERE (o.ShipCountry = 'Brazil' 
			or o.ShipCountry='Germany' 
			or o.ShipCountry='Mexico')
			and o.ShipRegion is null
	ORDER BY [País de Envío] asc,
			[Cuidad de Envío] desc;


--Seleccionar todas las ordenes de Francia, Alemania y Argentina (Clausula in)
SELECT *
FROM Orders
WHERE ShipCountry 
			in ('Germany', 'France', 'Argentina')


--Seleccionar todos los productos descontinuados o con precio mayor a 50, ordenados por el precio
SELECT p.ProductID, p.ProductName, p.Discontinued, p.UnitPrice
FROM Products AS p
WHERE p.Discontinued=1
	or p.UnitPrice > 50
ORDER BY p.UnitPrice DESC;


--Seleccionar los empleados quw fueron contratados despues de 1994,
--Nombre completo y fecha de contratación
SELECT e.FirstName, e.LastName, e.HireDate
FROM Employees as e
WHERE e.HireDate > 1994;
GO

SELECT FirstName, LastName, HireDate
FROM Employees

SELECT (FirstName + ' ' + LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratación]
FROM Employees
WHERE HireDate > '1994-12-31';

SELECT CONCAT(FirstName , ' ' , LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratación], YEAR (HireDate) AS [Año de Contratación],
MONTH(HireDate) AS [Mes de Contratación], DAY(HireDate) AS [Día de Contratación]
FROM Employees
WHERE YEAR (HireDate) > 1993;
GO


--Mostrar los empleados que fueron contratados en Abril
SELECT CONCAT(FirstName , ' ' , LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratación], YEAR (HireDate) AS [Año de Contratación],
MONTH(HireDate) AS [Mes de Contratación], DAY(HireDate) AS [Día de Contratación]
FROM Employees
WHERE MONTH (HireDate) = 4;
GO


SELECT CONCAT(FirstName , ' ' , LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratación], DATEPART(YEAR,HireDate) AS [Año de Contratación],
DATEPART(mm,HireDate) AS [Mes de Contratación], DATEPART(d,HireDate) AS [Día de Contratación],
DATEPART(quarter,HireDate) AS [Trimestre],
DATEPART(weekday, HireDate) AS [Día],
DATEPART(MONTH, HireDate) AS [Mes]
FROM Employees
WHERE MONTH (HireDate) = 4;

GO

SELECT MAX (HireDate) FROM Employees

SELECT GETDATE();

--Seleccionar los productos que no estan descontinuados, mostrando 
--solamente el nombre del producto y el campo de descontinuado

SELECT p.ProductName AS [Nombre del Producto], p.Discontinued AS [Status]
FROM Products as p
WHERE p.Discontinued = 0;
GO

--Seleccionar los provedores que no son de USA

SELECT s.CompanyName AS [Empresa], s.ContactName AS [Contcto]
FROM Suppliers AS s
WHERE Country <> 'USA';
GO

SELECT s.CompanyName AS [Empresa], s.ContactName AS [Contcto]
FROM Suppliers AS s
WHERE Country != 'USA';
GO

--Seleccionar los productos caros y con bajo stock, con precios mayores a 50
-- y stock menor a 50

SELECT ProductName AS [Nombre Producto], SupplierID AS [Provedor], 
UnitsInStock AS [Existencia], UnitPrice AS [Precio Unitario]
FROM Products
WHERE UnitPrice >50 and UnitsInStock <20;
GO

SELECT ProductName AS [Nombre Producto], Suppliers.SupplierID AS [Provedor], 
UnitsInStock AS [Existencia], UnitPrice AS [Precio Unitario]
FROM Products, Suppliers
WHERE (Products.SupplierID = Suppliers.SupplierID)
AND (UnitPrice>50 and UnitsInStock<20);
GO

SELECT p.ProductName AS [Nombre Producto], s.SupplierID AS [Provedor], 
s.CompanyName AS [Nombre del Proveedor],
p.UnitsInStock AS [Existencia],
p.UnitPrice AS [Precio Unitario]
FROM Products AS p, Suppliers AS s
WHERE (p.SupplierID = s.SupplierID)
AND (UnitPrice>50 and UnitsInStock<20);
GO

SELECT ProductName AS [NOMBRE DE PRODUCTO], s. SupplierID AS [Proveedor], UnitsInStock AS [Existencia],UnitPrice AS [Precio]
FROM Products AS p
INNER JOIN
Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE (p.SupplierID = s.SupplierID)AND 
(UnitPrice>50 and UnitsInStock <20);


--Clientes de México y España y que tengan región
SELECT c.CompanyName AS [Cliente],
		c.City AS [Cuidad],
		c.Country AS [País],
		c.Region AS [Región]
FROM 
Customers AS c
WHERE (Country = 'Mexico' or Country='Spain') 
AND Region is not null;
GO

--Productos que no estan descntinuados y tienen inventario

SELECT p.ProductName AS [Nombre del Prodcuto], p.UnitsInStock AS [Existencia],
	p.UnitsInStock AS [Precio], Discontinued,
	(p.UnitPrice*p.UnitsInStock) AS [Precio del inventario]
FROM Products AS p
WHERE p.Discontinued =1 AND p.UnitsInStock>0;

--Provedores que no son de USA ni de Reino Unido
SELECT s.CompanyName AS [Empresa], s.City AS [Ciudad],
		s.Country AS [País]
FROM Suppliers AS s
WHERE s.Country = 'USA' or s.Country='UK';
GO


SELECT s.CompanyName AS [Empresa], s.City AS [Ciudad],
		s.Country AS [País]
FROM Suppliers AS s
WHERE NOT (s.Country = 'USA' or s.Country='UK');
GO


SELECT s.CompanyName AS [Empresa], s.City AS [Ciudad],
		s.Country AS [País]
FROM Suppliers AS s
WHERE s.Country <> 'USA' and s.Country <>'UK';
GO

--Order By

-- Seleccionar todos los proveedores mostrado el nombre del provedor, el país, 
-- la ciudad ordenada por país, de menor a mayor

SELECT s.CompanyName AS [Nombre del Proveedor], 
		s.Country AS [País], 
		s.City AS [Cuidad]
FROM Suppliers AS s
ORDER BY s.Country ASC;


SELECT s.CompanyName AS [Nombre del Proveedor], 
		s.Country AS [País], 
		s.City AS [Cuidad]
FROM Suppliers AS s
ORDER BY s.Country DESC;


-- Seleccionar todos los proveedores mostrado el nombre del provedor, el país, 
-- la ciudad ordenada por país, de mayor a menor y dentro del país por 
-- cuidad de menor a mayor

SELECT s.CompanyName AS [Nombre del Proveedor], 
		s.Country AS [País], 
		s.City AS [Cuidad]
FROM Suppliers AS s
ORDER BY s.Country DESC, s.City ASC;

SELECT getdate()

SELECT DATEPART (year,'2025-07-23')
SELECT DATEPART (year, getdate())
SELECT DATEPART (yy, getdate())
SELECT DATEPART (yyyy, getdate())
SELECT DATEPART (q, getdate())

--Seleccionar todas aquellas ordenes que se realizaron en 1998

SELECT OrderID,OrderDate,ShipCity, ShipCountry,
DATEPART(yyyy,OrderDate) AS 'Año'
FROM Orders
WHERE DATEPART(yy,OrderDate) = 1998;


SELECT max(year(OrderDate))
FROM Orders


--Seleccionar todas las ordenes que se hicieron en el trimestre 3 del año

SELECT OrderID, OrderDate, ShipCity, ShipCountry,
DATEPART (yyyy, OrderDate) AS 'Trimestre'
FROM Orders
WHERE DATEPART (q, OrderDate) = 3;

SELECT OrderID, OrderDate, ShipCity, ShipCountry,
DATEPART (yyyy,OrderDate) AS [Año],
DATENAME (month,OrderDate) AS 'Nombre del Mes',
DATEPART (MONTH,OrderDate) AS [Número del Mes],
DATENAME (weekday, OrderDate) AS 'Nombre del día'
FROM Orders
WHERE Month(OrderDate) = 7 
or MONTH(OrderDate) = 8
or MONTH(OrderDate) = 9;


--Seleccionar los países de nuestros clientes
SELECT DISTINCT Country
FROM Customers 
ORDER BY Country ASC


--Seleccionar todos los países y cuidades unicas de los provedores

SELECT DIstinct Country, City
FROM Suppliers

--Mostrar las fechas distintas de compra

SELECT Distinct OrderDate
FROM Orders

--Mostrar las categorias distintas de los productos

SELECT DISTINCT CategoryID
FROM Products

--Seleccionar todas las ordenes con mas de 30 días desde la fecha requerida hasta la fecha de pedido

SELECT OrderDate, RequiredDate,
DATEDIFF(DAY, OrderDate, RequiredDate) AS 'Días'
FROM Orders
WHERE DATEDIFF(DAY, OrderDate, RequiredDate) > 30 

--Seleccionar todos los productos cuyo precio unitario con un impuesto de 20% sea mayor a 30 

SELECT *
FROM Products
WHERE UnitPrice * 1.20 > 30;


--Seleccionar todas las ordenes cuyo total es mayor a 100

SELECT *, (UnitPrice * Quantity) AS [Total]
FROM [Order Details]
WHERE (UnitPrice*Quantity) > 100;

--Test de Rango (Between)

--Selecciona todos los productos con un precio entre 20 y 30 monedas unitarias

SELECT *
FROM Products
WHERE UnitPrice >=20 and UnitPrice<=30;

SELECT *
FROM Products
WHERE UnitPrice between 20 and 30;