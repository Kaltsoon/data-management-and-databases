# SQL Exercises 5: Grouping and subqueries

> [!IMPORTANT]
> Create a Word document named `sql_exercises_5_YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and a [screenshot](https://www.take-a-screenshot.org/) of the result** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

## 1.

Find out the total number of course participants per each course. Display "Number of participants" and course code. Sort the result by (number of participants in descending order, course code in ascending order).

<details>

<summary>Expected result table</summary>

| Number of participants | course_code |
|------------------------|-------------|
| 63 | a450 |
| 53 | a730 |
| 41 | a480 |
| 14 | a290 |

(4 row(s) affected)

</details>

## 2.

How many passing grades does each student have? Display "Number of grades" and student number. Sort the result by (number of grades in descending order, student number in ascending order).

<details>

<summary>Expected result table</summary>

| Number of grades | student_number |
|------------------|----------------|
| 2 | o210 |
| 2 | o298 |
| 2 | o410 |
| 2 | o473 |
| 2 | o649 |
| 1 | o148 |
| 1 | o348 |
| 1 | o349 |
| 1 | o354 |
| 1 | o548 |
| 1 | o654 |

(11 row(s) affected)

</details>

## 3.

What is the average grade for each student? Display 'Average grade' and student number. Sort the result by student number in ascending order.

1. First version: display the average grade as an integer (no rounding etc.)
2. Second version: display the correct average grade with two decimal places.

<details>

<summary>Expected result table</summary>

**Part 1:**

| student_number | Average grade |
|----------------|---------------|
| o148 | 4 |
| o210 | 2 |
| o298 | 3 |
| o348 | 5 |
| o349 | 4 |
| o354 | 2 |
| o410 | 2 |
| o473 | 1 |
| o548 | 2 |
| o649 | 4 |
| o654 | 5 |

(11 row(s) affected)

**Part 2:**

| student_number | Average grade |
|----------------|---------------|
| o148 | 4.00 |
| o210 | 2.00 |
| o298 | 3.00 |
| o348 | 5.00 |
| o349 | 4.00 |
| o354 | 2.00 |
| o410 | 2.50 |
| o473 | 1.67 |
| o548 | 2.00 |
| o649 | 4.00 |
| o654 | 5.00 |

(11 row(s) affected)

</details>

## 4.

How many course instances has each teacher given? Display teacher number and the number of course instances. Rename the second column as "Number of course instances". Sort the result by teacher number.

<details>

<summary>Expected result table</summary>

| teacher_number | Number of course instances |
|----------------|----------------------------|
| h180 | 1 |
| h290 | 1 |
| h303 | 5 |
| h430 | 1 |
| h560 | 1 |
| h784 | 1 |

(6 row(s) affected)

</details>

## 5.

How many different courses has each teacher given? Display teacher number and "Number of different courses". Sort the result by (number of different courses in descending order, teacher number in ascending order)

<details>

<summary>Expected result table</summary>

| teacher_number | Number of different courses |
|----------------|-----------------------------|
| h303 | 2 |
| h180 | 1 |
| h290 | 1 |
| h430 | 1 |
| h560 | 1 |
| h784 | 1 |

(6 row(s) affected)

</details>

## 6.

List all the teachers who have given more than one course instance. Display teacher number and "Number of course instances". Sort the result by teacher number.

<details>

<summary>Expected result table</summary>

| teacher_number | Number of course instances |
|----------------|----------------------------|
| h303 | 5 |

(1 row(s) affected)

</details>

## 7.

List for each student the student number, average grade, highest grade, and lowest grade. In the query, rename the columns as "Average grade", "Highest grade", and "Lowest grade". Sort the result by (average grade, student number).

> [!NOTE]
> Display the correct average grade with two decimal places.

<details>

<summary>Expected result table</summary>

| student_number | Average grade | Highest grade | Lowest grade |
|----------------|---------------|---------------|---------------|
| o473 | 1.67 | 3 | 0 |
| o210 | 2.00 | 3 | 1 |
| o354 | 2.00 | 2 | 2 |
| o548 | 2.00 | 2 | 2 |
| o410 | 2.50 | 3 | 2 |
| o298 | 3.00 | 3 | 3 |
| o148 | 4.00 | 4 | 4 |
| o349 | 4.00 | 4 | 4 |
| o649 | 4.00 | 4 | 4 |
| o348 | 5.00 | 5 | 5 |
| o654 | 5.00 | 5 | 5 |

(11 row(s) affected)

</details>

## 8.

List the same information as in the previous task, but this time only for those students, whose grade average is above 3.

> [!NOTE]
> Tasks 9-14 are related to subqueries.

<details>

<summary>Expected result table</summary>

| student_number | Average grade | Highest grade | Lowest grade |
|----------------|---------------|---------------|---------------|
| o148 | 4.00 | 4 | 4 |
| o349 | 4.00 | 4 | 4 |
| o649 | 4.00 | 4 | 4 |
| o348 | 5.00 | 5 | 5 |
| o654 | 5.00 | 5 | 5 |

(5 row(s) affected)

</details>

## 9.

In which course instances is the number of participants above the average? Display number of participants, course code, and instance number. Sort the result by (number of participants in descending order, course code in ascending order, instance number in ascending order).

<details>

<summary>Expected result table</summary>

| participants | course_code | instance_number |
|--------------|-------------|------------------|
| 25 | a480 | 2 |
| 22 | a730 | 3 |
| 18 | a450 | 4 |

(3 row(s) affected)

</details>

## 10.

List all the students (surname, first name, student number) who have not passed any courses. Sort the result in ascending order by (surname, first name, student number).

> [!TIP]
> The table `CourseGrade` contains facts on all the passing grades. The table Student contains facts on all the students.

<details>

<summary>Expected result table</summary>

| surname | first_name | student_number |
|---------|------------|----------------|
| Hullerus | Greta | o558 |
| Kaarlo | Kuikka | o889 |

(2 row(s) affected)

</details>

## 11.

List all the teachers (surname, first name, teacher number, salary) who earn more than all of those teachers who work at campus that has campus code 'c222'. Sort the result by (surname, first name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | salary |
|---------|------------|----------------|----------|
| Kiisseli | Marja | h999 | 25000.00 |
| Kokki | Seppo | h180 | 15780.00 |
| Tahko | Olka | h560 | 15899.00 |
| Vainio | Veera | h784 | 16049.00 |
| Virta | Emma | h430 | 18100.00 |

(5 row(s) affected)

</details>

## 12.

List all the courses (course code, course name) that at least one student has passed this far. Sort the result by course code in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name |
|-------------|----------|
| a290 | Java Basics |
| a450 | Cloud Computing |
| a480 | Data Management |
| a730 | E-business |

(4 row(s) affected)

</details>

## 13.

List all the courses (course code, course name) that no student has passed this far. Sort the result by course code in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name |
|-------------|----------|
| a500 | Database Developer |
| a510 | Database Design |
| a800 | Finnish 1 |

(3 row(s) affected)

</details>

## 14.

List all the teachers (teacher number, surname, first name) who have not given any courses this far. Sort the result in ascending order by (surname, first name, teacher number).

> [!TIP]
> What about missing information? See the SQL DML Quick Reference Guide for details.

<details>

<summary>Expected result table</summary>

| teacher_number | surname | first_name |
|----------------|---------|------------|
| h999 | Kiisseli | Marja |
| h777 | Matikka | Mauri |
| h714 | Tahko | Olka |

(3 row(s) affected)

</details>

---

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 15.

List all courses (course name) that have been given by different teachers who are working at different campuses. 

Example of such course: There exists two course instances of the course. The first one is given by teacher A who is working at campus 1. The second one is given by teacher B who is working at campus 2. 

> [!TIP]
> Here you might need a `JOIN` operation, a subquery, grouping, aggregate function etc.

<details>

<summary>Expected result table</summary>

| course_name |
|-------------|
| Data Management |
| E-business |

(2 row(s) affected)

</details>

## ⭐ Bonus task 16.

Display the gender distribution of students in the following way (sort the result by "%" in descending order):

gender | %
--------|------
M | 53.8
F | 46.2

> [!TIP]
> You can use a scalar subquery as an operand of an arithmetic operation in the column list.

<details>

<summary>Expected result table</summary>

| gender | % |
|--------|-----------|
| M | 53.8 |
| F | 46.2 |

(2 row(s) affected)

</details>

## ⭐ Bonus task 17.

Display the gender distribution of students in the following way:

Female | Male
--------|------
46.2 % | 53.8 %

<details>

<summary>Expected result table</summary>

| Female | Male |
|--------|----------|
| 46.2 % | 53.8 % |

(1 row(s) affected)

</details>

## ⭐ Bonus task 18.

Display student number and average grade of the student(s) who has/have the highest average grade. Display the average grade with two decimal places.

<details>

<summary>Expected result table</summary>

| student_number | average grade |
|----------------|---------------|
| o348 | 5.00 |
| o654 | 5.00 |

(2 row(s) affected)

</details>

## ⭐ Bonus task 19.

Display how many teachers were born in each decade. Sort the result by decade in ascending order. See the sample query results on how to display the result. 

> [!TIP]
> In this task, you do not necessarily find all the needed syntax from the SQL DML Quick Reference Guide.

<details>

<summary>Expected result table</summary>

| decade | teachers born |
|--------|---------------|
| 40s | 1 |
| 50s | 1 |
| 60s | 2 |
| 70s | 3 |
| 80s | 2 |

(5 row(s) affected)

</details>

## ⭐ Bonus task 20.

Find the youngest female student and youngest male student. Display gender, surname, first name, birth date and age. Use a scalar function to compute the age.

<details>

<summary>Expected result table</summary>

| gender | surname | first_name | birth_date | age |
|--------|---------|------------|------------|-----|
| F | Rentukka | Sanna | 1985-10-22 | 31 |
| M | Leino | Fredrik | 1986-11-22 | 30 |

(2 row(s) affected)

</details>
