-- Multi-Table Query Practice
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select 
p.*, 
c.CategoryName, c.Description as [CategoryDescription],
s.CompanyName as [SupplierName], s.Region as [SupplierRegion]
from [Product] p
join [Category] c on p.CategoryId = c.id
join [Supplier] s on s.id = p.SupplierId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.orderid, s.shippername, o.orderdate
from orders as o
join shippers as s on o.shipperid = s.shipperid
where o.orderdate < '2012-08-09 00:00:00.000'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.productname, od.quantity
from orderdetail as od
join product as p on od.productid = p.id
where od.orderId = 10251 order by p.productname

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id, c.companyname, e.lastname
from orders as o 
join customer as c on o.customerid = c.id
join employee as e on o.employeeid = e.id