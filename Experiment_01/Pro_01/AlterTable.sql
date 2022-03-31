use ClassLearnBase

--添加列
alter table Worker
add Worker_UnUsedInfo char

--修改列的数据类型
alter table Worker
alter column Worker_UnUsedInfo int

-- 删除列的时候要特指是列，不加特指的话默认删除的是约束关系
alter table Worker
drop column Worker_UnUsedInfo


--添加列
alter table UserInfo
alter column CardId char(9);

-------------------------------------------------------------------------------------------------------------



-- 对书本建立索引
create index id_of_book on BookInfo(BookId)
-- 删除索引，这是sql server的语法
drop index BookInfo.id_of_book


-- sql server 没有rename关键字
-- alter index id_of_book rename to new_id_of_book


-------------------------------------------------------------------------------------------------------------


--修改表的模式
alter schema dbo 
transfer pro_1.RentHis_Detail

-- UserInfo, BookInfo, BookType, RentHis, Worker, RentHis_Detail


-------------------------------------------------------------------------------------------------------------


--添加外键约束
alter table RentHis
add foreign key(BookId) references BookInfo(BookId)


-------------------------------------------------------------------------------------------------------------


--修改表内数据
UPDATE RentHis SET BookId='00000476' WHERE CardId = 36405216 and WorkerId = 2016 ;


-------------------------------------------------------------------------------------------------------------

ALTER TABLE RentHis ADD CONSTRAINT RentOrReturn check(ChangeType in ('借', '还'));
alter table RentHis add DEFAULT null for ReturnDate;


-------------------------------------------------------------------------------------------------------------

--添加默认值约束
alter table BookInfo
add constraint DF_BOOKINFO_PURCHASETIME default getdate() for Purchase_Date;

alter table BookInfo
drop constraint DF_BOOKINFO_PURCHASETIME;

--删除默认值约束
--declare @constraintName varchar(200)
--select @constraintName = b.name from syscolumns a,sysobjects b where a.id=object_id('TB_KYSubProject') 
--and b.id=a.cdefault and a.name='Final_Belong_Programme' and b.name like 'DF%'
--SELECT @constraintName
--exec('alter table TB_KYSubProject drop constraint '+@constraintName)


-------------------------------------------------------------------------------------------------------------
--添加主键约束
alter table RentHis
--alter column BookId char(9) not null
--alter column CardId char(9) not null
alter column ChangeType char(5) not null

alter table RentHis
add constraint PK_RentHis primary key(BookId,CardId,ChangeType)

alter table RentHis
drop PK_RentHis

select * from RentHis

-------------------------------------------------------------------------------------------------------------
--唯一性约束

alter table UserInfo
add constraint UQ_Tel unique(tel)