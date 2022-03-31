use ClassLearnBase

-- firstly create table
create table UserInfo(
	CardId char(9) primary key,
	StuName char(16),
	Gender char(5) constraint GenderEnum check(Gender in ('��', 'Ů')) default NULL,
	-- Լ������1��ֱ����Gender�������Լ��������ʹ��constraint
	-- constraint ���治�����ţ�����check����Ҫ
	Birthday Date,
	BorrowVolume tinyint default 0,
	WorkUnit char(32),
	tel char(16),
	e_mail char(64),
)
go

create table RentHis(
	CardId char(9) foreign key references UserInfo(CardId),
	BookId char(9) foreign key references BookInfo(BookId),
	ChangeType Char(5) not null,
	RentDate date,
	ReturnDate date,
	RentCount int,
	WorkerId char(9) foreign key references Worker(WorkerId),
);

ALTER TABLE RentHis ADD CONSTRAINT RentOrReturn check(ChangeType in ('��', '��'));
alter table RentHis add DEFAULT null for ReturnDate;


-- �����������Լ�������

create table BookType(
	TypeId char(9) primary key,
	TypeName char(20),
);

create table Worker(
	WorkerId char(9) primary key,
	WorkerName char(25),
	Gender char(5) default NULL,
	Birthday Date,
	tel char(16),
	e_mail char(64),
	-- �ڶ����ĩβ����Լ�������
	constraint WorkerGender check(Gender in ('��', 'Ů')),
);

create table BookInfo(
	TypeId char(9) foreign key references BookType(TypeId),
	BookId char(9) primary key,
	BookName char(25),
	BookAuthor char(15),
	Publisher char(50),
	Price int,
	Purchase_Date Date,
	Purchase_Nums int,
	Copy_Counts int,
	Stock int,
);

insert into RentHis
values
(29307142,07108667,'��'	,cast('2008-03-28' as date),cast('2008-04-14' as date),1,002016),
(29307142,99011818,'��','2008-04-27',null,1,002016),
(36405216,07410802,'��','2008-04-27'	,null,1,002018)