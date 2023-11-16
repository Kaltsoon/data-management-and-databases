# Physical database design

- The learning objectives for this week are:
  - Knowing the purpose of _physical database design_
  - Knowing the basic types of _integrity constrains_
  - Knowing how to create a basic set of tables with integrity constraints in SQL Server
  - Knowing the advantages and disadvantages of _database indexes_
  - Knowing how to create indexes on database tables in SQL Server
  - Knowing what is meant by _database performance_ and _database security_

---

# Physical database design

- Once we have designed a logical database schema based on a specific data model, we can start designing the _physical implementation of the database_
- The _physical database design_ is concerned with the _target DBMS product_ and all _physical-level details_
- The target DMBS product could be for example SQL Server, PostgreSQL, or MySQL
- The designer should be fully aware of the functionality of the target DBMS and must know how the computer system hosting the DBMS operates
- For example in RDMSs, the common SQL syntax and functionality is the same, but there are still important differences
- In practice, physical design _must be tailored to a particular DBMS_

---

# Creating tables

- In a SQL database the data is stored into _tables_ that have _columns_ with different _data types_, such as `VARCHAR(n)`, `INTEGER`, and `DATE`
- Different DMBS support mostly the same data types, but many of them also support their own, non-standard data types, such as the PostgreSQL's `JSONB` data type for storing JSON data
- A database table can be created with the `CREATE TABLE` statement:

  ```sql
  CREATE TABLE Customer (
    customer_id INTEGER,
    name VARCHAR(50)
  )
  ```

---

# Database integrity

- When we create a table with the `CREATE TABLE` stamement, we can define different _constraints_ for the table
- Constraint enforce the database integrity in different ways:
  - The `PRIMARY KEY` constraint enforces uniqueness of values of a primary key
  - The `UNIQUE` constraint enforces uniqueness of values of an alternate key
  - The `FOREIGN KEY` constraint enforces referential integrity
  - The `NOT NULL` constraint does not allow missing values
  - The `CHECK` constraint enforces a user-defined business rule

---

# An example of constraints

```sql
CREATE TABLE Student (
  student_number INTEGER NOT NULL,
  -- the first_name column must have a value
  first_name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  -- the ssn column must have a unique value
  ssn VARCHAR(20) NOT NULL UNIQUE,
  email VARCHAR(50),
  study_advisor INTEGER,

  -- the student_number is the primary key column
  CONSTRAINT PK_Student PRIMARY KEY (student_number),
  -- the study_advisor is a foreign key column referencing the Teacher table
  CONSTRAINT FK_TeacherStudent FOREIGN KEY (study_advisor)
  REFERENCES Teacher(teacher_number)
  -- the email column must have a value that is in an email format
  CONSTRAINT CHK_StudentEmail CHECK (email LIKE '%_@_%._%')
)
```

---

# Domain constraint

- In addition to these constraints, a _domain constraint_ can be used to specificy the data type and a set of allowed values in a column
- A new domain can be created with the `CREATE DOMAIN` statement:

  ```sql
  CREATE DOMAIN SizeDomain AS CHAR(2) CHECK (VALUE IN ('S', 'M', 'L', 'XL'))
  ```

- The new domain name can be used in column definitions instead of a built-in data type name
- The `CREATE DOMAIN` statement is support by DBMSs such as PostgreSQL, but _not_ by SQL Server

---

# Column autonumbering

- _Autonumbering_ allows a unique number to be automatically generated when a new row is inserted into a table
- This is a useful option for _generating column values for surrogate primary keys_
- We can create a _autonumber column_ for a table by using an extra option in the column definition
- In SQL Server, an autonumber column is defined with the `IDENTITY` property and it is allow with `TINYINT`, `SMALLINT`, `INTEGER`, `BIGINT`, `DECIMAL`, and
  `NUMERIC` data types

---

# Example of column autonumbering

```sql
CREATE TABLE Customer (
  -- the customer_id column is a autonumber column
  customer_id INTEGER NOT NULL IDENTITY,
  name VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY (customer_id)
)
```

---

- When we insert a new row into the table, the _DBMS assigns automatically a value to the identity column_
- We _cannot_ insert a value to the `IDENTITY` column explicitly:

  ```sql
  INSERT INTO customer (name) VALUES ('Kalle Ilves')
  INSERT INTO customer (name) VALUES ('Kari Silpiö')
  ```

  | customer_id | name        |
  | ----------- | ----------- |
  | 1           | Kalle Ilves |
  | 2           | Kari Silpiö |

