use ClassLearnBase

select * from Student

select * from Teacher

select * from Course

select * from Score
order by sno

select * from Score
where cno like '3%'

select Score.* from Score,
(
select sno, max(degree) as max_degree from Score
group by sno
having count(*)>1
) as temp
where (Score.sno = temp.sno)
