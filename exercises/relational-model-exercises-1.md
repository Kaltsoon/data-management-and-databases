# Relational Model Exercises 1

> [!IMPORTANT]
> Write your answers to a Word document named `relational_model_1_YOURFAMILYNAME.docx` and submit the document to Moodle. Submissions can be found on Moodle's "Coursework submissions" page.

## Task 1

Read about the relational schemas in this week's lesson slides. Suppose that we defined some primary key constraints as below. Explain why each of these primary key constraints is problematic (you can consider Haaga-Helia UAS as the context).

1. <pre>Student (studentNumber, <ins>familyName, givenName</ins>, nationality, socialSecurityNumber)</pre>
2. <pre>Student (studentNumber, familyName, givenName, nationality, <ins>libraryCardNumber</ins>)</pre>
3. <pre>Course (<ins>courseCode</ins>, courseName, <ins>credits</ins>)</pre>
4. <pre>CourseOffering (<ins>courseCode</ins>, courseOfferingNumber, <ins>startDate</ins>, teacherNumber)</pre>

> [!TIP]
> Consider the most important criteria for a good primary key:
> - It should be unique.
> - It must be minimal: a primary key should contain no more attributes than necessary to uniquely identify each row (minimality).
> - Its value should not change.
> - It must have a value.

## Task 2

### Part A

There are curriculums and courses. Each course belongs to exactly one curriculum. Curriculum has a curriculum code, name, and start year. Course has a course code, name, and credits. 

Write a _relational schema_ (see example below) based on the information given above. Determine all primary key constraints and foreign key constraints. As a reference, here's an example of relational schema describing `Director` and `Movie` relations:

<pre>
Director (<ins>directorid</ins>, firstname, surname)
  
Movie (<ins>movieid</ins>, name, releaseYear, directorid)
  FOREIGN KEY (directorid) REFERENCES Director (directorid)
</pre>

> [!TIP]
> To establish the relationship between courses and curriculums, you'll need to add a foreign key attribute to one of the relations, but which one?

### Part B

Similar scenario as previously, but some courses belong to _more than one curriculum_.

> [!TIP]
> The previous week's "Introduction Exercises" assignment's final task has an example, in which a musician can belong to more than one band. You might need a similar structure here.

## Task 3

### Part A

Read about properties of relations in this week's lesson slides. Then explain what is incorrect in the relation schemas below.

<pre>
Country (<ins>countryCode</ins>, countryName )
Ship (<ins>shipNumber</ins>, shipName, countryCode, Cabins (cabinNumber, cabinType))
</pre>

### Part B

Derive correct relational schemas from the above. Determine all primary key constraints and foreign key constraints.

## Task 4

### Part A

Explain what is incorrect in the relation schemas below:

<pre>
Course (<ins>courseCode</ins>, courseName)
Exam (<ins>courseCode</ins>, Questions (questionNumber, questionText), examDate)
</pre>

> [!NOTE]
> Suppose that exam questions are never reused.

### Part B

Derive correct relation schemas from the above. Determine all primary key constraints and foreign key constraints.

## Task 5

Determine all primary key constraints and foreign key constraints for the relations below.

> [!TIP]
> Instead of paying attention on the column names, focus on the criteria of a primary key. It is also necessary to look at more than one relation when you are determining a primary key. _If there is a foreign key, it must match with a primary key_.

### Book

| ISBN      | bookName |
| --------- | -------- |
| 123-45-6  | C#       |
| 123-22-22 | Java     |

### Book_Author

| ISBN      | author |
| --------- | ------ |
| 123-45-6  | 1      |
| 123-22-22 | 1      |
| 123-22-22 | 2      |

### Copy

| id  | ISBN      | library |
| --- | --------- | ------- |
| 1   | 123-45-6  | Pasila  |
| 2   | 123-45-6  | Haaga   |
| 3   | 123-22-22 | Pasila  |
| 2   | 123-22-22 | Pasila  |

### Author

| id  | familyName | givenName | number |
| --- | ---------- | --------- | ------ |
| 1   | Välimäki   | Juhani    | 2      |
| 2   | Silpiö     | Kari      | 1      |
| 1   | Kuitunen   | Markku    | 7      |

## Task 6

Explain what is problematic in the following relation schema:

<pre>
Participant (familyName, givenName, birthdate, age)
</pre>

---

> [!IMPORTANT]
> The next task is optional.

## ⭐ Bonus task 7

See the "Choosing the primary key example" link in the Moodle's "Course outline" page. It covers four incorrect primary key constraints for the `CourseGrade` relation. Figure out three more examples of incorrect primary key constraints for the `CourseGrade` relation and explain them in the same way as the first four incorrect primary key constraints are explained.