---

# Database security

- _Database security_ is are the mechanisms that _protect the database against intentional or accidental threats_
- These threats include for example _loss of confidentiality_ and _loss of privacy_
- Organizations need to maintain secrecy over the data that is critical to them (confidentiality)
- At least as important is the need to protect data about individuals (privacy)
- Database security is accomplished by _verifying the identity of the database users_ (authentication) and _controlling what these users are permitted to do_ (authorization)

---

# User authentication

- The typical _user authentication_ approaches are the following:
  - _SQL authentication_: a virtual username is registered in the DBMS instance and protected by a password. Anybody who knows the username and password can log in into the DBMS instance
  - _Operating System authentication_: selected users or user groups in an operating system domain are allowed to connect to the DBMS instance. That is, the DBMS trusts the authentication service of the operating system
- Out of these two the Operating System authentication is considered more secure, because it uses more secure security protocol and enforces stricter password policies

---

# User authorisation

- The typical _user authorisation_ mechanism is called _discretionary access control_ (DAC)
- The access control is based on the _privileges_ that the DBMS system administrator or a database administrator grants to users:
  - On the _DBMS instance_: for example log in, create or drop databases, create users and roles _within the DBMS instance_
  - On the _database_: for example create tables, users, and other database objects _within the database_
  - On a _database object_: for example select, insert, update and delete _on a table_

---

# Database performance

- A database commonly has certain _performance requirements_, for example a user don't want to wait for several seconds so that their discussion history is loaded in a messaging application
- The two main aspects of _database performance_ are _response time_ and _throughput_
- _Response time_ is the time it takes for a user to receive the result for an SQL query (for example the result table of a `SELECT` query) they send to the DMBS
- Response time includes the CPU time, queuing within the operating system, disk access, lock waits in multi-user environment, network traffic and other required operations
- _Throughput_ describes the overall capacity of the system to process data. It is measured in _database transactions_ per second (TPS)
- A single database transaction may involve several database queries and updates

---

# Improving database performance

- There are many ways to improve the database performance, for example:
  - Creating indexes on tables
  - Tuning or rewriting individual SQL queries. For example replacing certain subqueries with `JOIN` operations
  - Distributing data access on disks
  - Increasing main memory of the database server

---

# Database indexes

- Suppose that you are librarian in a library that has hundreds of books and you need to find the book by title "Dune"
- If you don't have any information on the locations of different books, you have to go through _every single book_ to find the book you are looking for
- If you have an ordered list of book titles and their locations you can quickly skip to letter "D" and find the location of the book you are looking for quite quickly
- In a database such "ordered list of book titles and their locations" resembles an _index_

---

# Database indexes

- _Indexes_ are critical for database performance. A basic fact of database processing is that _disk access_ is extremely slow compared to _main memory access_
- An index is implemented with a compact data structure that at least partly fit into the main memory
- This makes it possible for the DBMS to find data in the database with fewer disk accesses
- Indexes are created on _columns_ or a _group of columns_ to speed up queries that are referencing the columns in a `WHERE` or `JOIN` clause
- For example the following query would benefit from an index on the `title` column:

  ```sql
  SELECT title FROM Book
  WHERE title = 'Dune'
  ```

---

# Database indexes

- _Without an index_, the DBMS has to go through each row in the table, which requires many disk accesses (slow 🐢)
- _With an index_, the DBMS just has to find the corresponding _index entry_ in the index data structure. In most cases the index entry can be found in the main memory (fast ⚡)
- The index entry will point to data on the disk, which minimizes the required disk accesses

---

# Creating an index

- We can create an index in the SQL Server using the `CREATE INDEX` statement:

  ```sql
  CREATE INDEX Employee_deptno ON Employee(deptno)
  ```

- In this example, we create an index with name `Employee_deptno` for the `Employee` table's `deptno` column
- We can delete an index with a specific name in a table using the `DROP INDEX` statement:

  ```sql
  DROP INDEX Employee_deptno ON Employee
  ```

---

# Advantages of indexes

