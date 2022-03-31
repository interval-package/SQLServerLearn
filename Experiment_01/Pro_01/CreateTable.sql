use ClassLearnBase

-- firstly create table
create table UserInfo(
	CardId char(9) primary key,
	StuName char(16),
	Gender char(5) constraint GenderEnum check(Gender in ('男', '女')) default NULL,
	-- 约束方法1：直接在Gender后面加上约束条件，使用constraint
	-- constraint 后面不加括号，但是check后面要
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

ALTER TABLE RentHis ADD CONSTRAINT RentOrReturn check(ChangeType in ('借', '还'));
alter table RentHis add DEFAULT null for ReturnDate;


-- 在声明后进行约束的添加

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
	-- 在定义的末尾进行约束的添加
	constraint WorkerGender check(Gender in ('男', '女')),
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
(29307142,07108667,'还'	,cast('2008-03-28' as date),cast('2008-04-14' as date),1,002016),
(29307142,99011818,'借','2008-04-27',null,1,002016),
(36405216,07410802,'借','2008-04-27'	,null,1,002018)