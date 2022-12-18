-- Find the difference between the number of students in the school and the number of different first names.


select no_of_students - diff_first from
(select count(*) as no_of_students
from
highschooler) as h,
(select count(distinct name) as diff_first
from
highschooler) as b;