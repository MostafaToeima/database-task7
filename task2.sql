--Data Definition Questions: (using SQL NOT GUI)
--1.	Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees (
    Emp_id INTEGER PRIMARY KEY,
    Emp_Name varchar(20),
    Emp_salary decimal
);

--2.	Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE [Employees]
ADD Department varchar(50)
--3.	Remove the "Salary" column from the "Employees" table.
ALTER TABLE [Employees]
Drop [Emp_salary] 
--4. Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN'


--5. Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects (
    ProjectID   INT,
    ProjectName VARCHAR(50)
)


--6. Add a primary key constraint to the "Employees" table for the "ID" (Emp_id) column.
ALTER TABLE Employees
ADD CONSTRAINT PK_Employees_Emp_id PRIMARY KEY (Emp_id)
GO

--7. Create a foreign key relationship between "Employees" (ID) and "Projects" (ProjectID).
ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_Employees
    FOREIGN KEY (ProjectID) REFERENCES Employees(Emp_id)


--8. Remove the foreign key relationship between "Employees" and "Projects".
ALTER TABLE Projects
DROP CONSTRAINT FK_Projects_Employees


--9. Add a unique constraint to the "Name" (Emp_Name) column in the "Employees" table.
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name UNIQUE (Emp_Name)

--10. Create a table named "Customers".
CREATE TABLE Customers (
    CustomerID INT,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Email      VARCHAR(50),
    Status     VARCHAR(20)
)


--11. Add a unique constraint to the combination of "FirstName" and "LastName".
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_First_Last UNIQUE (FirstName, LastName)


--12. Add a default value of 'Active' for the "Status" column in "Customers".
ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_Status
    DEFAULT 'Active' FOR Status


--13. Create a table named "Orders".
CREATE TABLE Orders (
    OrderID     INT,
    CustomerID  INT,
    OrderDate   DATETIME,
    TotalAmount DECIMAL(10,2)
)


--14. Add a check constraint to "TotalAmount" to ensure it is greater than zero.
ALTER TABLE Orders
ADD CONSTRAINT CHK_Orders_TotalAmount_Positive
    CHECK (TotalAmount > 0)


--15. Create a schema named "Sales" and move the "Orders" table into it.
CREATE SCHEMA Sales


ALTER SCHEMA Sales
TRANSFER dbo.Orders


--16. Rename the "Orders" table to "SalesOrders".
EXEC sp_rename 'Sales.Orders', 'SalesOrders'

