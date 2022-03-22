use ClassLearnBase
use master

drop table UserInfo

-- drop table UserInfo;

-- firstly create table
create table UserInfo(
CardId char(9) primary key,
StuName char(16),
Gender char(5) constraint GenderEnum check(Gender in ('男', '女')) default NULL,
-- constraint 后面不加括号，但是check后面要
Birthday Date,
BorrowVolume tinyint default 0,
Major char(32),
tel char(16),
e_mail char(64),
)
go

-- alter table basic info
alter table UserInfo
alter column Gender char(5);
go

-- insert data
insert into UserInfo
values
(29307142,'张晓露','女',cast('1989-02-1' as date),2,'管理信息系',85860126,'zxl@163.com')
;
go

--没有安装驱动
--SELECT * INTO Your_Table FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
--                        'Excel 12.0;Database=D:\Coding\SQLProjects\Homework\Experiment_01\data.xlsx',
--                        'SELECT * FROM [Data$]')

-- It's a stupid way to load data via script, you should load it through excel or csv

-- delete all the data in the table
delete from ClassLearnBase.dbo.UserInfo;
go

-- disp table info
select * from UserInfo
go;

select id=CardId, StuName 姓名, Birthday as 生日 from UserInfo

select * from UserInfo
where StuName not like '张%';

select * from LendingInfo;

select * from LendingInfo
where 借书证号 like '[2,3]%';
-- 多模式匹配下的筛选

