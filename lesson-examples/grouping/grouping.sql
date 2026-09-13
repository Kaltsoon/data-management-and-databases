-- What's the average grade from each course? Display course code and average grade
SELECT course_code, grade FROM CourseGrade
ORDER BY course_code

-- Which campuses have more than 1 teacher? Display campus code and number of teachers
SELECT teacher_number, campus_code FROM Teacher
ORDER BY campus_code

-- Which course instance has the most participants? 
-- Display course code, instance number and number of parcitipants

-- Which teachers teach the course "a450"? Display teacher number first name and surname