---
colorSchema: light
fonts:
  sans: Roboto
  weights: "200,400,600,700"
---

## Physical database design

- The learning objectives for this week are:
  - Knowing the purpose of **physical database design**
  - Knowing the basic types of **integrity constraints**
  - Knowing how to create a basic set of tables with integrity constraints in SQL Server
  - Knowing what is meant by **database performance** and **database security**
  - Knowing the advantages and disadvantages of **database indexes** and how to create them on database tables in SQL Server

<div class="footnote">

_A substantial portion of these materials is derived from the work of Kari Silpiö. Any use, reproduction, or distribution of this content requires prior written permission from him._

</div>

---

## Physical database design

- Once we have designed a logical database schema based on a specific data model, we can start designing the **physical implementation of the database**
- The **physical database design** is concerned with the **target DBMS product** and all **physical-level details**
- The target DBMS product could be for example SQL Server, PostgreSQL, or MySQL
- The designer should be fully aware of the functionality of the target DBMS and must know how the computer system hosting the DBMS operates
- For example in RDBMSs, the common SQL syntax and functionality is the same, but there are still important differences
- In practice, physical design **must be tailored to a particular DBMS**

---

## Physical database design

- The outcome of the physical database design is the SQL statements for creating the database structures:

<div class="flex">

<div class="flex-1">

<pre>
Course(<u>course_code</u>, name, credits)

CourseInstance(
  <u>course_code</u>,
  <u>instance_number</u>,  
  start_date
)
  FOREIGN KEY (course_code)
  REFERENCES Course(course_code)
</pre>

</div>

<div class="flex-1 m-l-2">

```sql
CREATE TABLE Course (
  course_code VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  credits INT NOT NULL
)

CREATE TABLE CourseInstance (
  course_code VARCHAR(10),
  instance_number INT,
  start_date DATE NOT NULL,
  CONSTRAINT PK_CourseInstance
    PRIMARY KEY (course_code, instance_number),
  CONSTRAINT FK_Course_CourseInstance
    FOREIGN KEY (course_code) REFERENCES Course(course_code)
)
```

</div>

</div>

---

## Creating tables

- In a SQL database the data is stored into **tables** that have **columns** with different **data types**, such as `INTEGER`, `VARCHAR(n)`, and `DATE`
- Different DBMSs support mostly the same data types, but many of them also support their own, **non-standard data types**, such as PostgreSQL's `JSONB` data type for storing JSON data
- A database table can be created with the `CREATE TABLE` statement:

  ```sql
  CREATE TABLE Customer (
    -- customer_id can only contain integers, e.g. 59
    customer_id INTEGER PRIMARY KEY,
    -- customer_name can only contain text with maximum length of 50, e.g. "John Doe"
    customer_name VARCHAR(50),
    -- sign_up_date can only contain dates, e.g. '2026-04-21' (YYYY-MM-DD format)
    sign_up_date DATE
  )
  ```

---

## Database integrity

- When we create a table with the `CREATE TABLE` statement, we can define different **constraints** for the table
- Constraints enforce the database integrity in different ways:
  - The `PRIMARY KEY` constraint enforces **entity integrity** (every row in a table is uniquely identified by a primary key)
  - The `UNIQUE` constraint enforces uniqueness of values of an alternate key
  - The `FOREIGN KEY` constraint enforces **referential integrity** (foreign key in one table must always refer to an existing primary key in another table)
  - The `NOT NULL` constraint does not allow missing values
  - The `CHECK` constraint enforces a user-defined business rule

---

## Primary key constraint

- The `PRIMARY KEY` constraint specifies the primary key column (or group of columns):

```sql
CREATE TABLE Course (
  -- With a single column primary key, the constraint can be specified after the column's data type
	course_code VARCHAR(10) PRIMARY KEY,
  -- The UNIQUE constraint enforces that the column only has unique values
	course_name VARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE Enrollment (
	student_id INT NOT NULL,
	course_code VARCHAR(10) NOT NULL,
	enrolled_on DATE NOT NULL,
  -- Composite primary key needs to be defined using the CONSTRAINT keyword
  -- "PK_Enrollment" is the name of the constraint, following the convention PK_NameOfTable
	CONSTRAINT PK_Enrollment PRIMARY KEY (student_id, course_code)
)
```

---

## Automatically generated primary key values

- Primary key column can be defined as an **identity column**, which will **generate a unique primary key value automatically**. The value will be an integer with increasing value (1, 2, 3...)
- Identity columns are useful for surrogate keys, because we don't need to worry about the primary key value while inserting a new row

