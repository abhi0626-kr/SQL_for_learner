--Dead_Lock--------
--Dead lock is only when more and more user will appear the application may be crack, that where Dead Lock.
create database Joins;

Use Joins;


CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50)
);
INSERT INTO Country VALUES 
(1,'India'), (2,'USA'), (3,'UK'), (4,'Germany'), (5,'Australia');

-- 2. STATE - 10 States (8 have country, 2 are extra)
CREATE TABLE State (
    StateID INT PRIMARY KEY,
    StateName VARCHAR(50),
    CountryID INT FOREIGN KEY REFERENCES Country(CountryID)
);
INSERT INTO State VALUES 
(101,'Karnataka',1), 
(102,'Maharashtra',1), 
(103,'Delhi',1),
(104,'California',2), 
(105,'Texas',2),
(106,'London',3), 
(107,'Bavaria',4),
(108,'Sydney Region',5),
(109,'Tamil Nadu',1), 
(110,'Gujarat',1); -- No cities for these 2

-- 3. CITY - 15 Cities
CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50),
    StateID INT FOREIGN KEY REFERENCES State(StateID)
);
INSERT INTO City VALUES
(1001,'Bangalore',101), 
(1002,'Mysore',101), 
(1003,'Mumbai',102), 
(1004,'Pune',102),
(1005,'New Delhi',103),
(1006,'Los Angeles',104),
(1007,'San Francisco',104),
(1008,'Houston',105), 
(1009,'London City',106), 
(1010,'Munich',107),
(1011,'Sydney',108), 
(1012,'Brisbane',108), 
(1013,'Chennai',109),
(1014,'Ahmedabad',110),
(1015,'Noida',103);

-- 4. CUSTOMER - 20 Customers (Some cities have no customers, some customers have no city)
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CityID INT FOREIGN KEY REFERENCES City(CityID),
    Email VARCHAR(50)
);
INSERT INTO Customer VALUES
(1,'Sandeep Kumar',1001,'sandeep@gmail.com'),
(2,'Amit Sharma',1001,'amit@gmail.com'),
(3,'Priya Singh',1002,'priya@gmail.com'),
(4,'Rahul Verma',1003,'rahul@gmail.com'),
(5,'Neha Patel',1004,'neha@gmail.com'),
(6,'John Carter',1006,'john@us.com'),
(7,'David Miller',1007,'david@us.com'),
(8,'Emma Watson',1009,'emma@uk.com'),
(9,'Hans Muller',1010,'hans@de.com'),
(10,'Olivia Brown',1011,'olivia@au.com'),
(11,'Rajesh K',1001,'rajesh@gmail.com'),
(12,'Vikram S',1003,'vikram@gmail.com'),
(13,'Anjali M',1005,'anjali@gmail.com'),
(14,'Sarah Jones',1006,'sarah@us.com'),
(15,'Chris Lee',1007,'chris@us.com'),
(16,'No City Customer',NULL,'nocity@test.com'), -- Customer with NO city
(17,'Mike Johnson',1008,'mike@us.com'),
(18,'Sophia Clark',1011,'sophia@au.com'),
(19,'Arjun Das',1013,'arjun@gmail.com'),
(20,'Kiran P',1014,'kiran@gmail.com');

-- 5. ORDERS - 30 Orders (Some customers have many orders, some have zero)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    OrderAmount DECIMAL(10,2),
    OrderDate DATE,
    Status VARCHAR(20)
);
INSERT INTO Orders VALUES
(5001,1,25000,'2026-08-10','Delivered'), 
(5002,1,15000,'2026-08-11','Pending'),
(5003,2,32000,'2026-08-12','Delivered'), (5004,3,12000,'2026-08-12','Delivered'),
(5005,4,55000,'2026-08-13','Shipped'), (5006,4,22000,'2026-08-13','Delivered'),
(5007,5,18000,'2026-08-14','Pending'), (5008,6,75000,'2026-08-14','Delivered'),
(5009,7,82000,'2026-08-15','Delivered'), (5010,7,15000,'2026-08-15','Cancelled'),
(5011,8,45000,'2026-08-16','Delivered'), (5012,9,67000,'2026-08-16','Shipped'),
(5013,10,33000,'2026-08-17','Delivered'), (5014,11,28000,'2026-08-17','Delivered'),
(5015,12,41000,'2026-08-18','Pending'), (5016,12,19000,'2026-08-18','Delivered'),
(5017,13,27000,'2026-08-19','Delivered'), (5018,14,90000,'2026-08-19','Delivered'),
(5019,15,110000,'2026-08-20','Shipped'), (5020,1,5000,'2026-08-20','Delivered'),
(5021,2,8000,'2026-08-21','Delivered'), (5022,3,9000,'2026-08-21','Pending'),
(5023,4,12000,'2026-08-22','Delivered'), (5024,6,45000,'2026-08-22','Delivered'),
(5025,17,60000,'2026-08-23','Delivered'), (5026,18,38000,'2026-08-23','Delivered'),
(5027,19,21000,'2026-08-24','Shipped'), (5028,20,16000,'2026-08-24','Delivered'),
(5029,1,7000,'2026-08-25','Pending'), (5030,10,52000,'2026-08-25','Delivered');


