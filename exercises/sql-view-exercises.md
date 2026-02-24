# SQL View Exercises

> [!IMPORTANT]
> Please submit this exercise as a `view_exercises_YOURFAMILYNAME.sql` file to Moodle.

The objective of this exericse is to familiarize yourself with the basics of SQL views. Use this week's lesson slides as materials.

## Task 1

> [!TIP]
> This week's lesson slides have useful examples for SQL views.

1. Create a view called `PublicTeacherInfo` for the `Teacher` table.
    - In the view, include all the other columns but not phone number and email.
2. Write a query that displays all rows (and all columns) from the view `PublicTeacherInfo`.
3. Write a query that lists all teachers (surname, first name, teacher number, campus name).
    - Sort the result by surname, first name, teacher number in ascending order.
    - Use the view `PublicTeacherInfo` instead of the table `Teacher` in your query. This query should display exactly as many rows as the previous query. Double-check this.
4. Add facts about a new teacher using the view `PublicTeacherInfo`.
    - The teacher number is h888, first name is John, surname is Doe, gender is male, birth date is 1980-05-06 and salary is 12000.
5. Display all rows from the view `PublicTeacherInfo`.
6. Display all rows from the table `Teacher`.
    - How do the results differ from each other?
7. Delete the teacher whose teacher number is h888 from the view `PublicTeacherInfo`.

## Task 2

1. Create a view called `MaleTeacher` that includes only male teachers.
    - In the view, include all the other columns but not phone number and email .
2. Write a query that displays all rows (and all columns) from the view `MaleTeacher`.
3. Add facts about a new teacher using the `MaleTeacher` view.
    - The teacher number is h800, first name is Susan, surname is Smith, gender is female, birth date is 1980-05-06 and salary is 12000.
4. Execute the query that displays all rows (and all columns) from the view `MaleTeacher`.
    - Do you see a row where teacher number is h800? Why?
5. Select all rows from the table `Teacher`.
    - If you see a row where teacher number is h800, then delete the row.
6. First, drop the view `MaleTeacher`. Then, modify the `CREATE VIEW` statement for the view so that it does not allow female teachers to be added. Finally, create the new version of the view.
7. Test the new version of the view `MaleTeacher` by trying to insert a new row with the following facts (the view should not allow this insert to succeed):
    - The teacher number is h800, first name is Susan, surname is Smith, gender is female, birth date is 1980-05-06 and salary is 12000.
    - If the insert operation succeeds, then repeat steps 5 - 7 until the view works as required.

## Task 3

1. Create a view called `TeacherCampus` for the `Teacher` table. The view contains teacher number, surname, first name and campus name.
2. Write a query that lists all rows from the `Teacher` table.
3. Write a query that displays all rows (and all columns) from the view `TeacherCampus`.
    - Sort the result by surname, first name, teacher number in ascending order.
    - This query should display exactly as many rows as the previous query. Double-check this.

## Task 4

1. Create a view called `StudentGPA`. The view contains student number, first name, surname and the student's average course grade (the correct average with 2 decimal places).
2. Write a query that shows the average course grade for the student whose student number is o410.
    - Use the view `StudentGPA` in your query.