--create view RentHis_Detail(图书编号,图书名称,借书证号,借出日期,归还日期,库存数)
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