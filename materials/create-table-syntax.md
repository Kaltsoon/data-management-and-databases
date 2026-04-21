# Create table syntax

Tables are created with the `CREATE TABLE` statements. Tables contain columns with varying data types depending on what kind of value (e.g. integer or text) the column stores.

```sql
CREATE TABLE Customer (
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(100) NOT NULL
)

CREATE TABLE CustomerOrder (
	order_id INT PRIMARY KEY,
	customer_id INT NOT NULL,
	order_date DATE NOT NULL,
	total_amount DECIMAL(10,2) NOT NULL,
	CONSTRAINT FK_CustomerOrder_Customer
		FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
)
```

Here are some of the most common data types:

| Data type    | Description                                                                                                                                                                                                                                         | Example value            |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `VARCHAR(n)`   | Variable-length non-Unicode character data (`n` must be between 1 and 8000)                                                                                                                                                                           | `'Alice Smith'`            |
| `DATE`         | Store a date only. From January 1, 0001 to December 31, 9999                                                                                                                                                                                        | `'2026-04-21'`             |
| `TIME`         | Store a time only to an accuracy of 100 nanoseconds                                                                                                                                                                                                 | `'14:30:45.1234567'`       |
| `DATETIME`     | From January 1, 1753 to December 31, 9999 with an accuracy of 3.33 milliseconds                                                                                                                                                                     | `'2026-04-21 14:30:45.123'` |
| `BIT`          | Boolean-like value in SQL Server. Stores `0` (false), `1` (true), or `NULL`                                                                                                                                                                         | `1`                      |
| `INT`          | Allows whole numbers between -2,147,483,648 and 2,147,483,647                                                                                                                                                                                       | `42`                     |
| `BIGINT`       | Allows whole numbers between -9,223,372,036,854,775,808 and 9,223,372,036,854,775,807                                                                                                                                                               | `9876543210`             |
| `DECIMAL(p,s)` | Fixed precision and scale numbers. Allows numbers from -10^38 +1 to 10^38 –1. The `p` parameter indicates the maximum total number of digits (1–38, default 18). The s parameter indicates digits to the right of the decimal point (0–`p`, default 0). | `12345.67`               |

