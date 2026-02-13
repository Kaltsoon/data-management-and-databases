# SQL Exercises 4: Grouping and subqueries

Write task numbers to your SQL query window as follows:

```sql
-- 4.1
SELECT ...
-- 4.2
SELECT ...
```

## 1.

Find out the total number of course participants per each course. Display "Number of participants" and course code. Sort the result by (number of participants in descending order, course code in ascending order).

## 2.

How many passing grades does each student have? Display "Number of grades" and student number. Sort the result by (number of grades in descending order, student number in ascending order).

## 3.

What is the average grade for each student? Display 'Average grade' and student number. Sort the result by student number in ascending order.

1. First version: display the average grade as an integer (no rounding etc.)
2. Second version: display the correct average grade with two decimal places.

## 4.

How many course instances has each teacher given? Display teacher number and the number of course instances. Rename the second column as "Number of course instances". Sort the result by teacher number.

## 5.

How many different courses has each teacher given? Display teacher number and "Number of different courses". Sort the result by (number of different courses in descending order, teacher number in ascending order)

## 6.

List all the teachers who have given more than one course instance. Display teacher number and "Number of course instances". Sort the result by teacher number.

## 7.

List for each student the student number, average grade, highest grade, and lowest grade. In the query, rename the columns as "Average grade", "Highest grade", and "Lowest grade". Sort the result by (average grade, student number).

> [!NOTE]
> Display the correct average grade with two decimal places.

## 8.

List the same information as in the previous task, but this time only for those students, whose grade average is above 3.

> [!NOTE]
> Tasks 9-14 are related to subqueries.

## 9.

In which course instances is the number of participants above the average? Display number of participants, course code, and instance number. Sort the result by (number of participants in descending order, course code in ascending order, instance number in ascending order).

## 10.

List all the students (surname, first name, student number) who have not passed any courses. Sort the result in ascending order by (surname, first name, student number).

> [!TIP]
> The table `CourseGrade` contains facts on all the passing grades. The table Student contains facts on all the students.

## 11.

List all the teachers (surname, first name, teacher number, salary) who earn more than all of those teachers who work at campus that has campus code 'c222'. Sort the result by (surname, first name, teacher number) in ascending order.

## 12.

List all the courses (course code, course name) that at least one student has passed this far. Sort the result by course code in ascending order.

## 13.

List all the courses (course code, course name) that no student has passed this far. Sort the result by course code in ascending order.

## 14.

List all the teachers (teacher number, surname, first name) who have not given any courses this far. Sort the result in ascending order by (surname, first name, teacher number).

> [!TIP]
> What about missing information? See the SQL DML Quick Reference Guide for details.

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 15.

List all courses (course name) that have been given by different teachers who are working at different campuses. 

Example of such course: There exists two course instances of the course. The first one is given by teacher A who is working at campus 1. The second one is given by teacher B who is working at campus 2. 

> [!TIP]
> Here you might need a `JOIN` operation, a subquery, grouping, aggregate function etc.

## ⭐ Bonus task 16.

Display the gender distribution of students in the following way (sort the result by "%" in descending order):

gender | %
--------|------
M | 53.8
F | 46.2

> [!TIP]
> You can use a scalar subquery as an operand of an arithmetic operation in the column list.

## ⭐ Bonus task 17.

Display the gender distribution of students in the following way:

Female | Male
--------|------
46.2 % | 53.8 %

## ⭐ Bonus task 18.

Display student number and average grade of the student(s) who has/have the highest average grade. Display the average grade with two decimal places.

## ⭐ Bonus task 19.

Display how many teachers were born in each decade. Sort the result by decade in ascending order. See the sample query results on how to display the result. 

> [!TIP]
> In this task, you do not necessarily find all the needed syntax from the SQL DML Quick Reference Guide.

## ⭐ Bonus task 20.

Find the youngest female student and youngest male student. Display gender, surname, first name, birth date and age. Use a scalar function to compute the age.
