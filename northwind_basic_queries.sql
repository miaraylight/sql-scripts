use northwind;

-- 1. What is the name of the table that holds the items Northwind sells?
select * 
from products;

-- 2. Write a query to list the product id, product name, and unit price of every product.
select ProductID, ProductName, UnitPrice
from products;

-- 3. Write a query to list the product id, product name, and unit price of every product. 
-- Except this time, order then in ascending order by price.
select ProductID, ProductName, UnitPrice
from products
order by UnitPrice;

-- 4. What are the products that we carry where the unit price is $7.50 or less?
select ProductName, UnitPrice
from products
where UnitPrice < 7.50;

-- 5. What are the products that we carry where we have at least 100 units on hand? 
-- Order them in descending order by price.
select ProductName, UnitPrice, UnitsInStock
from products
where UnitsInStock > 100
order by UnitPrice desc;

-- 6. What are the products that we carry where we have at least 100 units on
-- hand? Order them in descending order by price. If two or more have the
-- same price, list those in ascending order by product name.
select ProductName, UnitPrice, UnitsInStock
from products
where UnitsInStock > 100
order by UnitPrice desc, ProductName;

-- 7. What are the products that we carry where we have no units on hand, but 
-- 1 or more units of them on backorder? Order them by product name.
select ProductName, UnitPrice, UnitsInStock, UnitsOnOrder
from products
where UnitsInStock = 0 and UnitsOnOrder >= 1
order by ProductName;

-- 8. What is the name of the table that holds the types (categories) of the items
-- Northwind sells?
select * 
from categories;

-- 9. Write a query that lists all of the columns and all the rows of the categories
-- table? What is the category id of seafood?
select CategoryId, CategoryName
from categories
where CategoryName like('%eafood');

-- 10. Examine the Products table. How does it identify the type (category) of
-- each item sold? Write a query to list all of the seafood items we carry.
select *
from products
where CategoryID = 8;

-- 11. What are the first and last names of all of the Northwind employees?
select FirstName, LastName
from employees;

-- 12. What employees have "manager" in their titles?
select FirstName, LastName, Title
from employees
where Title like('%manager%');

-- 13. List the distinct job titles in employees.
select distinct Title
from employees;

-- 14. What employees have a salary that is between $200 0 and $2500?
select FirstName, LastName, Salary
from employees
where salary between 2000 and 2500;

-- 15. List all the information about all of Northwind's suppliers.
select *
from suppliers;

-- 16. Examine the Products table. How do you know what supplier supplies
-- each product? Write a query to list all the items that "Tokyo Traders"
-- supplies to Northwind
select SupplierID, CompanyName
from suppliers
where CompanyName = 'Tokyo Traders';

select * 
from products
where SupplierID = 4;
