# Analysis of the primary key for the CourseGrade relation

In this example, we analyze the possible primary key for a CourseGrade relation. This example demonstrates how choosing the wrong primary key for the relation can introduce limitations.

Suppose that the following tuple already exists:

| studentNumber | courseCode | courseOfferingNumber | grade |
| ------------- | ---------- | -------------------- | ----- |
| 100           | swd4tf003  | 1                    | 4     |

The correct primary key `(studentNumber, courseCode)` allows us to add at
most one course grade for each student for each course. For example, it does
not accept the following new tuple to be added: `(100, swd4tf003, 2, 5)`, because the student with student number `100` already has a grade from the course `swd4tf003` as mentioned above.

Some examples of incorrect primary keys for the CourseGrade relation and their limitations:

| Primary key candidate                               | Limitations                                                                                                                                |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `studentNumber`                                     | Limits the number of course grades per student to one                                                                                      |
| `courseCode`                                        | Limits the number of course grades per course to one                                                                                       |
| `(studentNumber, grade)`                            | Limits the number of grade marks per student. If the student has got grade 4 from one course, they cannot get grade 4 from any other course |
| `(studentNumber, courseCode, courseOfferingNumber)` | Allows a student to have more than one grade per course                                                                                    |
