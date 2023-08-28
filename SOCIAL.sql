## 11. Create Student Table with ID as Primary Key and NOT NULL , 
##     Name as 20 Characters ,Age as Int value both are NOT NULL and Address have  25 charter And Insert Any 5 Records?  

create table Student
(
  ID int NOT NULL,
  NAME varchar(20) not null,
  Age int not null,
  Address char(25)
  primary key (ID)
);

insert into Student values(1,"Deepak",25,"EL 30"),(4,"Deepak",25,"EL 30"),(2,"Deep",23,"EL 30"),(3,"Del",25,"EL 30"),(5,"Dol",25,"EL 30");

## 12.  Write an SQL query to find the youngest student in the "student" table ? Note: Add "GitHub" link for the solution if required  

select * from Student
order by Age
limit 1;

## 13.  Write an SQL query to retrieve the names and addresses of all persons from the "Person" table along with their corresponding addresses from the "Address" table.

select p.FirstName, p.LastName,a.City, a.State
from person p
left join Address a
on p.PersonId = a.PersonId

##14. Write an SQL query to fetch the second highest number from the "student" table.?

select * from Student
where Age not in (select Age from Student order by Age limit 1)
order by Age
limit 1

## 15.  SQL Quary to get the nth highest salary from Employee table

  Lets say for 5th highest salary:
  
SELECT * FROM (SELECT ID, salary, DENSE_RANK() OVER (ORDER BY emp_salary DESC) AS n
  FROM Employee
)
WHERE n = 5;

## 16.  Write a SQL query to find the median salary of each company.?

SELECT
    Company,
    CASE
        WHEN COUNT(*) % 2 = 0 THEN
            (MAX(Salary) + MIN(Salary)) / 2.0
        ELSE
            PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Salary) 
            OVER (PARTITION BY Company) 
    END AS MedianSalary
FROM Employee
GROUP BY Company;


## 17.  Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 month but exclude the most recent month? 
  The result should be display by id ascending and then by month decending ?



## 18.  Write the Query to find the Shortest Distance in Plane

SELECT SQRT(MIN((POW(p1.x - p2.x, 2) + POW(p1.y - p2.y, 2)))) AS shortest FROM point_2d p1 JOIN point_2d p2 ON p1.x != p2.x OR p1.y != p2.y ;

## 19.  Consider a database with two tables: "Orders" and "Customers." Write an SQL query to retrieve the top 5 customers who have made the most orders, 
  along with the total count of their orders.
  Display the results in descending order of the order count and ascending order of customer names.

SELECT 
    C.CustomerName,
    COUNT(O.OrderID) AS TotalOrders
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName
ORDER BY TotalOrders DESC
LIMIT 5;

## 20.  Consider a database schema that represents an online bookstore with two tables: books and orders.
  The books table has columns: book_id, title, author, price, and stock_quantity. The orders table has columns: order_id, book_id, quantity, 
  and order_date.Write an SQL query to find the top 3 bestselling products in terms of total quantity sold, along with their names and total quantities sold.

SELECT
    B.title AS ProductName,
    SUM(O.quantity) AS TotalQuantitySold
FROM books AS B
JOIN orders AS O ON B.book_id = O.book_id
GROUP BY B.title
ORDER BY TotalQuantitySold DESC
LIMIT 3;
