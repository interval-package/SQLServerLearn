use ClassLearnBase

alter table Worker
add Worker_UnUsedInfo char

-- ɾ���е�ʱ��Ҫ��ָ���У�������ָ�Ļ�Ĭ��ɾ������Լ����ϵ
alter table Worker
drop column Worker_UnUsedInfo

alter table Worker
alter column Worker_UnUsedInfo int

-- ���鱾��������
create index id_of_book on BookInfo(BookId)
-- ɾ������������sql server���﷨
drop index BookInfo.id_of_book

--sql server û��rename�ؼ���
--alter index id_of_book rename to new_id_of_book
