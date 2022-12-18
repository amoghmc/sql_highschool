-- Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade.

select name, grade
from highschooler
where id not in (select id1 from likes)
and id not in (select id2 from likes)
order by grade, name;
