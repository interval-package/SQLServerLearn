# *【实验项目二】[SQL 语言与视图]*

## 1.create table

```sql
use ClassLearnBase

-- drop table Course_info_table, Student_info_table, Teacher_info_table

create table Student(
sno char(8) primary key,
sname char(25),
sex char(5),
birthday date,
class char(20)
)

create table Teacher(
tno char(16) primary key,
tname char(25),
sex char(5),
birthday date,
prof char(50),
depart char(50)
)

create table Course(
cno char(12) primary key,
cname char(25),
tno char(16) foreign key references Teacher(tno)
)

create table Score(
sno char(8) foreign key references Student(sno),
cno char(12) foreign key references Course(cno),
degree tinyint,
primary key (sno, cno)
)

select * from Student
select * from Teacher
```

## 2.questions

### (1) basic ques

##### 1、列出student表中所有记录的sname、sex和class列。答案

`select sname, sex, class from Student;`

##### 2、显示教师所有的单位即不重复的depart列。

`select distinct depart from Teacher;`

##### 3、显示学生表的所有记录。

`select * from Student;`

##### 4、显示score表中成绩在60到80之间的所有记录。

select * from Score
where degree between 60 and 80

##### 5、显示score表中成绩为85，86或88的记录。

select * from Score
where degree in (85,86,88)

##### 6、显示student表中“95031”班或性别为“女”的同学记录。

select * from Student
where class = 95031 or sex = '女'

##### 7、以class降序显示student表的所有记录。

select * from Student
order by class desc

##### 8、以cno升序、degree降序显示score表的所有记录。

select * from Score
order by cno asc, degree desc

##### 9、显示“98031”班的学生人数。

select count(*) as classNum from Student
where class = 95031

##### 10、显示score表中的最高分的学生学号和课程号。

select sno, cno from Score
where degree = max(degree)

##### 11、显示“3-105”号课程的平均分。

select AVG(degree) from Score
where cno = 3-105

##### 12、显示score表中至少有5名学生选修的并以3开头的课程号的平均分数。

select AVG(degree) from Score
where cno like '3%'
group by cno
having count(cno)>=5

##### 13、显示最低分大于70，最高分小于90 的sno列。

select sno from Score
group by sno
having max(degree)<90 and min(degree)>70

##### 14、显示所有学生的 sname、 cno和degree列。

select st.sname, sc.cno, sc.degree
from Student as st, Score as sc
where st.sno = sc.sno

##### 15、显示所有学生的 sname、 cname和degree列。

select st.sname, cs.cname, sc.degree
from Student as st, Score as sc, Course as cs
where st.sno = sc.sno and cs.cno = sc.cno

##### 16、列出“95033”班所选课程的平均分。

select cno, avg(degree) as average from
(
select Score.cno, Score.degree 
from Student, Score
where Student.sno = Score.sno and class = 95033
) 
as temp
group by cno

##### 17、显示选修“3-105”课程的成绩高于“109”号同学成绩的所有同学的记录。

###### method 1

select temp.* from 
(
select Student.*, Score.degree from Student, Score
where Student.sno = Score.sno and Score.cno = '3-105'
) as temp,
(select degree from Score where sno = '109' and cno = '3-105') as tar
where temp.degree > tar.degree

###### method 2

-- 不可以有.degreee
select temp.* from 
(
select Student.*, Score.degree from Student, Score
where Student.sno = Score.sno and Score.cno = '3-105'
) as temp
where temp.degree > (select degree from Score where sno = '109' and cno = '3-105')--.degree

##### 18、显示score中选修多门课程的同学中分数为非最高分成绩的记录。

select Score.* from Score,
(
select sno, max(degree) as max_degree from Score
group by sno
having count(*)>1
) as temp
where (Score.sno = temp.sno and Score.degree<temp.max_degree)

##### 19、显示成绩高于学号为“109”、课程号为“3-105”的成绩的所有记录。

same as the 17

##### 20、显示出和学号为“108”的同学同年出生的所有学生的sno、sname和 birthday列。

select sno, sname, birthday from Student,
(select year(birthday) as y from Student
where sno = '108') as tar
where
year(birthday) = tar.y
and sno != 108

##### 21、显示“张旭”老师任课的学生成绩。

select sc.sno, sc.degree from Score as sc, 
(
select cno from Course, Teacher
where Teacher.tname = '张旭'
and Teacher.tno = Course.tno
) as th
where sc.cno = th.cno

##### 22、显示选修某课程的同学人数多于5人的老师姓名。

select tname from Teacher
where
Teacher.tno in
(select Course.tno from Score, Course
where Score.cno = Course.cno
group by Course.tno,Course.cno
having count(*)>5)

##### 23、显示“95033”班和“95031”班全体学生的记录。

select * from Student
where class in (95033, 95031)

##### 24、显示存在有85分以上成绩的课程cno。

select distinct cno from Score
where Score.degree>85

##### 25、显示“计算机系”老师所教课程的成绩表。

select Course.cname, Course.cno from Course, Teacher
where Teacher.depart = '计算机系' and Teacher.tno = Course.tno

##### 26、显示“计算机系”和“电子工程系”不同职称的老师的tname和prof。

select tname, prof from Teacher
where depart in ('计算机系','电子工程系')

##### 27、显示选修编号为“3-105”课程且成绩至少高于“3-245”课程的同学的cno、sno和degree，并按degree从高到低次序排列。

select cno, sno, degree from Score
where cno = 3-105 and degree>
(
select min(degree) from Score where cno = 3-245
)
order by degree desc

##### 28、显示选修编号为“3-105”课程且成绩高于“3-245”课程的同学的cno、sno和degree。

select cno, sno, degree from Score
where cno = 3-105 and degree>
(
select max(degree) from Score where cno = 3-245
)

##### 29、列出所有任课老师的tname和depart。

select distinct tname, depart from Teacher, Course
where Teacher.tno = Course.tno

##### 30、列出所有未讲课老师的tname和depart。

select tname, depart from Teacher
where tno not in (select tno from Course)

##### 31、列出所有老师和同学的 姓名、性别和生日。

select temp.*
from (select sname name_, sex, birthday from Student union all
      select tname, sex, birthday from Teacher
     ) temp; 

### (2) more ques

##### *32、检索所学课程包含学生“103”所学课程的学生学号。

select sno from Score
where cno in (select distinct cno from Score where sno = 103)

##### *33、检索选修所有课程的学生姓名。

select sname from Student
where sno in 
(
select sno from Score
group by sno
having count(*)>(select count(*) from Course)
)

### (3) caution tips

#### 1. the sub select could not appear in the where plus compare period

就是说，对于子查询，要在from的时候就做了，如果对于where里面的子查询，只能做in这样子的操作，对于数据的比较，已经过阶段了

#### 2. to import data