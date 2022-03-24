--create schema pro_1;

--drop schema pro_1

--select * from RentHis

use ClassLearnBase

drop table temp

--insert into RentHis
select * from RentHis
--drop table temp

alter table RentHis
add foreign key(BookId) references BookInfo(BookId)

select * from BookInfo

select * from RentHis
where BookId not in (select BookId from BookInfo)


UPDATE RentHis SET BookId='00000476' WHERE CardId = 36405216 and WorkerId = 2016 ;
