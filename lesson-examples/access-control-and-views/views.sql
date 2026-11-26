-- Haaga-Helia's degree program directors need easy access to the average grade of courses
-- They want to be able to select course-specific average grade in the following way:
SELECT course_code, course_name, average_grade FROM CourseAnalytics
WHERE course_code = 'a290';

-- Implement the CourseAnalytics view that has this functionality