```sql
CREATE TABLE Product (
  -- the IDENTITY keyword specifies the identity column
	product_id INT IDENTITY PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	unit_price DECIMAL(10,2) NOT NULL
)

-- We don't need to specify a value for product_id, it will be generated automatically
INSERT INTO Product (product_name, unit_price)
VALUES
	('Keyboard', 49.90),
	('Mouse', 19.90)
```

---

## Foreign key constraint

- The `FOREIGN KEY` constraint specifies the foreign key column (or group of columns):

```sql
CREATE TABLE Department (
	department_id INT PRIMARY KEY,
	department_name VARCHAR(100) NOT NULL
)

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY,
	employee_name VARCHAR(100) NOT NULL,
	department_id INT NOT NULL,
  -- This foreign key constraint will establish the link between the two tables
  -- The name of constraint commonly follows the convention FK_TableA_TableB
	CONSTRAINT FK_Employee_Department
		FOREIGN KEY (department_id) REFERENCES Department(department_id)
)
```

---

## More examples of constraints

- Here are examples of the `NOT NULL` (column must have a value) and `CHECK` (column value must pass the specified condition) constraints:

```sql
CREATE TABLE MovieRating (
	rating_id INT PRIMARY KEY,
  -- the NOT NULL constraint enforces that the movie_title must have a value
	movie_title VARCHAR(100) NOT NULL,
	stars INT NOT NULL,
	rating_source VARCHAR(20) NOT NULL,
    -- The CHECK condition can be any condition with a true or false result
	CONSTRAINT CK_MovieRating_stars CHECK (stars BETWEEN 1 AND 5),
	CONSTRAINT CK_MovieRating_source CHECK (rating_source IN ('critic', 'user'))
)

-- This insert fails because stars must be between 1 and 5
INSERT INTO MovieRating (rating_id, movie_title, stars, rating_source)
VALUES (2, 'Interstellar', 6, 'user')
```

---

## Database security

- **Database security** comprises mechanisms that **protect the database against intentional or accidental threats**
- These threats include for example **loss of confidentiality** and **loss of privacy**
- Organizations need to maintain secrecy over the data that is critical to them (confidentiality)
- At least as important is the need to protect data about individuals (privacy). For example individual's private information (such as social security number, email, phone number) should be accessible limitedly
- Database security is accomplished by **verifying the identity of the database users** (authentication) and **controlling what these users are permitted to do** (authorization)

---

## User authentication

- The typical **user authentication** approaches are the following:
  - **SQL authentication**: a virtual username is registered in the DBMS instance and protected by a password. Anybody who knows the username and password can log in to the DBMS instance
  - **Operating system authentication**: selected users or user groups in an operating system domain are allowed to connect to the DBMS instance. That is, the DBMS trusts the authentication service of the operating system
- Out of these two, operating system authentication is considered more secure, because it uses a more secure protocol and enforces stricter password policies

---

## User authorization

- The typical **user authorization** mechanism is called **discretionary access control** (DAC)
- The access control is based on the **privileges** that the DBMS system administrator or a database administrator grants to users:
  - On the **DBMS instance**: for example log in, create or drop databases, create users and roles **within the DBMS instance**
  - On the **database**: for example create tables, users, and other database objects **within the database**
  - On a **database object**: for example select, insert, update and delete **on a table**

---

## Database performance

- A database commonly has certain **performance requirements**, for example users don't want to wait for several seconds so that their discussion history is loaded in a messaging application
- The two main aspects of **database performance** are **response time** and **throughput**
- **Response time** is the time it takes for a user to receive the result for a certain SQL query (for example the result table of a `SELECT` query) they send to the DBMS
- Response time includes the computation time, disk access, network traffic and other required operations
- **Throughput** describes the overall capacity of the system to process data. It is measured in **database transactions** per second (TPS). A single database transaction may involve several database operations

---

## Improving database performance

- There are many ways to improve the database performance, for example:
  - Creating indexes on tables
  - Tuning or rewriting individual SQL queries. For example replacing certain subqueries with `JOIN` operations
  - Distributing the database load on multiple server machines
  - Improving the hardware (e.g., more main memory, better CPU) on the server machine

---

## Database indexes

- Suppose that you are a librarian in a library that has hundreds of books and you need to find the book by title "Dune"
- If you don't have any information on the locations of different books, you have to go through **every single book** to find the book you are looking for
- If you have an ordered list of book titles and their locations you can quickly skip to letter "D" and find the location of the book you are looking for quite quickly
- In a database, such an "ordered list of book titles and their locations" resembles an **index**

---

## Database indexes

