CREATE DATABASE TechShop

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'John', 'Jones', 'john@example.com', '123-456-7890', '123 Block'),
(2, 'Alice', 'Wonderland', 'alice@example.com', '987-654-3210', '456 Block'),
(3, 'Emily', 'Clark', 'emily@example.com', '555-123-4567', '789 Block'),
(4, 'Michael', 'Jackson', 'michael@example.com', '111-222-3333', '321 Block'),
(5, 'Sophia', 'Turner', 'sophia@example.com', '444-555-6666', '987 Block'),
(6, 'Daniel', 'Brown', 'daniel@example.com', '777-888-9999', '654 Block'),
(7, 'Olivia', 'Rodrigo', 'olivia@example.com', '666-777-8888', '234 Block'),
(8, 'Ethan', 'Hunt', 'ethan@example.com', '333-444-5555', '852 Block'),
(9, 'Ava', 'Smith', 'ava@example.com', '222-333-4444', '741 Block'),
(10, 'William', 'Prince', 'william@example.com', '999-000-1111', '963 Block');


INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', '15-inch, 8GB RAM, 512GB SSD', 999.99),
(2, 'Smartphone', '6.5-inch, 128GB storage', 599.99),
(3, 'Tablet', '10-inch, 64GB storage', 299.99),
(4, 'Smartwatch', 'Water-resistant, fitness tracker', 149.99),
(5, 'Camera', '20MP, DSLR', 799.99),
(6, 'Headphones', 'Wireless, noise-canceling', 199.99),
(7, 'Speaker', 'Bluetooth speaker', 129.99),
(8, 'External Hard Drive', '1TB storage', 79.99),
(9, 'Gaming Console', 'Electronic widget', 499.99),
(10, 'Printer', 'Wireless printer', 249.99);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2023-11-01', 999.99),
(2, 2, '2023-11-02', 1199.98),
(3, 3, '2023-11-03', 299.99),
(4, 4, '2023-11-04', 449.98),
(5, 5, '2023-11-05', 199.99),
(6, 6, '2023-11-06', 129.99),
(7, 7, '2023-11-07', 159.98),
(8, 8, '2023-11-08', 799.99),
(9, 9, '2023-11-09', 499.99),
(10, 10, '2023-11-10', 249.99);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 2, 4, 2),
(5, 3, 5, 1),
(6, 4, 6, 1),
(7, 5, 7, 1),
(8, 6, 8, 1),
(9, 7, 9, 1),
(10, 8, 10, 1);


INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 50, '2023-11-01'),
(2, 2, 100, '2023-11-01'),
(3, 3, 30, '2023-11-01'),
(4, 4, 50, '2023-11-01'),
(5, 5, 20, '2023-11-01'),
(6, 6, 80, '2023-11-01'),
(7, 7, 40, '2023-11-01'),
(8, 8, 100, '2023-11-01'),
(9, 9, 60, '2023-11-01'),
(10, 10, 25, '2023-11-01');


--1. Write an SQL query to retrieve the names and emails of all customers. 

SELECT FirstName, LastName, Email
FROM Customers;

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (11, 'New', 'Customer', 'newcustomer@example.com', '123-456-7890', '123 Block');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

UPDATE Products
SET Price = Price * 1.10
WHERE Description LIKE '%electronic%';

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables.
--Allow users to input the order ID as a parameter.

DECLARE @OrderIDToDelete INT = 1;
DELETE FROM OrderDetails WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders WHERE OrderID = @OrderIDToDelete;

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 1, '2023-11-11', 99.99); 

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 
--Allow users to input the customer ID and new contact information.

UPDATE Customers
SET Email = 'newemail@example.com', Address = 'New Address'
WHERE CustomerID = 11;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OD.Quantity * P.Price)
    FROM OrderDetails OD
    JOIN Products P ON OD.ProductID = P.ProductID
    WHERE OD.OrderID = Orders.OrderID
    GROUP BY OD.OrderID
);

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. 
--Allow users to input the customer ID as a parameter.

DECLARE @CustomerIDToDelete INT=5;
DELETE FROM OrderDetails WHERE OrderID IN( SELECT OrderID FROM Orders WHERE CustomerID=@CustomerIDToDelete);
DELETE FROM Orders WHERE CustomerID = @CustomerIDToDelete;

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.

