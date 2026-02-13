# SQL Exercises 6: Joins

> [!IMPORTANT]
> Create a Word document named `sql-exercises-6-YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and the result (e.g., as a [screenshot](https://www.take-a-screenshot.org/))** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

> [!TIP]
> To understand the database structure, use the **Database Diagram** in this week's "Materials" section on the course outline page. It shows the database tables, columns, primary keys and foreign keys.

## 1.

What course instances does each teacher teach? Display surname, first name, teacher number, course code, and instance number. Sort the result by (surname, first name, course code, instance number).

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | course_code | instance_number |
|---------|------------|----------------|-------------|------------------|
| Kokki | Seppo | h180 | a480 | 1 |
| Ponteva | Veli | h303 | a450 | 1 |
| Ponteva | Veli | h303 | a450 | 3 |
| Ponteva | Veli | h303 | a450 | 4 |
| Ponteva | Veli | h303 | a730 | 2 |
| Ponteva | Veli | h303 | a730 | 3 |
| Saari | Sisko | h290 | a730 | 1 |
| Tahko | Olka | h560 | a450 | 2 |
| Vainio | Veera | h784 | a480 | 2 |
| Virta | Emma | h430 | a290 | 1 |

(10 row(s) affected)

</details>

## 2.

Who is the person in charge of each course? Display course code, course name, and name of the person in charge. Concatenate surname and first name as "Person in charge". Sort the result by course code in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name | Person in charge |
|-------------|-------------|------------------|
| a290 | Java Basics | Virta, Emma |
| a450 | Cloud Computing | Virta, Emma |
| a480 | Data Management | Vainio, Veera |
| a500 | Database Developer | Ponteva, Veli |
| a510 | Database Design | Ponteva, Veli |
| a730 | E-business | Saari, Sisko |
| a800 | Finnish 1 | Matikka, Mauri |

(7 row(s) affected)

</details>

## 3.

What is the grade point average (= average grade) for each student? Display surname, first name, student number, and average grade (with two decimal places, named as "Grade point average"). Sort the result by (surname, first name, student number).

<details>

<summary>Expected result table</summary>

| surname | first_name | student_number | Grade point average |
|---------|------------|----------------|---------------------|
| Huhta | Usko | o354 | 2.00 |
| Keto | Martti | o649 | 4.00 |
| Keto | Matti | o349 | 4.00 |
| Kuikka | Kaarlo | o210 | 2.00 |
| Käki | Kaarina | o348 | 5.00 |
| Laine | Rosina | o654 | 5.00 |
| Leino | Fredrik | o473 | 1.67 |
| Liimatta | Leila | o410 | 2.50 |
| Rentukka | Sanna | o148 | 4.00 |
| Veto | Raimo | o298 | 3.00 |
| Vuori | Valma | o548 | 2.00 |

(11 row(s) affected)

</details>

## 4.

Time dimension considerations

1. List all the current academic advisors (surname, first name, teacher number, start date, end date). Sort the result by (surname, first name, teacher number) in ascending order.
2. List all the current and past academic advisors (surname, first name, teacher number, start date, end date). Sort the result by (surname, first name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

**Part a):**

| surname | first_name | teacher_number | start_date | end_date |
|---------|------------|----------------|------------|----------|
| Kiisseli | Marja | h999 | 2012-01-01 | NULL |
| Ponteva | Veli | h303 | 2012-01-01 | NULL |
| Saari | Sisko | h290 | 2012-01-01 | NULL |
| Virta | Emma | h430 | 2011-01-16 | NULL |

(4 row(s) affected)

**Part b):**

| surname | first_name | teacher_number | start_date | end_date |
|---------|------------|----------------|------------|----------|
| Kiisseli | Marja | h999 | 2012-01-01 | NULL |
| Kokki | Seppo | h180 | 2011-01-01 | 2011-12-15 |
| Ponteva | Veli | h303 | 2010-01-15 | 2011-06-30 |
| Ponteva | Veli | h303 | 2012-01-01 | NULL |
| Saari | Sisko | h290 | 2012-01-01 | NULL |
| Virta | Emma | h430 | 2011-01-16 | NULL |

(6 row(s) affected)

</details>

## 5.

What types of academic misconduct have occurred at Takkula University this far? List misconduct description. Sort the result by misconduct type in ascending order. This time, use a join, not any subquery.

<details>

<summary>Expected result table</summary>

| Misconduct occurred this far |
|------------------------------|
| Dual submission (submitting own work, which already has been graded for an earlier course, for a second course) |
| Freeloading in a group work assignment |

(2 row(s) affected)

</details>

## 6.

List all the students (surname, first name, student number, course code, grade) who live in Helsinki and have at least one course grade greater than 2. Sort the result by (surname, first name, student number, course code). 

> [!IMPORTANT]
> You are required to show only such rows where grade is > 2.

<details>

<summary>Expected result table</summary>

| surname | first_name | student_number | course_code | grade |
|---------|------------|----------------|-------------|-------|
| Keto | Martti | o649 | a480 | 4 |
| Keto | Martti | o649 | a730 | 4 |
| Kuikka | Kaarlo | o210 | a450 | 3 |
| Rentukka | Sanna | o148 | a730 | 4 |
| Veto | Raimo | o298 | a290 | 3 |
| Veto | Raimo | o298 | a480 | 3 |

(6 row(s) affected)

</details>

## 7.

List all the teachers (course code, course name, teacher number, surname, first name) who have given the course that has the course code 'a730'. Sort the result by teacher number in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name | teacher_number | surname | first_name |
|-------------|-------------|----------------|---------|------------|
| a730 | E-business | h290 | Saari | Sisko |
| a730 | E-business | h303 | Ponteva | Veli |

(2 row(s) affected)

</details>

## 8.

List all the passing grades (course name, grade, surname, first name, student number) for female students. Sort by the result by (course name, grade in descending order, surname, first name, student number in ascending order).

<details>

<summary>Expected result table</summary>

| course_name | grade | surname | first_name | student_number |
|-------------|-------|---------|------------|----------------|
| Cloud Computing | 5 | Laine | Rosina | o654 |
| E-business | 5 | Käki | Kaarina | o348 |
| E-business | 4 | Rentukka | Sanna | o148 |
| E-business | 3 | Liimatta | Leila | o410 |
| Java Basics | 2 | Liimatta | Leila | o410 |
| Java Basics | 2 | Vuori | Valma | o548 |

(6 row(s) affected)

</details>

## 9.

In which courses have female students achieved grade 5? Display course code, course name, and the number of grade 5's achieved by female students. Rename the last column as "Grade five". Sort the result by course code in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name | Grade five |
|-------------|-------------|------------|
| a450 | Cloud Computing | 1 |
| a730 | E-business | 1 |

(2 row(s) affected)

</details>

## 10.

List all the students (surname, first name, student number) of those students, who have grade 3 from any course. Do not allow any duplicate entries in the result. Sort by (surname, first name, student number) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | student_number |
|---------|------------|----------------|
| Kuikka | Kaarlo | o210 |
| Leino | Fredrik | o473 |
| Liimatta | Leila | o410 |
| Veto | Raimo | o298 |

(4 row(s) affected)

</details>

## 11.

List all the teachers (teacher number, surname, first name, month name of the grade date) who have evaluated a course in May. Rename the last column as "Grade month". Sort the result by teacher number in ascending order.

> [!IMPORTANT]
> Make sure that the result of your query is not dependent of the local language (English, Finnish, ...).

<details>

<summary>Expected result table</summary>

| teacher_number | surname | first_name | Grade month |
|----------------|---------|------------|-------------|
| h180 | Kokki | Seppo | May |
| h784 | Vainio | Veera | May |

(2 row(s) affected)

</details>

## 12.

How are the average grade and the total number of grades distributed between female and male students? Display gender, average grade (with 2 decimal places) and the number of grades. Rename the last two columns as "Average grade" and "Number of grades". Sort by "Average grade" in descending order.

<details>

<summary>Expected result table</summary>

| gender | Average grade | Number of grades |
|--------|---------------|------------------|
| F | 3.50 | 6 |
| M | 2.64 | 11 |

(2 row(s) affected)

</details>

## 13.

Create a Cartesian product using the tables Campus and AcademicAdvisor, without any duplicate entries. Display campus name and teacher number. Sort the result by (campus name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

| campus_name | teacher_number |
|-------------|----------------|
| Malmi | h180 |
| Malmi | h290 |
| Malmi | h303 |
| Malmi | h430 |
| Malmi | h999 |
| Pasila | h180 |
| Pasila | h290 |
| Pasila | h303 |
| Pasila | h430 |
| Pasila | h999 |
| Porvoo | h180 |
| Porvoo | h290 |
| Porvoo | h303 |
| Porvoo | h430 |
| Porvoo | h999 |
| Vierumäki | h180 |
| Vierumäki | h290 |
| Vierumäki | h303 |
| Vierumäki | h430 |
| Vierumäki | h999 |

(20 row(s) affected)

</details>

## 14.

List the courses that students have failed due to an academic misconduct incident. Display course code, instance number, course name, student number, surname, first name, and misconduct description.

<details>

<summary>Expected result table</summary>

| course_code | instance_number | course_name | student_number | surname | first_name | description |
|-------------|-----------------|-------------|----------------|---------|------------|-------------|
| a480 | 2 | Data Management | o473 | Leino | Fredrik | Dual submission (submitting own work, which already has been graded for an earlier course, for a second course) |
| a450 | 2 | Cloud Computing | o548 | Vuori | Valma | Freeloading in a group work assignment |

(2 row(s) affected)

</details>

## 15.

List all the students (student number, surname, first name, disciplinary sanction, misconduct description) who have got a written warning due to an academic misconduct incident.

<details>

<summary>Expected result table</summary>

| student_number | surname | first_name | Sanction | Misconduct |
|----------------|---------|------------|----------|------------|
| o548 | Vuori | Valma | Written warning | Freeloading in a group work assignment |

(1 row(s) affected)

</details>

## 16.

What is the prevalence of academic misconduct at Takkula University? Find out the percentage of students who have been penalized due to an academic misconduct incident. Display the percentage with one decimal place. Rename the column as "Misconduct %".

> [!TIP] 
> When you need to use the total of students as an operand in the percentage calculation, write a subquery in the formula.

<details>

<summary>Expected result table</summary>

| Misconduct % |
|--------------|
| 15.4 |

(1 row(s) affected)

</details>

---

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 17.

List all the courses (course name, teacher number, teacher name) where the person in charge has also been the teacher of an instance of the course. Concatenate surname and first name "Person in charge teaching". Sort the result by (surname, first name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

| course_name | Person in charge teaching | teacher_number |
|-------------|---------------------------|----------------|
| E-business | Saari, Sisko | h290 |
| Data Management | Vainio, Veera | h784 |
| Java Basics | Virta, Emma | h430 |

(3 row(s) affected)

</details>

## ⭐ Bonus task 18.

List all the prerequisite courses for the course 'a500'. Display course code and course name for the course 'a500', and course code and course name for all the prerequisite courses. Concatenate prerequisite course code and name as "Prerequisite". Sort the result by "Prerequisite" in ascending order.

> [!TIP]
> You can define an alias name for the course table for joining the same table twice in the query.

<details>

<summary>Expected result table</summary>

| course_code | course_name | Prerequisite |
|-------------|-------------|---------------------------|
| a500 | Database Developer | a480 Data Management |

(1 row(s) affected)

</details>

## ⭐ Bonus task 19.

List all the courses and their prerequisite courses. Display the columns as before. Sort the result by course code, prerequisite course code in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name | Prerequisite |
|-------------|-------------|---------------------------|
| a290 | Java Basics | NULL |
| a450 | Cloud Computing | NULL |
| a480 | Data Management | NULL |
| a500 | Database Developer | a480 Data Management |
| a510 | Database Design | a500 Database Developer |
| a510 | Database Design | a730 E-business |
| a730 | E-business | NULL |
| a800 | Finnish 1 | NULL |

(8 row(s) affected)

</details>

## ⭐ Bonus task 20.

List all the courses (course code, instance number, course name, teacher, person in charge). Concatenate teacher's number, surname, and first name as "Teacher". Concatenate number, surname, and first name of the person in charge as "Person in charge". Sort the result by (course code, instance number) in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | course_name | instance_number | Teacher | Person in charge |
|-------------|-------------|-----------------|---------|------------------|
| a290 | Java Basics | 1 | h430 Virta, Emma | h430 Virta, Emma |
| a290 | Java Basics | 2 | NULL | h430 Virta, Emma |
| a450 | Cloud Computing | 1 | h303 Ponteva, Veli | h430 Virta, Emma |
| a450 | Cloud Computing | 2 | h560 Tahko, Olka | h430 Virta, Emma |
| a450 | Cloud Computing | 3 | h303 Ponteva, Veli | h430 Virta, Emma |
| a450 | Cloud Computing | 4 | h303 Ponteva, Veli | h430 Virta, Emma |
| a480 | Data Management | 1 | h180 Kokki, Seppo | h784 Vainio, Veera |
| a480 | Data Management | 2 | h784 Vainio, Veera | h784 Vainio, Veera |
| a730 | E-business | 1 | h290 Saari, Sisko | h290 Saari, Sisko |
| a730 | E-business | 2 | h303 Ponteva, Veli | h290 Saari, Sisko |
| a730 | E-business | 3 | h303 Ponteva, Veli | h290 Saari, Sisko |
| a730 | E-business | 4 | NULL | h290 Saari, Sisko |

(12 row(s) affected)

</details>
