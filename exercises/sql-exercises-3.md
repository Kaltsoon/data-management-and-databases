# SQL Exercises 3: Aggregate functions, handling strings & dates, type casting

Write task numbers to your SQL query window as follows:

```sql
-- 3.1
SELECT ...
-- 3.2
SELECT ...
```

## Aggregate functions

## 1.

How many rows there are in the CourseGrade table?

## 2.

What is the total number of grades in the CourseGrade table?

## 3.

How many teachers earn more than 16 000?

## 4.

Display teachers' maximum salary, minimum salary, average salary, and the total of all salaries. Display the result with appropriate column headings.

## 5.

What is the average grade for all the students? Write the following three versions of the query:

1. Display the rough average (with no conversions or rounding)
2. Display the correct average with 2 decimal places (see below for instruction).
3. Display the correct average with no decimal places (see below for instruction).

> [!TIP]
> Suppose three rows with the following integer values in the column x: 9, 10, 10.
> - `AVG(x)` gives the result as **an integer without any rounding**: `(9 + 10 + 10) / 3 = 29 / 3 = 9`.
> - `AVG(x * 1.0)` gives the result as **a decimal numbers without any rounding**: `(9 * 1.0 + 10 * 1.0 + 10 * 1.0) / 3 = 29.0 / 3 = 9.666666...` 
> - `CAST(AVG(x * 1.0) AS DECIMAL(4,2))` gives the result as **a decimal number with two decimal places**: `9.67`
> The second number of `DECIMAL(4,2)` determines how many decimals places are used while rounding.
> ```sql
> SELECT CAST(AVG(x * 1.0) AS DECIMAL(4,2)) AS "Average of x" FROM MyTable
> ```

## 6.

How many times has the grade 3 been given this far?

## 7.

What is the average grade (with 2 decimal places) for the student whose student number is 'o473'?

## 8.

How many students' first name starts with the letter 'K'?

## 9.

How many different surnames of teachers there are that start with the letter 'T'?

> [!NOTE]
> Task 10 is related to string handling.

## 10.

Write a SELECT statement that generates a list of default email addresses for students. The default domain name is 'takkula.fi'. The default email format is as follows: firstname.surname@takkula.fi. No uppercase letters allowed. Rename the column as "Default email". Sort the result by "Default email" in ascending order.

> [!NOTE]
> Tasks 11-18 are related to date handling.

## 11.

List the following facts on each student: name of birth month, surname, first name, and student number. Do not display any other items. Sort the result by (month number, surname, first name, student number) in ascending order.

## 12.

How many students were born in May?

## 13.

List for each course instance the quarter of the year when the course instance was started. Display also the start date, course code, and instance number. Sort the result by (quarter, start date, course code) in ascending order.

## 14.

List all the students (birth month, day of birth month, surname, first name, student number). Rename birth month as "Month" and day of birth month as "Day". Sort the result by ("Month", "Day", surname, first name, student number).

## 15.

How many students were born on Sunday?

## 16.

Display the current date and weekday. Rename the date as "Current date" and weekday as "Weekday". Hint: Use SYSDATETIME() and the LEFT function to show the date with 10 characters only.

## 17.

Use the appropriate function to compute the length of each course in days. List the course length, course code, instance number. Rename the length of course as "Course length". Do not list any courses with an unknown length. Sort the result by (course length, course code, instance number) in ascending order.

## 18.

Calculate the age in years for each student. Rename age as "Age". Display age, surname, first name, and student number. Sort the result by ("Age" in descending order, surname ASC, first name ASC, student number ASC).

NB! Please notice that today the ages of students are higher than what is shown in the 'Query results' pdf-file.

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 19.

List all the students (student number, surname, first name, email) whose email server's domain name is not 'takkula.fi'. Do not use LIKE. Sort the result by student number in ascending order.

## ⭐ Bonus task 19.

List all the different domain names from students' email addresses. Rename the column as "Domain name". Sort the result by "Domain name" in ascending order.

## ⭐ Bonus task 21.

What is the average course instance length in whole days?
