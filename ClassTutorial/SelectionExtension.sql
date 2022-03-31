use OnClass

select * from student

select top 3 * from sc
order by grade desc

select top 3 with ties * from sc
order by grade desc

select top 3 percent with ties * from sc
order by grade desc

select * from sc

select top 3 with ties student.*, sc.grade,course.cname 
from sc,course,student
where course.cno = sc.cno and course.cname = '���ݿ�ԭ��'
and student.sno = sc.sno
order by sc.grade desc

select top 3 with ties student.*, sc.grade,course.cname from 
student join sc on student.sno = sc.sno
	join course on sc.cno = course.cno and cname = '���ݿ�ԭ��'
	order by sc.grade desc

select * into ##temp
from student
where sdept = '���ϵ'

select * from ##temp
drop table ##temp
