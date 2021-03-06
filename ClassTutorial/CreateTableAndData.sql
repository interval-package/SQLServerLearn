use OnClass

create table student
(
sno char(7) primary key, --主码
sname char(10) not null,
ssex char(2),
sage smallint,
sdept varchar(20),
birthday datetime 
)
go


create table course
(
cno char(10) not null,
cname char(20) not null,
credit smallint,
semester smallint,
primary key(cno))
go

create table sc
(
sno char(7) not null,
cno char(10) not null,
grade smallint,
primary key(sno,cno),
foreign key(sno) references student(sno),
foreign key(cno) references course(cno)
)
go


insert into student values('100','张三','男',18,'审计系','87/09/01');
insert into student values('101','李四','男',19,'会计系','87/09/01');
insert into student values('102','王五','男',19,'计算机系','97/09/01');
insert into student values('103','张建国','男',19,'会计系','87/09/01');
insert into student values('104','周爱国','男',39,'会计系','87/09/01');
insert into student values('105','李世民','男',49,'会计系','97/09/01');
insert into student values('106','刘邦','男',29,'会计系','89/09/01');
insert into student values('107','高起','男',29,'会计系','83/09/01');
insert into student values('108','李雄','男',19,'会计系','84/09/01');
insert into student values('109','刘杰','男',9,'会计系','82/09/01');
insert into student values('110','张万','男',61,'会计系','83/09/01');
go

insert into course values('001','数据库原理',3,4);
insert into course values('002','计算机组成原理',3,4);
insert into course values('003','高等算法分析',3,4);
insert into course values('004','数据挖掘',3,4);
insert into course values('005','会计管理',3,4);
insert into course values('006','金融分析',3,4);
insert into course values('007','审计系统',3,4);
go
insert into sc values('101','001',90);
insert into sc values('101','002',96);
insert into sc values('101','003',89);
insert into sc values('101','004',87);
insert into sc values('101','005',67);
insert into sc values('101','006',53);
insert into sc values('101','007',79);

insert into sc values('102','001',90);
insert into sc values('102','002',96);
insert into sc values('102','003',89);
insert into sc values('102','004',87);
insert into sc values('102','005',97);
insert into sc values('102','006',93);
insert into sc values('102','007',99);


insert into sc values('103','001',90);
insert into sc values('103','002',66);
insert into sc values('103','003',79);
insert into sc values('103','004',88);
insert into sc values('103','005',97);
insert into sc values('103','006',95);
insert into sc values('103','007',89);


insert into sc values('104','001',90);
insert into sc values('104','002',66);
insert into sc values('104','003',79);
insert into sc values('104','004',88);
insert into sc values('104','005',97);
insert into sc values('104','006',95);
insert into sc values('104','007',89);


insert into sc values('105','001',90);
insert into sc values('105','002',66);
insert into sc values('105','003',79);
insert into sc values('105','004',88);
insert into sc values('105','005',97);
insert into sc values('105','006',95);
insert into sc values('105','007',89);
go
insert into student values
('111','欧阳风','女',17,'音乐系','98/08/09')
go


select sname 姓名,'出生年月' 
出生年月,year(getdate())-sage,lower(sname)
 from student
