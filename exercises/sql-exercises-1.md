# SQL Exercises 1: Simple SELECT statements

> [!CAUTION]
> Using generative AI tools to directly generate task answers is strictly forbidden and considered plagiarism. You won't be able to use such tools in the exam and without a lot of practice, your exam and learning results won't be good.

> [!IMPORTANT]
> Create a Word document named `sql_exercises_1_YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and a [screenshot](https://www.take-a-screenshot.org/) of the result** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

> [!TIP]
> To understand the database structure, use the **Database Diagram** in this week's "Materials" section on the course outline page. It shows the database tables, columns, primary keys and foreign keys.

Write the task numbers to your query window as follows:

```sql
-- 1
SELECT ...
-- 2
SELECT ...
```

You can copy and paste the query window contents to your submission Word document. Also include a [screenshot](https://www.take-a-screenshot.org/) of each query's result.

## 1.

Write a SELECT statement that lists all the campuses. Display all columns. The order of rows and columns does not matter.

> [!IMPORTANT]
> Compare the result tables of your own queries to the expected result tables to see if your queries are correct.

<details>

<summary>Expected result table (click to open)</summary>

| campus_code | campus_name | street | postcode | city |
|-------------|-------------|--------|----------|----------|
| c111 | Pasila | Ratapihantie 13 | 00520 | Helsinki |
| c222 | Malmi | Hietakummuntie 1 A | 00700 | Helsinki |
| c333 | Vierumäki | Kaskelantie 10 | 19120 | Vierumäki |
| c444 | Porvoo | Taidetehtaankatu 1 | 06100 | Porvoo |

(4 row(s) affected)

</details>

## 2.

Write a SELECT statement that lists all the campuses. Display city and campus name. Sort the result by (city, campus name) in ascending order.

<details>

<summary>Expected result table</summary>

| city | campus_name |
|----------|-------------|
| Helsinki | Malmi |
| Helsinki | Pasila |
| Porvoo | Porvoo |
| Vierumäki | Vierumäki |

(4 row(s) affected)

</details>

## 3.

What kinds of disciplinary sanctions there are at the University? List all sanctions (description and decision maker). Sort the result by sanction code in descending order.

<details>

<summary>Expected result table</summary>

| description | decision_maker |
|-------------|----------------|
| Expulsion | Board of the University |
| Written warning | President of the University |
| Oral warning | Head of faculty |

(3 row(s) affected)

</details>

## 4.

What types of academic misconduct are mentioned in the MisconductType table? List all the misconduct descriptions. Sort the result by description in ascending order.

<details>

<summary>Expected result table</summary>

| description |
|-------------|
| Assisting another student to cheat (e.g., by allowing own coursework to be copied) |
| Cheating in an exam |
| Collusion (unauthorized collaboration) |
| Copying of coursework from another student |
| Disturbing teaching or fellow students |
| Dual submission (submitting own work, which already has been graded for an earlier course, for a second course) |
| Fabrication (making things up in research-oriented coursework) |
| Falsification (modifying data in research-oriented coursework) |
| Falsifying a list of attendees |
| Freeloading in a group work assignment |
| Giving false information to University staff to gain an academic advantage |
| Lack of citation or improper citation |
| Refusal to take a drug test |
| Submitting a paper or assignment that is retrieved from the Internet or a paper-mill |
| Use of intoxicants or being under the influence of intoxicants |

(15 row(s) affected)

</details>

## 5.

List all the teachers (surname, first name, teacher number). Sort the result by (surname, first name, teacher number) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | teacher_number |
|---------|------------|----------------|
| Kiisseli | Marja | h999 |
| Kokki | Seppo | h180 |
| Matikka | Mauri | h777 |
| Ponteva | Veli | h303 |
| Saari | Sisko | h290 |
| Tahko | Olka | h560 |
| Tahko | Olka | h714 |
| Vainio | Veera | h784 |
| Virta | Emma | h430 |

(9 row(s) affected)

</details>

## 6.

List all the female students (student number, surname, first name, birth date, gender). Sort the result by student number in ascending order.

<details>

<summary>Expected result table</summary>

| student_number | surname | first_name | birth_date | gender |
|----------------|---------|------------|------------|--------|
| o148 | Rentukka | Sanna | 1985-10-22 | F |
| o348 | Käki | Kaarina | 1985-04-03 | F |
| o410 | Liimatta | Leila | 1969-03-03 | F |
| o548 | Vuori | Valma | 1984-10-10 | F |
| o558 | Hullerus | Greta | 1977-03-28 | F |
| o654 | Laine | Rosina | 1978-05-07 | F |

(6 row(s) affected)

</details>

## 7.

List all the teachers (salary, surname, first name, teacher number) whose salary is greater than 16 000. Sort the result by salary in descending order.

<details>

<summary>Expected result table</summary>

| salary | surname | first_name | teacher_number |
|--------|---------|------------|----------------|
| 25000.00 | Kiisseli | Marja | h999 |
| 18100.00 | Virta | Emma | h430 |
| 16049.00 | Vainio | Veera | h784 |

(3 row(s) affected)

</details>

## 8.

Write a SELECT statement that finds Veera Vainio's teacher number.

> [!NOTE]
> You need Veera Vainio's teacher number in the next task.

<details>

<summary>Expected result table</summary>

| teacher_number |
|----------------|
| h784 |

(1 row(s) affected)

</details>

## 9.

List all the grades (examiner's teacher number, course code, instance number, student number, grade) that have been given by Veera Vainio. Note: You have already listed her teacher number in a previous task. Sort the result by (course code, instance number, student number) in ascending order.

<details>

<summary>Expected result table</summary>

| examiner | course_code | instance_number | student_number | grade |
|----------|-------------|-----------------|----------------|-------|
| h784 | a480 | 1 | o354 | 2 |
| h784 | a480 | 2 | o298 | 3 |
| h784 | a480 | 2 | o473 | 0 |

(3 row(s) affected)

</details>

## 10.

List all the course instances (start date, end date, course code, instance number) that have started and ended in 2007. Sort the result by (start date, end date, course code, instance number) in ascending order.

<details>

<summary>Expected result table</summary>

| start_date | end_date | course_code | instance_number |
|------------|----------|-------------|------------------|
| 2007-01-03 | 2007-02-25 | a450 | 1 |
| 2007-02-10 | 2007-04-22 | a480 | 1 |
| 2007-03-15 | 2007-05-30 | a730 | 1 |
| 2007-08-01 | 2007-09-15 | a290 | 1 |
| 2007-08-20 | 2007-10-05 | a730 | 2 |
| 2007-10-01 | 2007-11-20 | a730 | 3 |

(6 row(s) affected)

</details>

## 11.

List all the students (gender, birth date, surname, first name) whose surname is in the range of (A-K). Display girls after all boys in the list. Boys should be listed in ascending order by birth date.

> [!IMPORTANT]
> In SQL, `DATE` values are written in the ISO date format `'yyyy-mm-dd'`. That is, a `DATE` value is always exactly 10 characters enclosed within single quotes, for example `'2012-02-25'`.

<details>

<summary>Expected result table</summary>

| gender | birth_date | surname | first_name |
|--------|------------|---------|------------|
| M | 1967-02-27 | Kaarlo | Kuikka |
| M | 1977-03-28 | Keto | Martti |
| M | 1980-08-31 | Kuikka | Kaarlo |
| M | 1981-05-22 | Huhta | Usko |
| M | 1986-05-17 | Keto | Matti |
| F | 1977-03-28 | Hullerus | Greta |
| F | 1985-04-03 | Käki | Kaarina |

(7 row(s) affected)

</details>

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