INSERT INTO Products VALUES(11,'Electronic trimmer','2mm blade',299.99);
INSERT INTO Products VALUES(12,'E Brush','Electronic widget',199.99);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). 
--Allow users to input the order ID and the new status.

ALTER TABLE Orders
ADD Status VARCHAR(50) DEFAULT 'Pending';
UPDATE Orders
SET Status = 'Shipped' 
WHERE OrderID = 4;

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.

ALTER TABLE Customers  
ADD NumOrders INT;
Update Customers
SET NumOrders = (Select COUNT(OrderID) from Orders WHERE Orders.CustomerID = Customers.CustomerID)

--Aggregate Functions
--1.Write an SQL query to find out which customers have not placed any orders.

SELECT C.* FROM Orders O RIGHT JOIN Customers C ON O.CustomerID = C.CustomerID where O.OrderID IS NULL;

--2. Write an SQL query to find the total number of products available for sale. 

SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

--3. Write an SQL query to calculate the total revenue generated by TechShop. 

SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
--Allow users to input the category name as a parameter.

DECLARE @CategoryName VARCHAR(50) = 'Electronic widget'; 

SELECT AVG(Quantity) AS AverageQuantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Description = @CategoryName;


--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
--to input the customer ID as a parameter.

DECLARE @CustomerID INT = 2;  
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = @CustomerID;

--6. Write an SQL query to find the customers who have placed the most orders. List their names 
--and the number of orders they've placed.
SELECT C.FirstName, C.LastName, COUNT(O.OrderID) FROM Customers C LEFT JOIN Orders O ON C.CustomerID = O.CustomerID GROUP BY C.FirstName, C.LastName;

--7. Write an SQL query to find the most popular product category, which is the one with the highest 
--total quantity ordered across all orders.
SELECT TOP 1 COUNT(*) AS HighestTotalQuantityOrdered, Description AS Category FROM Products GROUP BY Description ORDER BY HighestTotalQuantityOrdered DESC;

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.
SELECT FirstName, LastName FROM Customers WHERE CustomerID IN(SELECT TOP 1 CustomerID FROM Orders GROUP BY CustomerID ORDER BY SUM(TotalAmount) DESC)

SELECT TOP 1
    Customers.FirstName,
    Customers.LastName,
    SUM(Orders.TotalAmount) AS TotalSpending
FROM 
    Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY 
    Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY 
    TotalSpending DESC;

	SELECT * FROM ORDERS

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.
SELECT AVG(TotalAmount) FROM Orders GROUP BY CustomerID;

--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count
SELECT C.FirstName, C.LastName, COUNT(O.OrderID) FROM Customers C LEFT JOIN Orders O ON C.CustomerID=O.CustomerID GROUP BY C.FirstName, C.LastName;

--# Joins

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue.
SELECT P.ProductName, SUM(OD.Quantity * P.Price) AS TotalRevenue FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.Description LIKE '%Electronic%' GROUP BY P.ProductName;

--3. Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.
SELECT C.FirstName, C.LastName, C.Email, C.Phone, O.OrderID
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--total quantity ordered. Include the product name and the total quantity ordered.
SELECT TOP 1 P.ProductName, SUM(OD.Quantity) AS TotalQuantityOrdered FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.Description LIKE '%Electronic%' GROUP BY P.ProductName ORDER BY TotalQuantityOrdered DESC;

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
--categories.
SELECT ProductName, Description AS Category
FROM Products
WHERE Description LIKE '%Electronic%';

--6. Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value.
SELECT C.FirstName, C.LastName, AVG(OD.Quantity * P.Price) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY C.FirstName, C.LastName;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.
SELECT TOP 1 O.OrderID, C.FirstName, C.LastName, SUM(OD.Quantity * P.Price) AS TotalRevenue FROM Customers C 
JOIN Orders O ON O.CustomerID = C.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY O.OrderID, C.FirstName, C.LastName
ORDER BY TotalRevenue DESC;

--8. Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered.
SELECT P.ProductName, COUNT(*) AS OrderCount FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID 
WHERE P.Description LIKE '%Electronic%' GROUP BY P.ProductName;

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.
DECLARE @ProductName VARCHAR(50) = '%Electronic%'
SELECT C.FirstName, C.LastName, P.ProductName FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID 
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.Description LIKE @ProductName;

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters.
SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID
JOIN Orders O ON O.OrderID = OD.OrderID 
WHERE O.OrderDate BETWEEN '2023-11-01' AND '2023-11-05'; 
