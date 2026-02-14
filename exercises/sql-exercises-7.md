# SQL Exercises 7: More joins

> [!IMPORTANT]
> Create a Word document named `sql-exercises-7-YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and the result (e.g., as a [screenshot](https://www.take-a-screenshot.org/))** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

## 1.

List all the courses (surname, first name, teacher number, course name) that have been given by the teacher whose teacher number is 'h303'. Sort the result by course name in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | course_name |
|---------|------------|----------------|-------------|
| Ponteva | Veli | h303 | Cloud Computing |
| Ponteva | Veli | h303 | E-business |

(2 row(s) affected)

</details>

## 2.

List all the teachers (surname, first name, teacher number, course name). If a teacher is in charge of a course, then also the course name should be shown. Sort the result by (surname, first name, teacher number, course name) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | course_name |
|---------|------------|----------------|-------------|
| Kiisseli | Marja | h999 | NULL |
| Kokki | Seppo | h180 | NULL |
| Matikka | Mauri | h777 | Finnish 1 |
| Ponteva | Veli | h303 | Database Design |
| Ponteva | Veli | h303 | Database Developer |
| Saari | Sisko | h290 | E-business |
| Tahko | Olka | h560 | NULL |
| Tahko | Olka | h714 | NULL |
| Vainio | Veera | h784 | Data Management |
| Virta | Emma | h430 | Cloud Computing |
| Virta | Emma | h430 | Java Basics |

(11 row(s) affected)

</details>

## 3.

List all the course instances (course code, instance number, start date, surname, first name, teacher number) that have started in 2008. Concatenate surname and first name as "Teacher". Sort the result by (course code, instance number) in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | instance_number | start_date | Teacher | teacher_number |
|-------------|-----------------|------------|---------|----------------|
| a290 | 2 | 2008-02-02 | NULL | NULL |
| a450 | 3 | 2008-01-01 | Ponteva, Veli | h303 |
| a480 | 2 | 2008-01-15 | Vainio, Veera | h784 |

(3 row(s) affected)

</details>

## 4.

List all the teachers (campus name, surname, first name, teacher number, course name). If the teacher is in charge of a course, then also the course name should be shown. Sort the result by (campus name, surname, first name, teacher number, course name) in ascending order.

<details>

<summary>Expected result table</summary>

| campus_name | surname | first_name | teacher_number | course_name |
|-------------|---------|------------|----------------|-------------|
| NULL | Kiisseli | Marja | h999 | NULL |
| NULL | Tahko | Olka | h560 | NULL |
| NULL | Tahko | Olka | h714 | NULL |
| Malmi | Matikka | Mauri | h777 | Finnish 1 |
| Malmi | Saari | Sisko | h290 | E-business |
| Pasila | Kokki | Seppo | h180 | NULL |
| Pasila | Ponteva | Veli | h303 | Database Design |
| Pasila | Ponteva | Veli | h303 | Database Developer |
| Pasila | Virta | Emma | h430 | Cloud Computing |
| Pasila | Virta | Emma | h430 | Java Basics |
| Vierumäki | Vainio | Veera | h784 | Data Management |

(11 row(s) affected)

</details>

## 5.

List the number of teachers per each campus (campus name, "Number of teachers"). Sort the result by campus name in ascending order.

<details>

<summary>Expected result table</summary>

| campus_name | Number of teachers |
|-------------|--------------------|
| Malmi | 2 |
| Pasila | 3 |
| Porvoo | 0 |
| Vierumäki | 1 |

(4 row(s) affected)

</details>

## 6.

Time dimension considerations: List all the teachers (surname, first name, teacher number, start date, end date) who have been working as academic advisors in 2010 (at least for one day). Sort the result by (surname, first name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | start_date | end_date |
|---------|------------|----------------|------------|----------|
| Ponteva | Veli | h303 | 2010-01-15 | 2011-06-30 |

(1 row(s) affected)

</details>

---

> [!IMPORTANT]
> The next tasks are optional.

## ⭐ Bonus task 7.

List all the teachers (surname, first name, teacher number, course name). If the teacher is in charge of a course, display also the name of the course; otherwise leave the course name column totally empty. Sort the result by (surname, first name, teacher number) in ascending order.

> [!TIP]
> `CASE` expression is probably needed here.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | course_name |
|---------|------------|----------------|-------------|
| Kiisseli | Marja | h999 | |
| Kokki | Seppo | h180 | |
| Matikka | Mauri | h777 | Finnish 1 |
| Ponteva | Veli | h303 | Database Design |
| Ponteva | Veli | h303 | Database Developer |
| Saari | Sisko | h290 | E-business |
| Tahko | Olka | h560 | |
| Tahko | Olka | h714 | |
| Vainio | Veera | h784 | Data Management |
| Virta | Emma | h430 | Cloud Computing |
| Virta | Emma | h430 | Java Basics |

(11 row(s) affected)

</details>

## ⭐ Bonus task 8.

List all the teachers (surname, first name, teacher number, "Comment") without any duplicate entries. If the teacher is also an academic advisor, show the text 'academic advisor' in the "Comment" column, otherwise leave the column totally empty. Sort the result by (surname, first name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number | Comment |
|---------|------------|----------------|------------------|
| Kiisseli | Marja | h999 | academic advisor |
| Kokki | Seppo | h180 | academic advisor |
| Matikka | Mauri | h777 | |
| Ponteva | Veli | h303 | academic advisor |
| Saari | Sisko | h290 | academic advisor |
| Tahko | Olka | h560 | |
| Tahko | Olka | h714 | |
| Vainio | Veera | h784 | |
| Virta | Emma | h430 | academic advisor |

(9 row(s) affected)

</details>

## ⭐ Bonus task 9.

> [!NOTE]
> This can be a bit difficult, you may try to solve this one only at your own risk... ☠️

How many teachers in charge of a course there are at each campus? Display campus name and the number of teachers in charge of a course. Rename the second column as "Number of teachers in charge of a course". Sort the result by campus name in ascending order.

<details>

<summary>Expected result table</summary>

| campus_name | Number of teachers in charge of a course |
|-------------|------------------------------------------|
| Malmi | 2 |
| Pasila | 2 |
| Porvoo | 0 |
| Vierumäki | 1 |

(4 row(s) affected)

</details>
