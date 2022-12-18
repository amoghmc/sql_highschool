-- For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order.

select
h1.name, h1.grade, h2.name, h2.grade
from
highschooler as h1, highschooler as h2

where
-- gets highschool id where A likes B
h2.id in (select id2 from likes where id1 = h1.id) and
-- gets highschool id where B likes A
h1.id in (select id2 from likes where id1 = h2.id) and
-- include pair only once
h1.name < h2.name
order by h1.name;