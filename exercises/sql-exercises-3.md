# SQL Exercises 3: Aggregate functions, handling strings & dates, type casting

> [!CAUTION]
> Using generative AI tools to directly generate task answers is strictly forbidden and considered plagiarism. You won't be able to use such tools in the exam and without a lot of practice, your exam and learning results won't be good.

> [!IMPORTANT]
> Create a Word document named `sql-exercises-3-YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and the result (e.g., as a [screenshot](https://www.take-a-screenshot.org/))** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

> [!TIP]
> To understand the database structure, use the **Database Diagram** in this week's "Materials" section on the course outline page. It shows the database tables, columns, primary keys and foreign keys.

Write the task numbers to your query window as follows:

```sql
-- 1
SELECT ...
-- 2
SELECT ...
```

## 1.

How many rows there are in the `CourseGrade` table?

<details>

<summary>Expected result table</summary>

| Number of rows |
|----------------|
| 19 |

(1 row(s) affected)

</details>

## 2.

What is the total number of grades in the `CourseGrade` table?

<details>

<summary>Expected result table</summary>

| Number of grades |
|------------------|
| 17 |

(1 row(s) affected)

</details>

## 3.

How many teachers earn more than 16 000?

<details>

<summary>Expected result table</summary>

| Teachers who earn more than 16000 |
|-----------------------------------|
| 3 |

(1 row(s) affected)

</details>

## 4.

Display teachers' maximum salary, minimum salary, average salary, and the total of all salaries. Display the result with appropriate column headings.

<details>

<summary>Expected result table</summary>

| Maximum salary | Minimum salary | Average salary | Total of salary |
|----------------|----------------|----------------|------------------|
| 25000.00 | 2550.75 | 14480.416666 | 130323.75 |

(1 row(s) affected)

</details>

## 5.

What is the average grade for all the students? Write the following three versions of the query:

1. Display the rough average (with no conversions or rounding)
2. Display the correct average with 2 decimal places (see below for instruction).
3. Display the correct average with no decimal places (see below for instruction).

> [!TIP]
> Suppose three rows with the following integer values in the column x: 9, 10, 10.
> - `AVG(x)` gives the result as **an integer without any rounding**: `(9 + 10 + 10) / 3 = 29 / 3 = 9`.
> - `AVG(x * 1.0)` gives the result as **a decimal numbers without any rounding**: `(9 * 1.0 + 10 * 1.0 + 10 * 1.0) / 3 = 29.0 / 3 = 9.666666...` .
> - `CAST(AVG(x * 1.0) AS DECIMAL(4,2))` gives the result as **a decimal number with two decimal places**: `9.67`.
> 
> The first number of `DECIMAL(4,2)` determines **the maximum number of digits in the decimal number** (before and after the decimal point). The second number determines **how many decimals places are used while rounding**.
>
> $$
> \text{DECIMAL}(4, 2) \quad \Rightarrow \quad
> \underbrace{99}_{\text{4 - 2 = 2 digits left}} .
> \underbrace{99}_{\text{2 digits right}}
> $$ 
>
> ```sql
> SELECT CAST(AVG(x * 1.0) AS DECIMAL(4,2)) AS "Average of x" FROM MyTable
> ```

<details>

<summary>Expected result table</summary>

### Part 1

| Average grade |
|---------------|
| 2 |

(1 row(s) affected)

### Part 2

| Average grade |
|---------------|
| 2.94 |

(1 row(s) affected)

### Part 3

| Average grade |
|---------------|
| 3 |

(1 row(s) affected)

</details>

## 6.

How many times has the grade 3 been given this far?

<details>

<summary>Expected result table</summary>

| Number of grade 3 |
|-------------------|
| 5 |

(1 row(s) affected)

</details>

## 7.

What is the average grade (with 2 decimal places) for the student whose student number is 'o473'?

<details>

<summary>Expected result table</summary>

| o473 Average grade |
|--------------------|
| 1.67 |


(1 row(s) affected)

</details>

## 8.

How many students' first name starts with the letter 'K'?

<details>

<summary>Expected result table</summary>

| First names starting with 'K' |
|-------------------------------|
| 3 |

(1 row(s) affected)

</details>

## 9.

How many different surnames of teachers there are that start with the letter 'T'?

<details>

<summary>Expected result table</summary>

| Different surnames starting with 'T' |
|--------------------------------------|
| 1 |

(1 row(s) affected)

</details>

> [!NOTE]
> Task 10 is related to string handling.

## 10.

Write a SELECT statement that generates a list of default email addresses for students. The default domain name is 'takkula.fi'. The default email format is as follows: firstname.surname@takkula.fi. No uppercase letters allowed. Rename the column as "Default email". Sort the result by "Default email" in ascending order.

<details>

<summary>Expected result table</summary>

| Default email |
|---------------|
| fredrik.leino@takkula.fi |
| greta.hullerus@takkula.fi |
| kaarina.käki@takkula.fi |
| kaarlo.kuikka@takkula.fi |
| kuikka.kaarlo@takkula.fi |
| leila.liimatta@takkula.fi |
| martti.keto@takkula.fi |
| matti.keto@takkula.fi |
| raimo.veto@takkula.fi |
| rosina.laine@takkula.fi |
| sanna.rentukka@takkula.fi |
| usko.huhta@takkula.fi |
| valma.vuori@takkula.fi |

(13 row(s) affected)

</details>

> [!NOTE]
> Tasks 11-18 are related to date handling.

## 11.

List the following facts on each student: name of birth month, surname, first name, and student number. Do not display any other items. Sort the result by (month number, surname, first name, student number) in ascending order.

<details>

<summary>Expected result table</summary>

| Month name | surname | first_name | student_number |
|------------|---------|------------|----------------|
| February | Kaarlo | Kuikka | o889 |
| March | Hullerus | Greta | o558 |
| March | Keto | Martti | o649 |
| March | Liimatta | Leila | o410 |
| April | Käki | Kaarina | o348 |
| May | Huhta | Usko | o354 |
| May | Keto | Matti | o349 |
| May | Laine | Rosina | o654 |
| August | Kuikka | Kaarlo | o210 |
| October | Rentukka | Sanna | o148 |
| October | Vuori | Valma | o548 |
| November | Leino | Fredrik | o473 |
| December | Veto | Raimo | o298 |

(13 row(s) affected)

</details>

## 12.

How many students were born in May?

<details>

<summary>Expected result table</summary>

| Number of students born in May |
|--------------------------------|
| 3 |

(1 row(s) affected)

</details>

## 13.

List for each course instance the quarter of the year when the course instance was started. Display also the start date, course code, and instance number. Sort the result by (quarter, start date, course code) in ascending order.

<details>

<summary>Expected result table</summary>

| Quarter | start_date | course_code | instance_number |
|---------|------------|-------------|------------------|
| 1 | 2007-01-03 | a450 | 1 |
| 1 | 2007-02-10 | a480 | 1 |
| 1 | 2007-03-15 | a730 | 1 |
| 1 | 2008-01-01 | a450 | 3 |
| 1 | 2008-01-15 | a480 | 2 |
| 1 | 2008-02-02 | a290 | 2 |
| 1 | 2014-01-15 | a730 | 4 |
| 3 | 2007-08-01 | a290 | 1 |
| 3 | 2007-08-20 | a730 | 2 |
| 3 | 2009-08-21 | a450 | 4 |
| 4 | 2007-10-01 | a730 | 3 |
| 4 | 2007-12-01 | a450 | 2 |

(12 row(s) affected)

</details>

## 14.

List all the students (birth month, day of birth month, surname, first name, student number). Rename birth month as "Month" and day of birth month as "Day". Sort the result by ("Month", "Day", surname, first name, student number).

<details>

<summary>Expected result table</summary>

| Month | Day | surname | first_name | student_number |
|-------|-----|---------|------------|----------------|
| 2 | 27 | Kaarlo | Kuikka | o889 |
| 3 | 3 | Liimatta | Leila | o410 |
| 3 | 28 | Hullerus | Greta | o558 |
| 3 | 28 | Keto | Martti | o649 |
| 4 | 3 | Käki | Kaarina | o348 |
| 5 | 7 | Laine | Rosina | o654 |
| 5 | 17 | Keto | Matti | o349 |
| 5 | 22 | Huhta | Usko | o354 |
| 8 | 31 | Kuikka | Kaarlo | o210 |
| 10 | 10 | Vuori | Valma | o548 |
| 10 | 22 | Rentukka | Sanna | o148 |
| 11 | 22 | Leino | Fredrik | o473 |
| 12 | 1 | Veto | Raimo | o298 |

(13 row(s) affected)

</details>

## 15.

How many students were born on Sunday?

<details>

<summary>Expected result table</summary>

| Number of students born on Sunday |
|-----------------------------------|
| 2 |

(1 row(s) affected)

</details>

## 16.

Display the current date and weekday. Rename the date as "Current date" and weekday as "Weekday". 

> [!TIP]
> Use `SYSDATETIME()` and the `LEFT` function to show the date with 10 characters only.

<details>

<summary>Expected result table</summary>

| Current date | Weekday |
|--------------|----------|
| 2012-12-17 | Monday |

(1 row(s) affected)

</details>

## 17.

Use the appropriate function to compute the length of each course in days. List the course length, course code, instance number. Rename the length of course as "Course length". Do not list any courses with an unknown length. Sort the result by (course length, course code, instance number) in ascending order.

<details>

<summary>Expected result table</summary>

| Course length | course_code | instance_number |
|---------------|-------------|------------------|
| 39 | a480 | 2 |
| 45 | a290 | 1 |
| 46 | a730 | 2 |
| 50 | a730 | 3 |
| 53 | a450 | 1 |
| 71 | a450 | 2 |
| 71 | a480 | 1 |
| 76 | a730 | 1 |
| 115 | a450 | 4 |

(9 row(s) affected)

</details>

## 18.

Calculate the age in years for each student. Rename age as "Age". Display age, surname, first name, and student number. Sort the result by ("Age" in descending order, surname ASC, first name ASC, student number ASC).

> [!NOTE]
> Please notice that today the ages of students are higher than what is shown in this result table.

<details>

<summary>Expected result table</summary>

| Age | surname | first_name | student_number |
|-----|---------|------------|----------------|
| 44 | Kaarlo | Kuikka | o889 |
| 43 | Liimatta | Leila | o410 |
| 35 | Veto | Raimo | o298 |
| 34 | Hullerus | Greta | o558 |
| 34 | Keto | Martti | o649 |
| 34 | Laine | Rosina | o654 |
| 31 | Kuikka | Kaarlo | o210 |
| 30 | Huhta | Usko | o354 |
| 28 | Vuori | Valma | o548 |
| 27 | Käki | Kaarina | o348 |
| 26 | Keto | Matti | o349 |
| 26 | Rentukka | Sanna | o148 |
| 25 | Leino | Fredrik | o473 |

(13 row(s) affected)

</details>

---

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 19.

List all the students (student number, surname, first name, email) whose email server's domain name is not 'takkula.fi'. Do not use LIKE. Sort the result by student number in ascending order.

<details>

<summary>Expected result table</summary>

| student_number | surname | first_name | email |
|----------------|---------|------------|----------|
| o148 | Rentukka | Sanna | sanna@gmail.com |
| o473 | Leino | Fredrik | NULL |
| o548 | Vuori | Valma | valma@gmail.com |
| o649 | Keto | Martti | martti@jeps.fi |
| o889 | Kaarlo | Kuikka | NULL |

(5 row(s) affected)

</details>

## ⭐ Bonus task 20.

List all the different domain names from students' email addresses. Rename the column as "Domain name". Sort the result by "Domain name" in ascending order.

<details>

<summary>Expected result table</summary>

| Domain name |
|-------------|
| gmail.com |
| jeps.fi |
| takkula.fi |

(3 row(s) affected)

</details>

## ⭐ Bonus task 21.

What is the average course instance length in whole days?

<details>

<summary>Expected result table</summary>

| Average course instance length |
|--------------------------------|
| 63 |


(1 row(s) affected)

</details>
