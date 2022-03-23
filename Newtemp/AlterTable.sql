use ClassLearnBase

alter table Worker
add Worker_UnUsedInfo char

-- 删除列的时候要特指是列，不加特指的话默认删除的是约束关系
alter table Worker
drop column Worker_UnUsedInfo

alter table Worker
alter column Worker_UnUsedInfo int

-- 对书本建立索引
create index id_of_book on BookInfo(BookId)
-- 删除索引，这是sql server的语法
drop index BookInfo.id_of_book

--sql server 没有rename关键字
--alter index id_of_book rename to new_id_of_book
