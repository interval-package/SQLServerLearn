use ClassLearnBase

-----------------------------------------------------------------------------------------------------

-- ��ʾ������
select * from UserInfo;

select * from BookInfo;

select * from BookType;

select * from RentHis;

select * from Worker;

select * from RentHis_Detail;

-- ɾ������Ϣ
-- drop table BookStock, BookType, RentHis, UserInfo, BookInfo
-- drop table RentHis

SELECT constraint_name, 
       constraint_type,
       search_condition
  FROM USER_CONSTRAINTS
 WHERE table_name = 'USERINFO';