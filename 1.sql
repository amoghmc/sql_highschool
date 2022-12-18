-- Find the names of all students who are friends with someone named Gabriel.

select t1.name
from
(select * from (highschooler join friend on id = id1)) as t1
where t1.id2 in (select id from highschooler where name = 'Gabriel');