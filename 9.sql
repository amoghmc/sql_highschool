-- Find the name and grade of all students who are liked by more than one other student.

select name, grade
from
highschooler
where
id in
(select id2
from likes
group by id2
having count(*) >= 2);