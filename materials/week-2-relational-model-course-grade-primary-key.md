# Analysis of the primary key for the CourseGrade relation

Suppose that the following tuple already exists:

| studentNumber | courseCode | courseOfferingNumber | grade |
| ------------- | ---------- | -------------------- | ----- |
| 100           | swd4tf003  | 1                    | 4     |

The correct primary key `(studentNumber, courseCode)` allows us to add at
most one course grade for each student for each course. For example, it does
not accept the following new tuple to be added: `(100, swd4tf003, 2, 5)`.

Some examples of incorrect primary keys for the CourseGrade relation and their limitations:

| Primary key candidate                               | Limitations                                                                                                                                |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `studentNumber`                                     | Limits the number of course grades per student to one                                                                                      |
| `courseCode`                                        | Limits the number of course grades per course to one                                                                                       |
| `(studentNumber, grade)`                            | Limits the number of grade marks per student. If the student has got grade 4 from one course, they cannot get grade 4 from any other course |
| `(studentNumber, courseCode, courseOfferingNumber)` | Allows a student to have more than one grade per course                                                                                    |
