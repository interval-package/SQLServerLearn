--create view RentHis_Detail(ͼ����,ͼ������,����֤��,�������,�黹����,�����)
--as
--select BookInfo.BookId, BookInfo.BookName,
--UserInfo.CardId,
--RentHis.RentDate, RentHis.ReturnDate,
--BookInfo.Stock
--from BookInfo, UserInfo, RentHis
--where BookInfo.BookId = RentHis.BookId and RentHis.CardId = UserInfo.CardId 
--and RentHis.ReturnDate is null

 --drop view RentHis_Detail

 --create rule gdCheck
 --as @sex in ('male','female')

 drop rule gdCheck;

 exec sp_bindrule gdCheck, Worker;
 exec sp_unbindrule gdCheck, Worker;