--Join.------------

--1. Inner_Join-----

    --Inner join is use to join the common values from the different table.

---Only orders where Customer, 
--City, State, Country all exist
SELECT co.CountryName,
s.StateName, 
ci.CityName, 
cu.CustomerName, 
o.OrderID,
o.OrderAmount
FROM Orders o
INNER JOIN Customer cu ON o.CustomerID = cu.CustomerID
INNER JOIN City ci ON cu.CityID = ci.CityID
INNER JOIN State s ON ci.StateID = s.StateID
INNER JOIN Country co ON s.CountryID = co.CountryID
WHERE co.CountryName = 'India';


--Left Join-------------------
    --Left join is help to join two or more column from the same table(One Table).

---Find Customers who NEVER Ordered(Left Join)
SELECT cu.CustomerID,
cu.CustomerName, 
o.OrderID
FROM Customer cu
LEFT JOIN Orders o 
ON cu.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

---Find Cities with NO Customers(Right join)
SELECT ci.CityName, cu.CustomerName
FROM Customer cu
RIGHT JOIN City ci ON cu.CityID = ci.CityID
WHERE cu.CustomerID IS NULL;

---All States vs All Cities Report(Full join)
SELECT s.StateName, ci.CityName
FROM State s
FULL outer JOIN City ci ON s.StateID = ci.StateID;


---ALL Orders + Missing Info
-- This will never lose Orders, even if Customer is NULL
SELECT 
    o.OrderID, o.OrderAmount, o.Status,
    ISNULL(cu.CustomerName, 'NO CUSTOMER') AS CustomerName,
    ISNULL(ci.CityName, 'NO CITY') AS CityName,
    ISNULL(s.StateName, 'NO STATE') AS StateName,
    ISNULL(co.CountryName, 'NO COUNTRY') AS CountryName
FROM Orders o
LEFT JOIN Customer cu ON o.CustomerID = cu.CustomerID
LEFT JOIN City ci ON cu.CityID = ci.CityID
LEFT JOIN State s ON ci.StateID = s.StateID
LEFT JOIN Country co ON s.CountryID = co.CountryID
ORDER BY o.OrderAmount DESC;

----- Country-wise Total Business
SELECT 
    co.CountryName,
    COUNT(DISTINCT cu.CustomerID) AS TotalCustomers,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.OrderAmount) AS TotalBusiness
FROM Country co
LEFT JOIN State s ON co.CountryID = s.CountryID
LEFT JOIN City ci ON s.StateID = ci.StateID
LEFT JOIN Customer cu ON ci.CityID = cu.CityID
LEFT JOIN Orders o ON cu.CustomerID = o.CustomerID
GROUP BY co.CountryName
ORDER BY TotalBusiness DESC;

-----------------------------------------------------------------------------------------------------------------------

Use Joins; 

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Designation VARCHAR(30),
    ManagerID INT, -- This points to EmpID of same table
    City VARCHAR(30)
);

INSERT INTO Employee VALUES
(1, 'Sandeep Kumar', 'CEO', NULL, 'Bangalore'),
(2, 'Amit Sharma', 'CTO', 1, 'Bangalore'),
(3, 'Priya Singh', 'HR Manager', 1, 'Bangalore'),
(4, 'Rahul Verma', 'IT Lead', 2, 'Bangalore'),
(5, 'Neha Patel', 'Developer', 4, 'Mumbai'),
(6, 'Vikram Singh', 'Developer', 4, 'Bangalore'),
(7, 'Anjali Rao', 'HR Executive', 3, 'Mumbai'),
(8, 'John Carter', 'Developer', 4, 'Pune'),
(9, 'Rajesh K', 'Accountant', 3, 'Bangalore'),
(10, 'Arjun Das', 'Intern', 5, 'Mumbai');

---Find Employee + Manager Name
use Joins;
SELECT 
    E.EmpName AS Employee,
    E.Designation,
    M.EmpName AS Manager
FROM Employee E
LEFT JOIN Employee M ON E.ManagerID = M.EmpID;

select * from Employee

---Find Employees who have the same City 
SELECT 
    A.EmpName AS Employee1,
    B.EmpName AS Employee2,
    A.City
FROM Employee A
JOIN Employee B ON A.City = B.City 
AND A.EmpID < B.EmpID
ORDER BY A.City;

---Find Employees 
--at same level (Same Manager) - Colleagues
SELECT 
    E1.EmpName AS Employee1,
    E2.EmpName AS Employee2,
    M.EmpName AS SameManager
FROM Employee E1
JOIN Employee E2 ON E1.ManagerID = E2.ManagerID 
AND E1.EmpID < E2.EmpID
JOIN Employee M ON E1.ManagerID = M.EmpID;