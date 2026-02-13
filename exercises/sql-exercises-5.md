# SQL Exercises 5: Joins

Write task numbers to your SQL query window as follows:

```sql
-- 5.1
SELECT ...
-- 5.2
SELECT ...
```

## 1.

What course instances does each teacher teach? Display surname, first name, teacher number, course code, and instance number. Sort the result by (surname, first name, course code, instance number).

## 2.

Who is the person in charge of each course? Display course code, course name, and name of the person in charge. Concatenate surname and first name as "Person in charge". Sort the result by course code in ascending order.

## 3.

What is the grade point average (= average grade) for each student? Display surname, first name, student number, and average grade (with two decimal places, named as "Grade point average"). Sort the result by (surname, first name, student number).

## 4.

Time dimension considerations

1. List all the current academic advisors (surname, first name, teacher number, start date, end date). Sort the result by (surname, first name, teacher number) in ascending order.
2. List all the current and past academic advisors (surname, first name, teacher number, start date, end date). Sort the result by (surname, first name, teacher number) in ascending order.

## 5.

What types of academic misconduct have occurred at Takkula University this far? List misconduct description. Sort the result by misconduct type in ascending order. This time, use a join, not any subquery.

## 6.

List all the students (surname, first name, student number, course code, grade) who live in Helsinki and have at least one course grade greater than 2. Sort the result by (surname, first name, student number, course code). NB! You are required to show only such rows where grade is > 2.

## 7.

List all the teachers (course code, course name, teacher number, surname, first name) who have given the course that has the course code 'a730'. Sort the result by teacher number in ascending order.

## 8.

List all the passing grades (course name, grade, surname, first name, student number) for female students. Sort by the result by (course name, grade in descending order, surname, first name, student number in ascending order).

## 9.

In which courses have female students achieved grade 5? Display course code, course name, and the number of grade 5's achieved by female students. Rename the last column as "Grade five". Sort the result by course code in ascending order.

## 10.

List all the students (surname, first name, student number) of those students, who have grade 3 from any course. Do not allow any duplicate entries in the result. Sort by (surname, first name, student number) in ascending order.

## 11.

List all the teachers (teacher number, surname, first name, month name of the grade date) who have evaluated a course in May. Rename the last column as "Grade month". Sort the result by teacher number in ascending order.

NOTICE: Make sure that the result of your query is not dependent of the local language (English, Finnish, ...).

## 12.

How are the average grade and the total number of grades distributed between female and male students? Display gender, average grade (with 2 decimal places) and the number of grades. Rename the last two columns as "Average grade" and "Number of grades". Sort by "Average grade" in descending order.

## 13.

Create a Cartesian product using the tables Campus and AcademicAdvisor, without any duplicate entries. Display campus name and teacher number. Sort the result by (campus name, teacher number) in ascending order.

## 14.

List the courses that students have failed due to an academic misconduct incident. Display course code, instance number, course name, student number, surname, first name, and misconduct description.

## 15.

List all the students (student number, surname, first name, disciplinary sanction, misconduct description) who have got a written warning due to an academic misconduct incident.

## 16.

What is the prevalence of academic misconduct at Takkula University? Find out the percentage of students who have been penalized due to an academic misconduct incident. Display the percentage with one decimal place. Rename the column as "Misconduct %".

Hint: When you need to use the total of students as an operand in the percentage calculation, write a subquery in the formula.

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 17.

List all the courses (course name, teacher number, teacher name) where the person in charge has also been the teacher of an instance of the course. Concatenate surname and first name "Person in charge teaching". Sort the result by (surname, first name, teacher number) in ascending order.

## ⭐ Bonus task 18.

List all the prerequisite courses for the course 'a500'. Display course code and course name for the course 'a500', and course code and course name for all the prerequisite courses. Concatenate prerequisite course code and name as "Prerequisite". Sort the result by "Prerequisite" in ascending order.

> [!TIP]
> You can define an alias name for the course table for joining the same table twice in the query.

## ⭐ Bonus task 19.

List all the courses and their prerequisite courses. Display the columns as before. Sort the result by course code, prerequisite course code in ascending order.

## ⭐ Bonus task 20.

List all the courses (course code, instance number, course name, teacher, person in charge). Concatenate teacher's number, surname, and first name as "Teacher". Concatenate number, surname, and first name of the person in charge as "Person in charge". Sort the result by (course code, instance number) in ascending order.
