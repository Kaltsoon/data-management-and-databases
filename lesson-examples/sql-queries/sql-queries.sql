-- List all the course instances (start date, end date, course code, instance number)
-- that have started and ended in 2007. 
-- Sort the result by (start date, end date, course code, instance number) in ascending order.

-- List all the students (gender, birth date, surname, first name)
-- whose surname starts with the letter L or K.
-- Sort the results in descending order by birth date.

-- List all the students (gender, birth date, surname, first name) whose surname is in the range of (A-K).
-- Display girls after all boys in the list. Boys should be listed in ascending order by birth date.
SELECT gender, birth_date, surname, first_name FROM Student
WHERE surname >= 'A' AND surname < 'L'
ORDER BY gender

-- List all course instances (course code, instance number, start date) without a teacher.
-- Sort the the results by course code in ascending order.