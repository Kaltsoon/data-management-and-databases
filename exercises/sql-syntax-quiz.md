# SQL Syntax & WHERE condition Practice

# 1. SQL Syntax

Are the SQL statements below syntactically correct according the generic SELECT statement syntax? **Please give arguments!**

1. 

```sql
SELECT family\_name, given\_name
```

2. SELECT family\_name FROM student WHERE birthdate = '1995-01-30'
3. SELECT family\_name FROM student ORDER BY family\_name WHERE birthdate = '1995-01-30'
4. SELECT family\_name, given\_name FROM student AS teacher
5. SELECT name, population FROM city ORDER BY population ORDER BY name
6. SELECT name FROM course ON course\_code = 'swd4tf003'
7. SELECT city, DISTINCT family\_name FROM student
8. SELECT city FROM student GROUP BY city

(The exercise continues on the next page...)

9. SELECT family\_name AS name FROM student
10. SELECT DISTINCT * FROM student ORDER BY city
11. SELECT family\_name, given\_name, city FROM student HAVING (student\_number = 123)
12. SELECT * FROM teacher JOIN course
13. SELECT * FROM emp INNER JOIN dept ON dept.deptno = emp.deptno
14. SELECT * FROM emp JOIN dept ON dept.deptno = emp.deptno

## 2 COMBINED CONDITIONS IN THE WHERE CLAUSE

First, familiarise yourself with the truth tables and evaluation order . Then, try to figure out what the given queries retrieve from the Product table.

## Truth tables

| x     | y     | x AND y   |
|-------|-------|-----------|
| TRUE  | TRUE  | TRUE      |
| TRUE  | False | False     |
| False | TRUE  | False     |
| False | False | False     |

## Evaluation order

<!-- formula-not-decoded -->

## WHAT DO THE QUERIES BELOW RETRIEVE FROM THE PRODUCT TABLE?

## Product

| id      | color   | price    | product_group   |
|---------|---------|----------|-----------------|
| green   | 5000    | bicycles | 1               |
| red     | 5000    | bicycles | 2               |
| green   | 5000    | cars     | 3               |
| green   | 200     | bicycles | 4               |
| red     | 5000    | cars     | 5               |
| red     | 200     | cars     | 6               |
| 7 green |         | 200 cars |                 |

1. SELECT id FROM Product WHERE color = 'green'  AND  price &gt; 1000  OR  product\_group = 'bicycles'
2. SELECT id FROM Product

WHERE color = 'green'  OR  price &gt; 1000  AND  product\_group = 'bicycles'

3. SELECT id FROM Product WHERE color = 'green'  OR  price &gt; 1000  OR  product\_group = 'bicycles'
4. SELECT id FROM Product

WHERE color = 'green'  AND  price &gt; 1000  AND  product\_group = 'bicycles'

5. SELECT id FROM Product

WHERE color = 'green'  AND  (price &gt; 1000  OR  product\_group = 'bicycles')

6. SELECT id FROM Product WHERE color = 'green'  AND NOT (price &gt; 1000  OR  product\_group = 'bicycles')

| x     | y     | x OR y   |
|-------|-------|----------|
| TRUE  | TRUE  | TRUE     |
| TRUE  | False | TRUE     |
| False | TRUE  | TRUE     |
| False | False | False    |