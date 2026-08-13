# Database Normalisation Orientation Exercises

The objective of this exercise is to familiarise yourself with database normalisation and understanding the problems that arise with poor database design.

## Task 1

The university wants to keep a registry of _courses_, _teachers_ and _offices_. There can be several teachers on the same course. There can also be teachers who are not teaching on any course.

Suppose that someone (who has not completed the course Data Management and Databases successfully) has done some bad design and created the table below for storing the above-mentioned information to the database.

| coursecode | teacherno | coursename | teacher | office | officesize |
| ---------- | --------- | ---------- | ------- | ------ | ---------- |
| 10         | 1         | Java       | Frank   | 123    | 5          |
| 10         | 2         | Java       | Gorman  | 222    | 3          |
| 20         | 3         | SQL        | Susan   | 123    | 5          |
| 20         | 1         | SQL        | Frank   | 123    | 5          |
| 30         | 4         | HTML & CSS | Frank   | 125    | 4          |

<pre>Course (<ins>coursecode</ins>, <ins>teacherno</ins>, coursename, teacher, office, officesize)</pre>

1. Mention at least one consistency problem that can arise after we _UPDATE_ a value on one of
   the rows.
2. Mention one database content problem that can arise after we _DELETE_ a row from the table.
3. How about after we _INSERT_ facts about a new teacher? Any potential problems there?

## Task 2

Fix the design and show the structure as a relational schema consisting of _one or more relations_. Underline primary keys and include foreign key definitions.

| coursecode | teacherno | coursename | teacher | office | officesize |
| ---------- | --------- | ---------- | ------- | ------ | ---------- |
| 10         | 1         | Java       | Frank   | 123    | 5          |
| 10         | 2         | Java       | Gorman  | 222    | 3          |
| 20         | 3         | SQL        | Susan   | 123    | 5          |
| 20         | 1         | SQL        | Frank   | 123    | 5          |
| 30         | 4         | HTML & CSS | Frank   | 125    | 4          |

The original bad relation schema is the following:

<pre>Course (<ins>coursecode</ins>, <ins>teacherno</ins>, coursename, teacher, office, officesize)</pre>