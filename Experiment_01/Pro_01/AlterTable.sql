use ClassLearnBase

--�����
alter table Worker
add Worker_UnUsedInfo char

--�޸��е���������
alter table Worker
alter column Worker_UnUsedInfo int

-- ɾ���е�ʱ��Ҫ��ָ���У�������ָ�Ļ�Ĭ��ɾ������Լ����ϵ
alter table Worker
drop column Worker_UnUsedInfo


--�����
alter table UserInfo
alter column CardId char(9);

-------------------------------------------------------------------------------------------------------------



-- ���鱾��������
create index id_of_book on BookInfo(BookId)
-- ɾ������������sql server���﷨
drop index BookInfo.id_of_book


-- sql server û��rename�ؼ���
-- alter index id_of_book rename to new_id_of_book


-------------------------------------------------------------------------------------------------------------


--�޸ı��ģʽ
alter schema dbo 
transfer pro_1.RentHis_Detail

-- UserInfo, BookInfo, BookType, RentHis, Worker, RentHis_Detail


-------------------------------------------------------------------------------------------------------------


--������Լ��
alter table RentHis
add foreign key(BookId) references BookInfo(BookId)


-------------------------------------------------------------------------------------------------------------


--�޸ı�������
UPDATE RentHis SET BookId='00000476' WHERE CardId = 36405216 and WorkerId = 2016 ;


-------------------------------------------------------------------------------------------------------------

ALTER TABLE RentHis ADD CONSTRAINT RentOrReturn check(ChangeType in ('��', '��'));
alter table RentHis add DEFAULT null for ReturnDate;


-------------------------------------------------------------------------------------------------------------

--���Ĭ��ֵԼ��
alter table BookInfo
add constraint DF_BOOKINFO_PURCHASETIME default getdate() for Purchase_Date;

alter table BookInfo
drop constraint DF_BOOKINFO_PURCHASETIME;

--ɾ��Ĭ��ֵԼ��
--declare @constraintName varchar(200)
--select @constraintName = b.name from syscolumns a,sysobjects b where a.id=object_id('TB_KYSubProject') 
--and b.id=a.cdefault and a.name='Final_Belong_Programme' and b.name like 'DF%'
--SELECT @constraintName
--exec('alter table TB_KYSubProject drop constraint '+@constraintName)


-------------------------------------------------------------------------------------------------------------
--�������Լ��
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
--Ψһ��Լ��

alter table UserInfo
add constraint UQ_Tel unique(tel)