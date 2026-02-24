# Orientation Exercises

> [!IMPORTANT]
> Write your answers to a Word document named `orientation_exercises_YOURFAMILYNAME.docx` and submit the document to Moodle. Submissions can be found on Moodle's "Coursework submissions" page.

## Task 1: Exploring a database

The University Database contains the following:

### Course

| Course ID | Name           | Credits |
| --------- | -------------- | ------- |
| CS-1      | Programming    | 5       |
| CS-2      | Web Design     | 4       |
| CS-3      | Databases      | 6       |
| CS-4      | Multi-tracking | 4       |

### Course implementation

| Course ID | Course implementation number | Start date | Teacher ID |
| --------- | ---------------------------- | ---------- | ---------- |
| CS-2      | 1                            | 2017-09-01 | 33         |
| CS-2      | 2                            | 2018-09-06 | 44         |
| CS-3      | 1                            | 2016-09-03 | 33         |
| CS-3      | 2                            | 2017-09-02 | 66         |
| CS-4      | 1                            | 2018-01-15 | 55         |

### Teacher

| Teacher ID | Family name | Given name | Room |
| ---------- | ----------- | ---------- | ---- |
| 22         | Paisley     | Brad       | 202  |
| 33         | Stevens     | Steve      | 205  |
| 44         | King        | Freddie    | 101  |
| 55         | Green       | Peter      | 101  |
| 66         | Collins     | Albert     | 201  |

### Student

| Student ID | Family name | Given name |
| ---------- | ----------- | ---------- |
| 110        | Pass        | Joe        |
| 120        | May         | Brian      |
| 130        | Zappa       | Frank      |
| 140        | Santana     | Carlos     |
| 150        | Sheeran     | Ed         |
| 160        | Townsend    | Pete       |

### Course grade

| Course ID | Course implementation number | Student ID | Grade |
| --------- | ---------------------------- | ---------- | ----- |
| CS-3      | 1                            | 110        | 3     |
| CS-4      | 1                            | 150        | 4     |
| CS-2      | 1                            | 150        | 2     |
| CS-2      | 2                            | 130        | 5     |
| CS-3      | 2                            | 120        | 4     |
| CS-3      | 1                            | 150        | 3     |
| CS-4      | 1                            | 130        | 5     |
| CS-2      | 2                            | 110        | 3     |

### Questions

Answer the following questions based on the database's data:

1. What are the names of the teachers who have taught on the course 'Databases'?
2. What are the names of the students who have got a grade from the course 'Databases'?
3. What are the names of the courses Joe Pass has completed successfully?
4. What are names of the teachers who have taught Frank Zappa?
5. How many students have grades from courses given by Albert Collins?
6. What are the names of the students that have been taught by the teachers whose room number is 101?
7. What are the names of the teachers who haven't given any course yet?

## Task 2: Problems of the file-based data management approach

> [!NOTE]
> The following representation of a file here is a simplification; logically, a file consists of a group of sequential slots. All the slots are of the same size and they are not typed. That is, they can contain any type of data; a single number or a single character.

An election is being held and the Database Developer decided to store the information on canditates and their votes in two seperate files with specific formats.

The following data per each candidate is saved in the _candidate file_:

- Candidate name: 5 slots
- Candidate number: 1 slot

The following data per each candidate is saved in the _election file_:

- Number of votes: 1 slot
- Candidate age: 1 slot
- Candidate number: 1 slot

The whole content of the _candidate file_ is as follows:

| F   | r   | a   | n   | k   | 28  | E   | l   | v   | i   | s   | 27  | S   | u   | s   | a   | n   | 29  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

The whole content of the _election file_ is as follows:

| 27  | 30  | 28  | 29  | 28  | 27  | 28  | 31  | 29  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

### Questions

#### Part A

Does the candidate file contain _data_ or _metadata_?

#### Part B

What is the name of the candidate who won the election?

#### Part C

A Software Developer wrote a program that should display the name of the candidate who won the election. Unfortunately, the Software Developer made a mistake and the program thinks that the following data per each candidate is saved in the election file:

- Candidate number: 1 slot
- Number of votes: 1 slot
- Candidate age: 1 slot

The candidate file is as before. What is the candidate name the program displays now?

#### Part D

Another program has updated the original election file The new content of the election file is as below. The candidate file is as before.

| 27  | 30  | 28  | 29  | 28  | 30  | 27  | 28  | 29  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

- What can you say about the consistency of the data in this situation?
- How could we prevent this type of a problem? Think about a situation when a new entry (number of votes, candidate age, candidate number) is to be inserted into the election file.

## Task 3: Keys

In a table, the _primary key_ is a single column or a group of columns that uniquely identifies each row in the table.

- The database designer defines the primary key constraint in each table. The DBMS takes care of not allowing duplicate or missing primary key values (entity integrity).
- Only one primary key in a table is allowed. It can consist of more than one column.
- A primary key should not include columns beyond those required to ensure uniqueness.

In a table, a _foreign key_ is a column or group of columns that we use to link a row to another row.

- A foreign key is a column or group of columns, whose values are required to match those of the primary key of the referenced table.
- The database designer defines foreign key constraints. The DBMS takes care of not allowing invalid foreign key references (referential integrity).

For example, in the following `Degree Program` table, the `program code` column uniquely identifies each row in the table. There aren't two rows with the same value for this column. This means that the `program code` is the table's _primary key_.

The `Degree Program` table:

| name                            | program code | start date |
| ------------------------------- | ------------ | ---------- |
| Business Information Technology | 🔑 BIT2011   | 2011-08-01 |
| Business Information Technology | 🔑 BIT2020   | 2020-08-01 |
| International Business          | 🔑 GLOBBA19  | 2019-01-01 |

In the following `Course` table, the `program code` column establishes a "link" to the the `Degree Program` table, specifying the degree of a course. For example, by following such link, we now that "Database Developer" course's program name is "Business Information Technolog". This means that `program code` is a _foreign key_ in the `Course` table, referencing the `Degree Program` table's primary key. The primary key of the `Course` table is `course code`.

The `Course` table:

| course code   | name                                | credits | program code |
| ------------- | ----------------------------------- | ------- | ------------ |
| 🔑 ITP4TF150  | Database Developer                  | 6       | 🔗 BIT2011   |
| 🔑 SWD4TF003  | Databases and Data Management       | 5       | 🔗 BIT2020   |
| 🔑 SWD1TF001  | Orientation to Software Engineering | 5       | 🔗 BIT2020   |
| 🔑 ECO1LF001A | Principles of Economics             | 3       | 🔗 GLOBBA19  |

### Questions

Look at the University Database example in the task 1 and determine the primary key and foreign keys per each table.

> [!IMPORTANT]
> In this example, some tables have 2 foreign keys. Some tables have one foreign key. Some tables have no foreign key.

> [!NOTE]
> A student is NOT allowed to have two course grades from the same course. For example, if a student retakes the course CS-1, then their previous course grade from the course CS-1 is removed before a new course grade is inserted into the database.

Fill in the primary keys and foreign keys in a table such as the following:

| Table                 | Primary key | Foreign keys |
| --------------------- | ----------- | ------------ |
| Course                |             |              |
| Teacher               |             |              |
| Student               |             |              |
| Course grade          |             |              |
| Course implementation |             |              |

In the "Primary key" column, write the name of the column (orgroup of column names) that uniquely identifies each row in the table.

In the "Foreign key" column, wirte name of the column (or group of column names) that links a row in this table to a row in another table. Mention also the name of the referenced table. NB! There are also tables without any foreign key
