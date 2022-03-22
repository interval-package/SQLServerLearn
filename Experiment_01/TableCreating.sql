use ClassLearnBase
use master

drop table UserInfo

-- drop table UserInfo;

-- firstly create table
create table UserInfo(
CardId char(9) primary key,
StuName char(16),
Gender char(5) constraint GenderEnum check(Gender in ('��', 'Ů')) default NULL,
-- constraint ���治�����ţ�����check����Ҫ
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
(29307142,'����¶','Ů',cast('1989-02-1' as date),2,'������Ϣϵ',85860126,'zxl@163.com')
;
go

--û�а�װ����
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

select id=CardId, StuName ����, Birthday as ���� from UserInfo

select * from UserInfo
where StuName not like '��%';

select * from LendingInfo;

select * from LendingInfo
where ����֤�� like '[2,3]%';
-- ��ģʽƥ���µ�ɸѡ

