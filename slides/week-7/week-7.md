# Inner and outer joins

- During this week we will learn:
  - What are join clauses and what kind of query problems can they solve
  - How to use the `INNER JOIN` and `OUTER JOIN` clauses to perform different kind of joins

---

# Join clauses

- Instead of combining rows, like set operators, a _join clause_ combines _columns_ from one or more tables into a new table
- In the relational model we a have foreign key in table referencing primary key in another table
- A common query problem is to combine columns from the primary key table with the columns of the foreign key table
- For example, _what is the name of each course instance teacher?_

---

# Join clauses

- With a `SELECT` stament we get the `teacher_number` foreign key column value:

```sql
-- what is the teacher number of each course instance teacher?
SELECT course_code, instance_number, teacher_number
FROM CourseInstance
```

| course_code | instance_number | teacher_number |
| ----------- | --------------- | -------------- |
| a290        | 1               | h430           |
| ...         | ...             | ...            |

---

# Join clauses

- We can use the `INNER JOIN` clause to combine the matching columns from the `Teacher` table:

```sql
-- what is the first name and surname of each course instance teacher?
SELECT
CourseInstance.course_code, CourseInstance.instance_number, Teacher.first_name, Teacher.surname
FROM CourseInstance
INNER JOIN Teacher ON CourseInstance.teacher_number = Teacher.teacher_number
```

| course_code | instance_number | first_name | surname |
| ----------- | --------------- | ---------- | ------- |
| a290        | 1               | Emma       | Virta   |
| ...         | ...             | ...        | ...     |

---

# Join clauses

- In the example each row of the `CourseInstance` table is combined with a row from the `Teacher` table based on the _join condition_:

```sql
-- the teacher_number of column in the CourseIntance table
-- must match the teacher_number column of the Teacher table
INNER JOIN Teacher ON CourseInstance.teacher_number = Teacher.teacher_number
```

- The join condition _doesn't_ have to compare primary key to a foreign key, any kind of condition can be used

---

# Join clauses

- With join clauses, it is a good idea to specify the table name before the column name to avoid _ambiguous column names_:

```sql
-- ❌ teacher_number column name is ambiguous because
-- both CourseInstance and Teacher table have the teacher_number column
SELECT teacher_number
FROM CourseInstance
INNER JOIN Teacher ON CourseInstance.teacher_number = Teacher.teacher_number
```

```sql
-- ✅ we specify that the teacher_number column
-- of the CourseInstance table should be selected
SELECT CourseInstance.teacher_number
FROM CourseInstance
INNER JOIN Teacher ON CourseInstance.teacher_number = Teacher.teacher_number
```

---

# INNER JOIN clause

---

# OUTER JOIN clause

---

# Summary
