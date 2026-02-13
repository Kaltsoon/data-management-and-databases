# SQL Exercises 7: More joins

> [!IMPORTANT]
> Create a Word document named `sql-exercises-7-YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and the result (e.g., as a [screenshot](https://www.take-a-screenshot.org/))** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

> [!IMPORTANT]
> See the following in this week's "Materials" section on the course outline page:
> - **Database Diagram**: this shows the database structure (tables, columns, primary keys, foreign keys).
> - **Query Results**: compare the result of your own query to the given query result.

Write task numbers to your SQL query window as follows:

```sql
-- 6.1
SELECT ...
-- 6.2
SELECT ...
```

## 1.

List all the courses (surname, first name, teacher number, course name) that have been given by the teacher whose teacher number is 'h303'. Sort the result by course name in ascending order.

## 2.

List all the teachers (surname, first name, teacher number, course name). If a teacher is in charge of a course, then also the course name should be shown. Sort the result by (surname, first name, teacher number, course name) in ascending order.

## 3.

List all the course instances (course code, instance number, start date, surname, first name, teacher number) that have started in 2008. Concatenate surname and first name as "Teacher". Sort the result by (course code, instance number) in ascending order.

## 4.

List all the teachers (campus name, surname, first name, teacher number, course name). If the teacher is in charge of a course, then also the course name should be shown. Sort the result by (campus name, surname, first name, teacher number, course name) in ascending order.

## 5.

List the number of teachers per each campus (campus name, "Number of teachers"). Sort the result by campus name in ascending order.

## 6.

Time dimension considerations: List all the teachers (surname, first name, teacher number, start date, end date) who have been working as academic advisors in 2010 (at least for one day). Sort the result by (surname, first name, teacher number) in ascending order.

---

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 7.

List all the teachers (surname, first name, teacher number, course name). If the teacher is in charge of a course, display also the name of the course; otherwise leave the course name column totally empty. Sort the result by (surname, first name, teacher number) in ascending order.

> [!TIP]
> `CASE` expression is probably needed here.

## ⭐ Bonus task 8.

List all the teachers (surname, first name, teacher number, "Comment") without any duplicate entries. If the teacher is also an academic advisor, show the text 'academic advisor' in the "Comment" column, otherwise leave the column totally empty. Sort the result by (surname, first name, teacher number) in ascending order.

## ⭐ Bonus task 9.

> [!NOTE]
> This can be a bit difficult, you may try to solve this one only at your own risk... ☠️

How many teachers in charge of a course there are at each campus? Display campus name and the number of teachers in charge of a course. Rename the second column as "Number of teachers in charge of a course". Sort the result by campus name in ascending order.
