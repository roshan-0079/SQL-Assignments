-- 1.DATABASE DESIGN
-- Q1
CREATE DATABASE TechShop

-- 2.DDL
-- Q1
CREATE TABLE Customers(
CustomerID int primary key,
FirstName varchar(50),
LastName varchar(50),
Email varchar(60),
Phone char(10),
Address varchar(50)
);
create table Products
(
ProductID int primary key,
ProductName varchar(50),
Description varchar(100),
Price int
)
create table Orders
(
OrderID int primary key,
CustomerID int foreign key(CustomerID) REFERENCES Customers(CustomerID) on delete cascade,
OrderDate date,
TotalAmount int
)
create table OrderDetails
(
OrderDetailsID int primary key,
OrderID int foreign key(OrderID) references Orders(OrderID) on delete cascade,
ProductID int foreign key(ProductID) references Products(ProductID) on delete cascade,
Quantity int
)
create table Inventory
(
InventoryID int primary key,
ProductID int foreign key(ProductID) references Products(ProductID) on delete cascade,
QuantityInStock int,
LastStockUpdate date
)

-- 3.DML
--Q. a
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(101,'ROSHAN','SHAIK','shaiklaaiqroshan@gmail.com','7989971398','Nellore')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(102,'SHARIF','SHAIK','shaiksharif@gmail.com','7989713989','Nellore')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(103,'PARVEEN','SHAIK','shaikparveen@gmail.com','7989971998','Nellore')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(104,'RASHEED','SHAIK','shaikrasheed@gmail.com','9989971398','Tirupathi')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(105,'SHIVAM','MISHRA','shivammishra@gmail.com','7987771399','Lucknow')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(106,'ROHAN','KURAPATI','rohan007@gmail.com','7989979899','Hyderabad')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(107,'CHARAN','ALIMILI','ac@gmail.com','7989945698','Banglore')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(108,'ARJUN','REDDY','arjunreddy@gmail.com','9010490401','Hyderabad')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(109,'KABIR','SINGH','kabirsingh@gmail.com','9010479899','Mumbai')
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(110,'SHAMAIL','SHAIK','shaikshamail786@gmail.com','7989990401','Mumbai')

insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(201,'Hair dryer','Used for drying your hair',500)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(202,'Apple pencil','pencil for iPad',25000)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(203,'PS5 controller','Controller for ps5',2000)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(204,'VR box','used to watch movies in VR',3000)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(205,'Portable Bluetooth speakers','listen to music anywhere',5000)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(206,'Wireless Headphones','wireless music device',3000)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(207,'Ipad case','case for Apple iPad 9th gen',500)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(208,'Keyboard','wired keyboard',400)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(209,'Mouse','wired mouse',300)
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(210,'512GB SSD','Solid state drive of 512GB capacity',7000)

insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(301,101,'2023-09-23',500)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(302,102,'2023-09-21',25000)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(303,103,'2023-10-23',2000)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(304,104,'2023-09-10',3000)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(305,105,'2023-07-23',5000)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(306,106,'2023-08-23',3000)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(307,107,'2023-09-30',500)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(308,108,'2023-09-12',400)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(309,109,'2023-09-29',300)
insert into [dbo].[Orders]([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(310,110,'2023-09-22',7000)

insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(401,301,201,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(402,302,202,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(403,303,203,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(404,304,204,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(405,305,205,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(406,306,206,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(407,307,207,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(408,308,208,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(409,309,209,1)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(410,310,210,1)

insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(501,201,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(502,202,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(503,203,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(504,204,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(505,205,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(506,206,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(507,207,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(508,208,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(509,209,10,'2023-11-28')
insert into [dbo].[Inventory]([InventoryID],[ProductID],[QuantityInStock],[LastStockUpdate])
values(510,210,10,'2023-11-28')

--Q.b
--Q1
select FirstName+' '+LastName as CustomerName, Email from Customers
--Q2
select OrderDate , FirstName+' '+LastName as CustomerName from Orders as o
inner join Customers as c on c.CustomerID = o.CustomerID
--Q3
insert into [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Email],[Phone],[Address])
values(111,'NEW','SHAIK','new@gmail.com','6989971398','Delhi')
--Q4
update Products set Price=Price+Price*0.1
--Q5
declare @x INT;
set  @x= 301;
delete from Orders where OrderID=@x;
--Q6
insert into Orders([OrderID],[CustomerID],[OrderDate],[TotalAmount])
values(312,101,'2023-09-23',500)
insert into [dbo].[OrderDetails]([OrderDetailsID],[OrderID],[ProductID],[Quantity])
values(412,312,201,1)
--Q7
declare @y int;
set @y = 102;
update Customers set Phone='1234567890' where CustomerID=@y;
--Q8   
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(p.Price * od.Quantity)
    FROM OrderDetails as od
	INNER JOIN Products as p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);
--Q9
declare @x INT;
set  @x= 312;
delete from Orders where OrderID=@x;
--Q10
insert into [dbo].[Products]([ProductID],[ProductName],[Description],[Price])
values(211,'Smart Watch','Smart Watch',2500)
--Q11
ALTER TABLE Orders ADD Status varchar(10); 
DECLARE @X INT;
SET @X = 302;
DECLARE @STATUS VARCHAR(10);
SET @STATUS = 'SHIPPED'
UPDATE Orders 
SET Status= @STATUS WHERE OrderID=@x;
--Q12
alter table Customers add TotalOrders int;
UPDATE Customers
SET TotalOrders = (
    SELECT COUNT(OrderID)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

--Joins
--Q1
select * from Orders as o
inner join Customers as c on c.CustomerID=o.CustomerID
--Q2
select ProductName,Price*Quantity as Total_Revenue from OrderDetails as od
inner join Products as p on p.ProductID=od.ProductID
--Q3
select * from Customers as c
inner join Orders as o on c.CustomerID=o.CustomerID
inner join OrderDetails as od on od.OrderID=o.OrderID
where Quantity>=1;
--Q4  This fetches the popular product but when there many popular products it misses out the others
SELECT P.ProductName, SUM(Quantity) as Popular_Product
FROM Products as P 
INNER JOIN OrderDetails as OD ON P.ProductID=OD.ProductID
GROUP BY P.ProductID,P.ProductName
ORDER BY Popular_Product DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY
--Q5  As category lies in description
SELECT ProductName,Description from Products
--Q6
SELECT c.CustomerID, FirstName,LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers as c
INNER JOIN Orders as o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
--Q7
SELECT OrderID, FirstName,LastName,Email,TotalAmount as Total_Revenue from Orders as o
INNER JOIN Customers as c on c.CustomerID=o.CustomerID
ORDER BY Total_Revenue desc
--Q8
SELECT ProductName,COUNT(OrderID) AS OrderCount 
FROM Products as p
LEFT JOIN OrderDetails ON p.ProductID = OrderDetails.ProductID
GROUP BY p.ProductName
ORDER BY OrderCount DESC;
--Q9
DECLARE @ProductName VARCHAR(50);
SET @ProductName = 'PS5 controller';
SELECT C.CustomerID,FirstName,LastName,Email FROM Customers as c
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products ON OD.ProductID = Products.ProductID
WHERE Products.ProductName = @ProductName;
--Q10
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SET @StartDate = '2023-05-01';
SET @EndDate = '2023-09-29';
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;

--AGGREGATE 
--Q1
SELECT CustomerID,FirstName,LastName,Email
FROM Customers
WHERE NOT EXISTS (
SELECT 1 FROM Orders
WHERE Orders.CustomerID = Customers.CustomerID
)
--Q2
SELECT COUNT(ProductID) AS TotalProducts
FROM Products;
--Q3
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;
--Q4 
DECLARE @PID INT;
SET @PID = 205;
select p.ProductID,ProductName, count(Quantity) as Total_quantity from Products as p
inner join OrderDetails as od on p.ProductID=od.ProductID
where p.ProductID = @PID 
group by p.ProductID,p.ProductName,Quantity
--Q5
DECLARE @CustomerID INT;
SET @CustomerID = 104;
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE  CustomerID = @CustomerID;
--Q6
SELECT TOP 1 Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName ORDER BY OrderCount DESC;
--Q7
SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantity
FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName ORDER BY TotalQuantity DESC;
--Q8
SELECT C.FirstName , C.LastName, SUM(OD.Quantity*P.Price) AS Total_Spending
FROM Customers AS C
INNER JOIN Orders as O ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails as OD ON O.OrderID=Od.OrderID
INNER JOIN Products as P ON OD.ProductID=P.ProductID
WHERE O.CustomerID=C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY Total_Spending DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY
--Q9
SELECT C.CustomerID,FirstName,LastName,AVG(TotalAmount) AS AverageOrderValue
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;
--Q10
SELECT C.CustomerID,FirstName,LastName,COUNT(OrderID) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY OrderCount DESC;

