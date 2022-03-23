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