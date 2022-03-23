
Insert into [dbo].[players]
select document.* from 
openrowset(BULK N'C:\players.txt',firstrow=2) as document

-- ,formatfile=N'c:\players.fmt'