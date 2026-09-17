







--1. Distint : 

	--DISTINCT - Removes duplicate valuessql-- Get unique country IDs from State table (India comes many times but shows once)

SELECT DISTINCT CountryID FROM State; --Total 5 catagory.

select count(CountryID) FROM State; --Total no of appera is 10.


-- Unique Status from Orders
SELECT DISTINCT Status FROM Orders; --Total 4 catagory.

select * from Orders;


--2. GroupBy
	-- Result: Delivered, Pending, Shipped, Cancelled2. GROUP BY - Makes groupssql-- How many customers per City?
SELECT CityID, COUNT(*) as TotalCustomers
FROM Customer
GROUP BY CityID;

--3. OrderBy
	-- Result: 1001 -> 3 customers (Bangalore), 1006 -> 2 customers (LA)3. ORDER BY - Sortingsql-- Orders from low to high amount
SELECT * FROM Orders ORDER BY OrderAmount ASC; -- ASC = small to big

-- Orders from high to low
SELECT * FROM Orders ORDER BY OrderAmount DESC; -- DESC = big to small4. SUM() - Totalsql-- Total revenue from all orders

--4. Sum
SELECT SUM(OrderAmount) as TotalRevenue FROM Orders;
-- Result: ~1084000.00

-- Total revenue per Customer
SELECT CustomerID, SUM(OrderAmount) as TotalSpent
FROM Orders
GROUP BY CustomerID;


--5. Count
	-- Customer 1 (Sandeep) = 25000+15000+5000+7000 = 520005. COUNT() - Count rowssql-- Total customers
SELECT COUNT(*) FROM Customer; -- 20

-- Customers who actually have a City (removes NULL)
SELECT COUNT(CityID) FROM Customer; -- 19, because 1 has NULL


--6. Avg
	-- Orders per Status
SELECT Status, COUNT(*) FROM Orders GROUP BY Status;

-- Average order value
SELECT AVG(OrderAmount) as AvgOrder FROM Orders;


-- Average order value per City
SELECT City.CityName, AVG(Orders.OrderAmount) as AvgOrder
FROM Customer JOIN City ON Customer.CityID = City.CityID
JOIN Orders ON Customer.CustomerID = Orders.CustomerID
GROUP BY City.CityName;


--7. Max - Biggest valuesql-- Biggest single order
SELECT MAX(OrderAmount) FROM Orders; -- 110000 (Chris Lee)

-- Biggest order per Country
SELECT Country.CountryName, MAX(Orders.OrderAmount)
FROM Country JOIN State ON Country.CountryID = State.CountryID
JOIN City ON State.StateID = City.StateID
JOIN Customer ON City.CityID = Customer.CityID
JOIN Orders ON Customer.CustomerID = Orders.CustomerID
GROUP BY Country.CountryName;

--8. Min - Smallest valuesql-- Smallest order
SELECT MIN(OrderAmount) FROM Orders; -- 5000

-- First order date per customer
SELECT CustomerID, MIN(OrderDate) as FirstOrder FROM Orders GROUP BY CustomerID;

-- Pro Tip for you: You always use GROUP BY WITH SUM, COUNT, AVG, MAX, MIN sql-- BEST EXAMPLE - All together:
SELECT 
  Status,
  COUNT(*) as TotalOrders,
  SUM(OrderAmount) as TotalAmount,
  AVG(OrderAmount) as Average,
  MAX(OrderAmount) as Biggest,
  MIN(OrderAmount) as Smallest
FROM Orders
GROUP BY Status
ORDER BY TotalAmount DESC;