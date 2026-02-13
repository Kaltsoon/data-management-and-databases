# SQL Exercises 1: Simple SELECT statements

> [!IMPORTANT]
> Create a Word document named `sql-exercises-1-YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and the result (e.g., as a [screenshot](https://www.take-a-screenshot.org/))** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

> [!IMPORTANT]
> See the following in this week's "Materials" section on the course outline page:
> - **Database Diagram**: this shows the database structure (tables, columns, primary keys, foreign keys).
> - **Query Results**: compare the result of your own query to the given query result.

Write the task numbers in the query window as follows:

```sql
-- 1
SELECT * FROM Campus
-- 2
SELECT ...
```

## 1.

Write a SELECT statement that lists all the campuses. Display all columns. The order of rows and columns does not matter.

## 2.

Write a SELECT statement that lists all the campuses. Display city and campus name. Sort the result by (city, campus name) in ascending order.

## 3.

What kinds of disciplinary sanctions there are at the University? List all sanctions (description and decision maker). Sort the result by sanction code in descending order.

## 4.

What types of academic misconduct are mentioned in the MisconductType table? List all the misconduct descriptions. Sort the result by description in ascending order.

## 5.

List all the teachers (surname, first name, teacher number). Sort the result by (surname, first name, teacher number) in ascending order.

## 6.

List all the female students (student number, surname, first name, birth date, gender). Sort the result by student number in ascending order.

## 7.

List all the teachers (salary, surname, first name, teacher number) whose salary is greater than 16 000. Sort the result by salary in descending order.

## 8.

Write a SELECT statement that finds Veera Vainio's teacher number.

> [!NOTE]
> You need Veera Vainio's teacher number in the next task.

## 9.

List all the grades (examiner's teacher number, course code, instance number, student number, grade) that have been given by Veera Vainio. Note: You have already listed her teacher number in a previous task. Sort the result by (course code, instance number, student number) in ascending order.

## 10.

List all the course instances (start date, end date, course code, instance number) that have started and ended in 2007. Sort the result by (start date, end date, course code, instance number) in ascending order.

## 11.

List all the students (gender, birth date, surname, first name) whose surname is in the range of (A-K). Display girls after all boys in the list. Boys should be listed in ascending order by birth date.

> [!IMPORTANT]
> In SQL, `DATE` values are written in the ISO date format `'yyyy-mm-dd'`. That is, a `DATE` value is always exactly 10 characters enclosed within single quotes, for example `'2012-02-25'`.

> [!NOTE]
> These remaining tasks are metadata queries, which retrieve metadata information related to the database. Execute them, see the result and include both query and the result to the submission.

## 12.

Execute the following query to find out what tables you have created this far:

```sql
SELECT table_name 
FROM information_schema.tables 
ORDER BY table_name
```

## 13.

Execute the following query to find out what columns there are in the table Teacher:

```sql
SELECT table_name, column_name, data_type, character_maximum_length, numeric_precision, numeric_scale, is_nullable
FROM information_schema.columns 
WHERE table_name = 'Teacher'
```

## 14.

Execute the following query to find out what constraints (primary key, foreign key, check, ...) there are:

```sql
SELECT table_catalog, table_name, constraint_name, constraint_type
FROM information_schema.table_constraints
ORDER BY table_name, constraint_name
```
