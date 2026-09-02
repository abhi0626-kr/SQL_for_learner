--Dead_Lock--------
--Dead lock is only when more and more user will appear the application may be crack, that where Dead Lock.
select
o.Order_ID,
o.Order_Amount,
c.Customer_Name,
ci.City_Name,
s.State_Name,
country_Name
from OrderDetails (nolock) o
join Customer (nolock) c on o.cuctomer_ID = c.CustomerID
join City ci on c.City_ID = ci.City_ID
join state s on ci.StateID = s.State_ID
join country co on s.country_ID = co.country_ID
where c.Customer



--Join.-------------------------

use Foreign_Key;


--1. Inner_Join-----
select co.countryName,
s.stateName,
ci.CityName,
cu.CustomerNAme,
o.OrderID,
o.Order
--2. Right_Join-----
--2. Left_Join-----
--4. Full_Join-----
--5. Self_Join-----