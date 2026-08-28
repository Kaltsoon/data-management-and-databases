-- Result table example
SELECT teacher_number, first_name, surname, phone
FROM Teacher

-- INSERT statement example
INSERT INTO Campus (campus_code, campus_name) VALUES ('c555', 'Tampere')

SELECT campus_code, campus_name FROM Campus

-- INSERT statement with invalid data example
INSERT INTO Campus (campus_code) VALUES ('c666')

SELECT campus_code, campus_name FROM Campus

-- SELECT statement example
SELECT course_code, course_name, credits
FROM Course
WHERE credits > 3