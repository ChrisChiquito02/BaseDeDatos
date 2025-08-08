# SQL-LMD (insert, delete, update, select)

USE NORTHWND;

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

# Alias de Columna
SELECT CustomerID AS 'Numero Empleado',
		CompanyName Empresa,
		City AS Cuidad,
		ContactName AS [Nombre del Contacto]
FROM Customers;

# Alias de Tablas
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


# Seleccionar todos los productos de la categoria 1
# Total de los productos
SELECT p.ProductID AS [Número],
		p.ProductName AS [Nombre],
		p.CategoryID AS [Categoria],
		p.UnitPrice AS [Precio],
		p.UnitsInStock AS [Cantidad de productos],
		(p.UnitPrice * p.UnitsInStock) AS [Costo del inventario]
FROM
Products AS P
WHERE CategoryID=1;

# Seleccionar todos los productos de la categoria condiments

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

# Seleccionar todos los productos que su precio sea mayor a 40.3

SELECT *
FROM Products AS p;

SELECT p.ProductID AS [ID del Producto],
		p.ProductName AS [Nombre del Producto],
		p.UnitPrice AS [Precio]
FROM
Products AS P
WHERE p.UnitPrice>40.3;

# Seleccionar todos los productos que su categoria sea diferente de 3
SELECT p.ProductID AS [ID del Producto],
		p.ProductName AS [Nombre del Producto],
		p.UnitPrice AS [Precio]
FROM
Products AS P
WHERE p.CategoryID <> 3;

# Seleccionar todas las ordenes que ean de Brazil - Rio de Janeiro, mostrando solo el número de orden, 
# la fecha de orden, páis de envio, la Cuidad y su transportista

SELECT *
FROM Orders;

SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
		o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipCity = 'Rio de Janeiro';

# Seleccionar todas las ordenes, mostrando lo mismo que la consulta anterior, pero todas aquellas que no tengan región de envío
SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
		o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipRegion is null;

# Seleccionar todas las ordenes, mostrando lo mismo que la consulta anterior, pero todas aquellas que si tengan región de envío
SELECT o.OrderID AS [Número de Orden],
		o.OrderDate AS [Fecha de Orden],
		o.ShipCountry AS [País de Envío],
		o.ShipCity AS [Cuidad de Envío],
		o.ShipVia AS [Transportista],
		o.ShipRegion AS [Región]
FROM Orders AS o
WHERE ShipRegion is not null;

# Seleccionar todas las ordenes enviadas a Brazil, Alemania, México y con región

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


# Seleccionar todas las ordenes de Francia, Alemania y Argentina (Clausula in)
SELECT *
FROM Orders
WHERE ShipCountry 
			in ('Germany', 'France', 'Argentina')


# Seleccionar todos los productos descontinuados o con precio mayor a 50, ordenados por el precio
SELECT p.ProductID, p.ProductName, p.Discontinued, p.UnitPrice
FROM Products AS p
WHERE p.Discontinued=1
	or p.UnitPrice > 50
ORDER BY p.UnitPrice DESC;
