-- create schema pro_2

--alter schema pro_2
--transfer Score
-- Student, Teacher, Course, Score

-- drop schema pro_2


SELECT * FROM all_constraints 
WHERE Table_Name = Student;


SELECT constraint_name, 
       constraint_type,
       search_condition
  FROM USER_CONSTRAINTS
 WHERE table_name = 'STUDENTS';

SELECT * FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT'