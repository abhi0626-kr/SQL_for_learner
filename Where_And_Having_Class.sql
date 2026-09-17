-- WHERE = filters ROWS, before grouping
-- HAVING = filters GROUPS, after grouping
use Joins;

-- WHERE: Give me only Delivered orders
SELECT * FROM Orders WHERE Status = 'Delivered';
-- HAVING: Give me only Customers who spent MORE than 50000 total
SELECT CustomerID, SUM(OrderAmount) as Total
FROM Orders
GROUP BY CustomerID
HAVING SUM(OrderAmount) > 50000; --This you CANNOT do with WHERE.

--Side by side:sql
-- Find cities with more than 1 customer

-- WRONG - WHERE can't use COUNT
SELECT CityID, COUNT(*) FROM Customer WHERE COUNT(*) > 1 GROUP BY CityID;

-- CORRECT - HAVING can use COUNT
SELECT CityID, COUNT(*) as Total
FROM Customer
WHERE CityID IS NOT NULL -- WHERE filters rows first (removes NULL city)
GROUP BY CityID
HAVING COUNT(*) > 1;
-- HAVING filters groups after

--Result:javascript
	--1001 Bangalore | 3
	--1003 Mumbai | 2
	--1006 Los Angeles | 2

--Order of execution:
--FROM - takes table
--WHERE - removes unwanted rows
--GROUP BY - makes groups
--HAVING - removes unwanted groups
--SELECT - shows result
--ORDER BY - sorts

--Simple Rule:Use WHERE for normal columns.
--Use HAVING for COUNT(), SUM(), AVG(), MAX(), MIN()