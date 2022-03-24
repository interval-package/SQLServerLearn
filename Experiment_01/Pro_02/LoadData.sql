use ClassLearnBase


Insert into Student
select document.* from 
openrowset(BULK N'D:\Coding\SQLProjects\Homework\Experiment_01\Pro_02\Student_Data.txt') as document

select * from Student

--,single_blob

-- ,firstrow=2
-- ,formatfile=N'c:\players.fmt'


alter table Student
alter column sex char(5)

create table tempTable
(
info varchar(50)
)

------------------------------------------------------------
BULK   Insert   tempTable
FROM   'D:\Coding\SQLProjects\Homework\Experiment_01\Pro_02\Student_Data.txt'  
WITH   (  
	ROWTERMINATOR='\n',
	fieldterminator=',',
	codepage = '65001'
) ;

--	fieldterminator=','
------------------------------------------------------------

select * from temp
drop table tempTable


BEGIN TRANSACTION;

INSERT INTO Score
SELECT column1, cast(column2 as varchar)+cast(column3 as varchar), column4
FROM temp

drop table temp
-- DELETE FROM temp

COMMIT

--------------------------------------------------
insert into RentHis
select * from temp
drop table temp

-----------------------------------------------

select * from Course
select * from Teacher
select * from Student
select * from Score

drop table Course

drop table score

-------------------------------------------------------
truncate table Course

insert into Course
values
('3-105',	'计算机导论',	825),
('3-245',	'操作系统',	804),
('6-166', '数字电路',	856),
('9-888',	'高等数学',	825)

alter table Score
alter column degree int;
