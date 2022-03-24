use ClassLearnBase

select sname, sex, class from Student;

select distinct depart from Teacher;

select * from Student;

select * from Score
where degree between 60 and 80

select * from Score
where degree in (85,86,88)

select * from Student
where class = 95031 or sex = '女'

select * from Student
order by class desc

select * from Score
order by cno asc, degree desc

select count(*) as classNum from Student
where class = 95031

select sno, cno from Score
where degree = max(degree)

select AVG(degree) from Score
where cno = '3-105'

select AVG(degree) from Score
where cno like '3%'
group by cno
having count(cno)>=5

-- 13
select sno from Score
group by sno
having max(degree)<90 and min(degree)>70

-- 14
select st.sname, sc.cno, sc.degree
from Student as st, Score as sc
where st.sno = sc.sno

-- 15
select st.sname, cs.cname, sc.degree
from Student as st, Score as sc, Course as cs
where st.sno = sc.sno and cs.cno = sc.cno

-- 16
select cno, avg(degree) as average from
(
select Score.cno, Score.degree 
from Student, Score
where Student.sno = Score.sno and class = 95033
) as temp
group by cno

-- 17 need certification
select temp.* from 
(
select Student.*, Score.degree from Student, Score
where Student.sno = Score.sno and Score.cno = '3-105'
) as temp,
(select degree from Score where sno = '109' and cno = '3-105') as tar
where temp.degree > tar.degree

-- 不可以有.degreee
select temp.* from 
(
select Student.*, Score.degree from Student, Score
where Student.sno = Score.sno and Score.cno = '3-105'
) as temp
where temp.degree > (select degree from Score where sno = '109' and cno = '3-105')--.degree

-- 18
select Score.* from Score,
(
select sno, max(degree) as max_degree from Score
group by sno
having count(*)>1
) as temp
where (Score.sno = temp.sno and Score.degree<temp.max_degree)

Select sc_1.* from score sc_1, score sc_2
where sc_1.sno = sc_2.sno and sc_1.degree < sc_2.degree

-- 19 is same as the 17

-- 20
select sno, sname, birthday from Student,
(select year(birthday) as y from Student
where sno = '108') as tar
where
year(birthday) = tar.y
and sno != 108

-- 21 there is no teacher called zx
select sc.sno, sc.degree from Score as sc, 
(
select cno from Course, Teacher
where Teacher.tname = '张旭'
and Teacher.tno = Course.tno
) as th
where sc.cno = th.cno

-- 22
-- teacher with a course more than 5 stu
select tname from Teacher
where
Teacher.tno in
(select Course.tno from Score, Course
where Score.cno = Course.cno
group by Course.tno,Course.cno
having count(*)>5)

-- 23
select * from Student
where class in (95033, 95031)

-- 24
select distinct cno from Score
where Score.degree>85

-- 25
select Course.cname, Course.cno from Course, Teacher
where Teacher.depart = '计算机系' and Teacher.tno = Course.tno

-- 26
select tname, prof from Teacher
where depart in ('计算机系','电子工程系')

-- 27
select cno, sno, degree from Score
where cno = 3-105 and degree>
(
select min(degree) from Score where cno = 3-245
)
order by degree desc

-- 28

select cno, sno, degree from Score
where cno = 3-105 and degree>
(
select max(degree) from Score where cno = 3-245
)

-- 29

select distinct tname, depart from Teacher, Course
where Teacher.tno = Course.tno

-- 30

select tname, depart from Teacher
where tno not in (select tno from Course)

-- 31

select temp.*
from (select sname name_, sex, birthday from Student union all
      select tname, sex, birthday from Teacher
     ) temp;

-- 32

select sno from Score
where cno in (select distinct cno from Score where sno = 103)

-- 33

select sname from Student
where sno in 
(
select sno from Score
group by sno
having count(*)=(select count(*) from Course)
)

-- 不是很好的方法
select sname from Student
where not exists
(
select * from Course where not exists 
	(
	select * from Score where sno = Student.sno and Cno = Course.cno
	)
)

-- more
