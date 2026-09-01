--Join.-------------------------

--1. Inner_Join-----

--Dead_Lock--------
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