- If indexes are the magical way to search for rows based on a certain column value faster, then _why not add a index for every column on table?_
- Indexes have many _advantages_, such as:
  - Minimise the number of disk accesses needed to locate data in the database
  - Enforce `PRIMARY KEY` and `UNIQUE` constraints. If a suitable index exists, then the DBMS
    can use the index to find out if a duplicate value already exists for the key
  - Enforce `FOREIGN KEY` constraints. If a suitable index exists, then the DBMS can use the index to find out if any child row exists for a row that is being deleted
  - Accelerate `JOIN` operations
  - Avoid sorts for `DISTINCT`, `GROUP BY`, `ORDER BY` and `UNION` clauses

---

# Disadvantages of indexes

- But there are also _disadvantages_, such as:
  - More disk space is needed for indexes. Indexes need some maintenance, too
  - The DBMS has to update all indexes on the table when a new row is inserted or a new
    row is deleted
  - When an existing row is updated the DBMS has to update related indexes accordingly. That is, if there are too many indexes on a table they might start decreasing performance on inserts, updates, and deletes

---

# When to use indexes?

- In general, indexes are important for tables with a _large number of rows_ and _frequently repeated queries_
- If the number of rows in a table is very small, then an index does not
  improve performance
- Indexes are not useful for columns that have _large values_ (for example long strings) or a very _low selectivity_ of values (for example a `is_completed` column that has value `'Y'` or `'N'`)

---

# Which columns should have an index?

- Typically, basic indexes are created on:
  - _Primary keys_: SQL Server _automatically_ creates a _unique clustered index_ on the primary key
  - _Foreign keys_: Use `CREATE INDEX` to create an index on a foreign key
  - _Alternate keys_: In SQL Server, `UNIQUE` constraint is physically implemented as a _unique non-clustered index_, which SQL Server creates _automatically_
- In addition, we can consider indexes on columns that are referenced in a `WHERE` or `JOIN` clause:

  ```sql
  -- to improve the performance of this query,
  -- we could create an index on the city column
  SELECT first_name, surname FROM Student WHERE city = 'Helsinki'
  ```

---

# The order of columns in an index is significant

- ⚠️ If the index includes more than one column, then the _order of columns in the
  index definition is significant_
- In addition to searching rows based on the whole key value, it is possible to search rows using the first indexed column alone
- Let's suppose the `CourseGrade` relation below with a large number of rows:

  <pre>
  CourseGrade (<u>coursecode, offeringno, studentno</u>, grade)
    PK (coursecode, offeringno, studentno)
    FK (coursecode, offeringno) REFERENCES CourseOffering
    FK (studentno) REFERENCES Studen
  </pre>

---

# The order of columns in an index is significant

- If we mention `studentno` as the first column in the index on the primary key, then we need to create only _two indexes_ to cover the primary key and the both foreign keys:

  ```sql
  CREATE UNIQUE INDEX PK_CourseGrade
  ON CourseGrade (studentno, coursecode, offeringno)

  CREATE INDEX FK_CourseGrade_CourseOffering
  ON CourseGrade (coursecode, offeringno)
  ```

- The _first index_ can be used both for locating rows based on the _whole primary key_ and based on the `studentno` _alone_
- Similarly, the _second index_ can be used both for locating rows based on `coursecode` and `offeringno` _together_ and based on the `courscode` _alone_

---

# The order of columns in an index is significant

```sql
-- ✅ these queries can use the index on CourseGrade (studentno, coursecode, offeringno)
SELECT grade WHERE studentno = 'o148'
SELECT grade WHERE studentno = 'o148' AND coursecode = 'a730' AND offeringno = 1
-- ✅ these queries can use the index on CourseGrade (coursecode offeringno)
SELECT grade WHERE coursecode = 'a730'
SELECT grade WHERE coursecode = 'o148' AND offeringno = 1
-- ❌ this query can't use any of the two indexes
SELECT grade WHERE offeringno = 1
```

---

# Summary

- The purpose of the _physical database design_ is to produce a description of all the database's _physical-level implementation details_ for a _certain DBMS product_
- The physical database design should provide _adequate performance_ and insure database _integrity_, _security_ and _recoverability_
- _Database integrity_ is ensured with _constraints_ (for example `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL` and `UNIQUE` constraints)
- _Database security_ is are the mechanisms that _protect the database against intentional or accidental threats_
- Database security is accomplished by user _authentication_ and _authorization_
- Database indexes are data structures which _speed up queries_ at the cost of _disk space_ and _slower write operations_
