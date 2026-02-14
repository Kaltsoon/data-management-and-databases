# SQL Exercises 2: More advanced SELECT statements

> [!CAUTION]
> Using generative AI tools to directly generate task answers is strictly forbidden and considered plagiarism. You won't be able to use such tools in the exam and without a lot of practice, your exam and learning results won't be good.

> [!IMPORTANT]
> Create a Word document named `sql_exercises_2_YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and a [screenshot](https://www.take-a-screenshot.org/) of the result** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

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

List all the male students (student number, surname, first name, gender). Sort the result by student number in ascending order.

<details>

<summary>Expected result table</summary>

| student_number | surname | first_name | gender |
|----------------|---------|------------|--------|
| o210 | Kuikka | Kaarlo | M |
| o298 | Veto | Raimo | M |
| o349 | Keto | Matti | M |
| o354 | Huhta | Usko | M |
| o473 | Leino | Fredrik | M |
| o649 | Keto | Martti | M |
| o889 | Kaarlo | Kuikka | M |

(7 row(s) affected)

</details>

## 2.

List all the female students (first name, surname, student number, gender, city) who live in Espoo. Sort the result by (surname, first name, student number) in ascending order.

> [!IMPORTANT]
> A city name might have been saved in the database either in Finnish or Swedish. For example, both 'Vantaa' and 'Vanda' are names of the same city.

<details>

<summary>Expected result table</summary>

| first_name | surname | student_number | gender | city |
|------------|---------|----------------|--------|----------|
| Greta | Hullerus | o558 | F | Esbo |
| Rosina | Laine | o654 | F | Espoo |

(2 row(s) affected)

</details>

## 3.

List all the students (name, city) who live in the capital city of Finland. Concatenate surname, comma, and first name as "Name". Sort the result by "Name" in ascending order.

<details>

<summary>Expected result table</summary>

| Name | city |
|------|----------|
| Keto, Martti | Helsinki |
| Kuikka, Kaarlo | Helsinki |
| Rentukka, Sanna | Helsinki |
| Veto, Raimo | Helsinki |

(4 row(s) affected)

</details>

## 4.

List all the students (surname, first name, city) who do not live in the capital city of Finland. Sort the result by (surname, first name) in ascending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | city |
|---------|------------|----------|
| Huhta | Usko | Klaukkala |
| Hullerus | Greta | Esbo |
| Kaarlo | Kuikka | Klaukkala |
| Keto | Matti | Maisala |
| Käki | Kaarina | Vantaa |
| Laine | Rosina | Espoo |
| Leino | Fredrik | Kyrkslätt |
| Liimatta | Leila | Veikkola |
| Vuori | Valma | Kerava |

(9 row(s) affected)

</details>

## 5.

List all the students (postcode, student number). Sort the result by (postcode, student number) in ascending order.

<details>

<summary>Expected result table</summary>

| postcode | student_number |
|----------|----------------|
| 00560 | o210 |
| 00560 | o649 |
| 00630 | o148 |
| 00680 | o298 |
| 01260 | o348 |
| 01590 | o349 |
| 01800 | o354 |
| 02320 | o558 |
| 02320 | o654 |
| 02400 | o473 |
| 02880 | o410 |
| 03210 | o889 |
| 04200 | o548 |

(13 row(s) affected)

</details>

## 6.

List all the postcodes of the areas where students live, without any duplicate entries. Sort the result in ascending order.

<details>

<summary>Expected result table</summary>

| postcode |
|----------|
| 00560 |
| 00630 |
| 00680 |
| 01260 |
| 01590 |
| 01800 |
| 02320 |
| 02400 |
| 02880 |
| 03210 |
| 04200 |

(11 row(s) affected)

</details>

## 7.

List all the students (city, postcode, surname, first name), who either live in the capital city of Finland within the postcode area 00400-00600 or who live in Espoo. Sort the result by (city, postcode, surname, first name) in ascending order.

<details>

<summary>Expected result table</summary>

| city | postcode | surname | first_name |
|----------|----------|---------|------------|
| Esbo | 02320 | Hullerus | Greta |
| Espoo | 02320 | Laine | Rosina |
| Helsinki | 00560 | Keto | Martti |
| Helsinki | 00560 | Kuikka | Kaarlo |

(4 row(s) affected)

</details>

## 8.

List all the students (postcode, city, surname, first name), who do not live within the postcode area 00600-03000. Sort the result by (postcode, city, surname, first name) in ascending order.

<details>

<summary>Expected result table</summary>

| postcode | city | surname | first_name |
|----------|---------|---------|------------|
| 00560 | Helsinki | Keto | Martti |
| 00560 | Helsinki | Kuikka | Kaarlo |
| 03210 | Klaukkala | Kaarlo | Kuikka |
| 04200 | Kerava | Vuori | Valma |

(4 row(s) affected)

</details>

## 9.

List all the misconduct types (description) where the description starts with 'A', 'C', 'F', or 'R'. Sort the result in by description ascending order.

<details>

<summary>Expected result table</summary>

| description |
|-------------|
| Assisting another student to cheat (e.g., by allowing own coursework to be copied) |
| Cheating in an exam |
| Collusion (unauthorized collaboration) |
| Copying of coursework from another student |
| Fabrication (making things up in research-oriented coursework) |
| Falsification (modifying data in research-oriented coursework) |
| Falsifying a list of attendees |
| Freeloading in a group work assignment |
| Refusal to take a drug test |

(9 row(s) affected)

</details>

## 10.

List all the misconduct types (description) where the description does not contain any of the following words: 'data', 'research', 'test'. Sort the result by description in ascending order.

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
| Falsifying a list of attendees |
| Freeloading in a group work assignment |
| Giving false information to University staff to gain an academic advantage |
| Lack of citation or improper citation |
| Submitting a paper or assignment that is retrieved from the Internet or a paper-mill |
| Use of intoxicants or being under the influence of intoxicants |

(12 row(s) affected)

</details>

## 11.

List all the teachers' surnames that end with 'ka' or 'ko'. Sort the result in ascending order.

<details>

<summary>Expected result table</summary>

| surname |
|---------|
| Matikka |
| Tahko |

(2 row(s) affected)

</details>

## 12.

List all the course instances (course code, instance number, start date, end date) where the end date is missing. Sort the result by (course code, instance number) in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | instance_number | start_date | end_date |
|-------------|-----------------|------------|----------|
| a290 | 2 | 2008-02-02 | NULL |
| a450 | 3 | 2008-01-01 | NULL |
| a730 | 4 | 2014-01-15 | NULL |

(3 row(s) affected)

</details>

## 13.

List all the course grade rows (course code, instance number, student number, grade) where the grade value is missing. Sort the result by (course code, instance number, student number) in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | instance_number | student_number | grade |
|-------------|-----------------|----------------|-------|
| a290 | 1 | o473 | NULL |
| a450 | 2 | o548 | NULL |

(2 row(s) affected)

</details>

## 14.

List all the known course grades (course code, instance number, student number, grade) from the course 'a290'. Sort the result by (course code, grade, student number) in ascending order.

<details>

<summary>Expected result table</summary>

| course_code | instance_number | student_number | grade |
|-------------|-----------------|----------------|-------|
| a290 | 1 | o410 | 2 |
| a290 | 1 | o548 | 2 |
| a290 | 1 | o298 | 3 |
| a290 | 1 | o349 | 4 |

(4 row(s) affected)

</details>

## 15.

Write a query that lists those teachers whose new salary would be above 18 800 €, if they would get a rise of 500 € and an additional 15 % salary increase to the old salary.

Display surname, first name, new salary, and old salary. In the query, rename the salary columns as "New salary" and "Old salary". Sort the result by (new salary, surname, first name) in descending order.

<details>

<summary>Expected result table</summary>

| surname | first_name | New salary | Old salary |
|---------|------------|------------|------------|
| Kiisseli | Marja | 29250.0000 | 25000.00 |
| Virta | Emma | 21315.0000 | 18100.00 |
| Vainio | Veera | 18956.3500 | 16049.00 |

(3 row(s) affected)

</details>

## 16.

List all the students (surname, first name, student number, gender). Display either 'male' or 'female' as the gender. Sort the result by (surname, first name, student number) in ascending order.

> [!TIP]
> Use the `CASE` expression to choose what to display in the column `gender`.

<details>

<summary>Expected result table</summary>

| surname | first_name | student_number | gender |
|---------|------------|----------------|--------|
| Huhta | Usko | o354 | male |
| Hullerus | Greta | o558 | female |
| Kaarlo | Kuikka | o889 | male |
| Keto | Martti | o649 | male |
| Keto | Matti | o349 | male |
| Kuikka | Kaarlo | o210 | male |
| Käki | Kaarina | o348 | female |
| Laine | Rosina | o654 | female |
| Leino | Fredrik | o473 | male |
| Liimatta | Leila | o410 | female |
| Rentukka | Sanna | o148 | female |
| Veto | Raimo | o298 | male |
| Vuori | Valma | o548 | female |

(13 row(s) affected)

</details>

## 17.

List all the course instances (start date, end date, course code, instance number) that have been going on during the timespan 1.12.2007 and 15.2.2008. That is, at least one day of the course has been between these two dates.

Sort the result by (start date, course code, instance number) in ascending order.

> [!TIP]
> - If you feel unsure, see the sample query result to figure out for more details.
> - The `WHERE` condition should be a short one. Do not try to handle all possible situations with separate tests.
> - To solve this problem, you should first try to figure out the different types of situations.

<details>

<summary>Expected result table</summary>

| start_date | end_date | course_code | instance_number |
|------------|----------|-------------|------------------|
| 2007-12-01 | 2008-02-10 | a450 | 2 |
| 2008-01-01 | NULL | a450 | 3 |
| 2008-01-15 | 2008-02-23 | a480 | 2 |
| 2008-02-02 | NULL | a290 | 2 |

(4 row(s) affected)

</details>