The full list of data types can be found [here](https://www.w3schools.com/sql/sql_datatypes.asp) (scroll to "SQL Server Data Types" section).

## Primary key

Primary key is a unique column, which identifies each row.

```sql
CREATE TABLE Course (
    -- With a single column primary key, the constraint can be specified after the column's data type
	course_code VARCHAR(10) PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL
)

CREATE TABLE Enrollment (
	student_id INT NOT NULL,
	course_code VARCHAR(10) NOT NULL,
	enrolled_on DATE NOT NULL,
    -- Composite primary key needs to be defined using the CONSTRAINT keyword
	CONSTRAINT PK_Enrollment PRIMARY KEY (student_id, course_code)
)
```

> [!IMPORTANT]
> The name of the constraint can be chosen freely with `CONSTRAINT name_of_constraint`. However, the name should be _unique within the database_. Here's some naming conventions for the constraints:
> 
> - Primary keys: `CONSTRAINT PK_NameOfTable`
> - Foreign keys: `CONSTRAINT FK_TableA_TableB`
> - Other constraints: `CONSTRAINT ConstraintType_nameOfColumn`

### Automatically generated primary key values

Primary key column can be defined as an [identity column](https://www.geeksforgeeks.org/sql/sql-server-identity/), which will generate a unique primary key value automatically. The value will be an integer with increasing value (1, 2, 3...). This is useful for surrogate keys.

```sql
CREATE TABLE Product (
    -- The IDENTITY keyword specifies the identity column
	product_id INT IDENTITY PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	unit_price DECIMAL(10,2) NOT NULL
)

-- We don't need to define a value for the identity column, it will be generated automatically
INSERT INTO Product (product_name, unit_price)
VALUES
	('Keyboard', 49.90),
	('Mouse', 19.90);
```

## Foreign keys

Foreign key establishes a link between two tables by referencing a primary key.

```sql
CREATE TABLE Department (
	department_id INT PRIMARY KEY,
	department_name VARCHAR(100) NOT NULL
)

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY,
	employee_name VARCHAR(100) NOT NULL,
	department_id INT NOT NULL,
	CONSTRAINT FK_Employee_Department
		FOREIGN KEY (department_id) REFERENCES Department(department_id)
)
```

If a primary key is a composite key consisting of multiple columns, then the foreign key referencing it should also be a composite key.

```sql
CREATE TABLE Room (
	building_id INT NOT NULL,
	room_no INT NOT NULL,
    -- Composite primary key
	CONSTRAINT PK_Room PRIMARY KEY (building_id, room_no)
)

CREATE TABLE Desk (
	desk_id INT PRIMARY KEY,
	building_id INT NOT NULL,
	room_no INT NOT NULL,
    -- Composite foreign key
	CONSTRAINT FK_Desk_Room
		FOREIGN KEY (building_id, room_no)
		REFERENCES Room(building_id, room_no)
)
```

## Unique columns

The [UNIQUE](https://www.w3schools.com/sql/sql_unique.asp) constraint can be used to enforce the uniqueness of a column.

```sql
CREATE TABLE AppUser (
	user_id INT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE
)

INSERT INTO AppUser (user_id, email)
VALUES
	(1, 'alex@example.com'),
	(2, 'sam@example.com')

-- This insert fails because email must be unique
INSERT INTO AppUser (user_id, email)
VALUES (3, 'alex@example.com')
```

Also, a group of columns can be enforced to be unique.

```sql
CREATE TABLE EmployeeEmail (
	employee_id INT PRIMARY KEY,
	email_type VARCHAR(20) NOT NULL,
	email_address VARCHAR(255) NOT NULL,
	CONSTRAINT UQ_EmployeeEmail_type_address UNIQUE (email_type, email_address)
)

INSERT INTO EmployeeEmail (employee_id, email_type, email_address)
VALUES
	(1, 'work', 'alex@example.com'),
	(2, 'personal', 'alex@example.com')

-- This insert fails because the combination (email_type, email_address) must be unique
INSERT INTO EmployeeEmail (employee_id, email_type, email_address)
VALUES (3, 'work', 'alex@example.com')
```

## Required columns

The [NOT NULL](https://www.w3schools.com/sql/sql_notnull.asp) constraint can be used to mark a column as required, meaning it can't have a `NULL` value.

```sql
CREATE TABLE Supplier (
	supplier_id INT PRIMARY KEY,
    -- The NOT NULL constraint is specified after the column's data type
	supplier_name VARCHAR(100) NOT NULL,
	city VARCHAR(100)
)

INSERT INTO Supplier (supplier_id, supplier_name, city)
VALUES (1, 'Northwind Foods', 'Helsinki')

-- This insert fails because supplier_name is NOT NULL
INSERT INTO Supplier (supplier_id, supplier_name, city)
VALUES (2, NULL, 'Espoo')
```

## Custom column rules

The [CHECK](https://www.w3schools.com/sql/sql_check.asp) constraint can be used to define custom rules for columns. It accepts a condition that the column value should meet.

```sql
CREATE TABLE MovieRating (
	rating_id INT PRIMARY KEY,
	movie_title VARCHAR(100) NOT NULL,
	stars INT NOT NULL,
	rating_source VARCHAR(20) NOT NULL,
    -- The CHECK condition can be any condition with a true or false result
	CONSTRAINT CK_MovieRating_stars CHECK (stars BETWEEN 1 AND 5),
	CONSTRAINT CK_MovieRating_source CHECK (rating_source IN ('critic', 'user'))
)

INSERT INTO MovieRating (rating_id, movie_title, stars, rating_source)
VALUES (1, 'Inception', 5, 'critic')

-- This insert fails because stars must be between 1 and 5
INSERT INTO MovieRating (rating_id, movie_title, stars, rating_source)
VALUES (2, 'Interstellar', 6, 'user')

-- This insert fails because rating_source must be either critic or user
INSERT INTO MovieRating (rating_id, movie_title, stars, rating_source)
VALUES (3, 'Tenet', 4, 'editor')
```

## Indexes

Index is created on table column (or group of columns) to improve performance of queries filtering rows based on the column value. The following indexes are _created automatically_ by SQL Server:

- Columns with a `PRIMARY KEY` constraint.
- Columns with a `UNIQUE` constraint.

```sql
CREATE TABLE SalesOrder (
	order_id INT PRIMARY KEY,
	customer_id INT NOT NULL,
	order_date DATE NOT NULL,
	status VARCHAR(20) NOT NULL
)

-- "IX_customerId" is the name of the index, it can be chosen freely but should be unique within the table
CREATE INDEX IX_customerId
	ON SalesOrder(customer_id)

-- This query benefits from the index because it filters by customer_id
SELECT order_id, order_date, status
FROM SalesOrder
WHERE customer_id = 12345
```

Index can also be defined on multiple columns, improving the performance of queries that filter based on both columns, e.g. `customer_id = 12345 AND status = 'shipped'`.

```sql
CREATE INDEX IX_customerId_status
	ON SalesOrder(customer_id, status)
```

We can drop existing indexes using the `DROP INDEX` statement.

```sql
DROP INDEX IX_customerId ON SalesOrder
```

## Modifying existing tables

We can drop an existing table with the `DROP TABLE` statement.

```sql
DROP TABLE MovieRating
```

The `ALTER TABLE` statement can be used to alter an existing table's columns.

```sql
-- Add a new column
ALTER TABLE Supplier
ADD phone VARCHAR(20) NULL

-- Change a column's data type
ALTER TABLE Supplier
ALTER COLUMN phone VARCHAR(50) NULL

-- Drop a column
ALTER TABLE Supplier
DROP COLUMN phone

-- Add a constraint
ALTER TABLE Supplier
ADD CONSTRAINT CK_Supplier_City CHECK (city IN ('Helsinki', 'Espoo', 'Tampere'))

-- Drop a constraint
ALTER TABLE Supplier
DROP CONSTRAINT CK_Supplier_City
```
