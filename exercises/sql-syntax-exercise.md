# SQL Syntax & WHERE Conditions Exercise

> [!IMPORTANT]
> Submit this exercise as a single Word document in Moodle.

## Task 1. SQL Syntax

Open the SQL DML Quick Reference in this week's "Materials" section in Moodle's "Course outline" tab. The first page describes the `SELECT` statement syntax in SQL.

Are the SQL statements below syntactically correct according the SELECT statement syntax? **Please give arguments!**

> [!TIP]
> Pay attention to order of the keywords in the syntax, e.g. `WHERE` should be before `ORDER BY`. The square brackets in the syntax define optional keywords, e.g. `This is required [but this can be left out]`.

1. ```sql
   SELECT family_name, given_name
   ```
2. ```sql
   SELECT family_name 
   FROM student
   WHERE birthdate = '1995-01-30'
   ```
3. ```sql
   SELECT family_name 
   FROM student 
   ORDER BY family_name 
   WHERE birthdate = '1995-01-30'
   ```
4. ```sql
   SELECT family_name, given_name 
   FROM student AS teacher
   ```
5. ```sql
   SELECT name, population 
   FROM city 
   ORDER BY population 
   ORDER BY name
   ```
6. ```sql
   SELECT name 
   FROM course ON course_code = 'swd4tf003'
   ```
7. ```sql
   SELECT city, DISTINCT family_name 
   FROM student
   ```
8. ```sql
   SELECT city 
   FROM student 
   GROUP BY city
   ```
9. ```sql
   SELECT family_name AS name 
   FROM student
   ```
10. ```sql
    SELECT DISTINCT * 
    FROM student 
    ORDER BY city
    ```
11. ```sql
    SELECT family_name, given_name, city 
    FROM student 
    HAVING (studentnumber = 123)
    ```
12. ```sql
    SELECT * FROM teacher 
    JOIN course
    ```
13. ```sql
    SELECT * FROM emp INNER 
    JOIN dept ON dept.deptno = emp.deptno
    ```
14. ```sql
    SELECT * FROM emp 
    JOIN dept ON dept.deptno = emp.deptno
    ```

## Combined conditions in the WHERE clause

First, familiarise yourself with the truth tables and evaluation order. Then, try to figure out what the given queries retrieve from the `Product` table.

### Truth tables

| x     | y     | x AND y | x OR y |
| ----- | ----- | ------- | ------ |
| TRUE  | TRUE  | TRUE    | TRUE   |
| TRUE  | False | False   | TRUE   |
| False | TRUE  | False   | TRUE   |
| False | False | False   | False  |

### Evaluation order

`AND` and `OR` operators are evaluated in the same order as `*` and `+` operators in math:

- `1 + 2 * 3 = 7`, multiplication is calculated first
- `1 + (2 * 3) = 7`, calculation in the brackets is evaluated first
- `(1 + 2) * 3 = 9`, calculation in the brackets is evaluated first
- `x OR y AND z` is the same as `x OR (y AND z)` (think `OR` as `+` and `AND` as `*`)
- `x AND y OR z` is the same as `(x AND y) OR z`

## Task 2. WHERE conditions

Which ids do the queries below retrieve from the `Product` table?

| id  | color | price | product_group |
| --- | ----- | ----- | ------------- |
| 1   | green | 5000  | bicycles      |
| 2   | red   | 5000  | bicycles      |
| 3   | green | 5000  | cars          |
| 4   | green | 200   | bicycles      |
| 5   | red   | 5000  | cars          |
| 6   | red   | 200   | cars          |
| 7   | green | 200   | cars          |

1. ```sql
   SELECT id FROM Product 
   WHERE color = 'green' AND price > 1000 OR product_group = 'bicycles'
   ```
2. ```sql
   SELECT id FROM Product 
   WHERE color = 'green' OR price > 1000 AND product_group = 'bicycles'
   ```
3. ```sql
   SELECT id FROM Product 
   WHERE color = 'green' OR price > 1000 OR product_group = 'bicycles'
   ```
4. ```sql
   SELECT id FROM Product 
   WHERE color = 'green' AND price > 1000 AND product_group = 'bicycles'
   ```
5. ```sql
   SELECT id FROM Product 
   WHERE color = 'green' AND (price > 1000 OR product_group = 'bicycles')
   ```
6. ```sql
   SELECT id FROM Product 
   WHERE color = 'green' AND NOT (price > 1000 OR product_group = 'bicycles')
   ```