- **Indexes** are critical for database performance, due to the fact that in data processing (reading and writing data) **disk access** is extremely slow compared to **main memory access**
- The whole database won't be able to fit into the main memory, but an index is implemented with a compact data structure that can at least partly fit into the main memory
- Based on a database query, index "points" to the locations of the result rows on the disk, which makes it possible for the DBMS to find data in the database with fewer disk accesses
- Indexes are created on **columns** or a **group of columns** to speed up queries that are referencing the columns in a `WHERE` or `JOIN` clause
- For example the following query would benefit from an index on the `title` column:

  ```sql
  SELECT title FROM Book WHERE title = 'Dune'
  ```

---

## Database indexes

- **Without an index**, the DBMS has to go through each row in the table (full table scan), which requires many **disk accesses** (slow 🐢)
- **With an index**, the DBMS just has to find the corresponding **index entry** in the index data structure. In most cases the index entry can be found in the **main memory** (fast ⚡)
- The index entry will point to data on the disk, which minimizes the required disk accesses

---

## Creating an index

- We can create an index in the SQL Server using the `CREATE INDEX` statement:

  ```sql
  CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publish_year INT NOT NULL
  );

  -- Creates a index named "IX_title" for the Book table's title column
  CREATE INDEX IX_title ON Book(title)
  ```

- We can delete an index with a specific name in a table using the `DROP INDEX` statement:

  ```sql
  DROP INDEX IX_title ON Book
  ```

---

## Which queries benefit from the index?

- Index on a column makes it faster to query rows **based on that specific column**
- However, **other columns don't benefit from the index**

  ```sql
  -- ⚡ This query is fast, it can use the index on the title column
  SELECT title FROM Book WHERE title = 'Dune'
  -- 🐢 This query is slow, it can't use the index on the title column
  SELECT title FROM Book WHERE publish_year = 1965
  -- ⚡ Also UPDATE and DELETE operations benefit from an index
  UPDATE Book SET publish_year = 1965 WHERE title = 'Dune'
  DELETE FROM Book WHERE title = 'Dune'
  ```

---

## Advantages of indexes

- If indexes are the magical way to search for rows based on a certain column value faster, then **why not add an index for every column on a table?**
- Indexes have many **advantages**, such as:
  - Minimise the number of disk accesses needed to locate data in the database
  - Enforce `PRIMARY KEY` and `UNIQUE` constraints. If a suitable index exists, then the DBMS
    can use the index to find out if a duplicate value already exists for the key
  - Enforce `FOREIGN KEY` constraints. If a suitable index exists, then the DBMS can use the index to find out if any child row exists for a row that is being deleted
  - Accelerate `JOIN` operations
  - Avoid sorts for `DISTINCT`, `GROUP BY`, `ORDER BY` and `UNION` clauses

---

## Disadvantages of indexes

- But there are also **disadvantages**, such as:
  - More main memory and disk space is needed for indexes
  - The DBMS has to update all indexes on the table when a new row is inserted
  - Also, when an existing row is updated the DBMS has to update related indexes accordingly
  - That is, if there are **unnecessary indexes** on a table they might start decreasing performance on inserts, updates, and deletes

---

## When to use indexes?

- In general, indexes are important for tables with a **large number of rows** and **frequently repeated queries**
- If the number of rows in a table is very small, then an index does not improve performance
- Indexes are not useful for columns that have **large values** (for example long strings) or a very **low selectivity** of values (for example a `is_completed` column that has only two possible values, `'Y'` or `'N'`)

---

## Which columns should have an index?

- Typically, basic indexes are created on:
  - **Primary keys**: SQL Server **creates automatically** a unique index on the primary key
  - **Foreign keys**: we should use the `CREATE INDEX` statement to create an index on a foreign key
  - **Alternate keys**: in SQL Server, the `UNIQUE` constraint is physically implemented as a unique index, which SQL Server **creates automatically**
- In addition, we should consider indexes on columns referenced in `WHERE` clauses of slow queries:

  ```sql
  -- To improve the performance of this query,
  -- we can create an index on the city column
  SELECT first_name, surname FROM Student WHERE city = 'Helsinki'
  ```

---

## Summary

- The purpose of the **physical database design** is to produce a description of all the database's **physical-level implementation details** for a **certain DBMS product**
- The physical database design should provide **adequate performance** and ensure database **integrity**, **security** and **recoverability**
- **Database integrity** is ensured with **constraints** (for example `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL` and `UNIQUE` constraints)
- **Database security** comprises mechanisms that **protect the database against intentional or accidental threats**
- Database security is accomplished by user **authentication** and **authorization**
- Database indexes are data structures which **speed up queries** at the cost of **main memory and disk space** and **slower write operations**
