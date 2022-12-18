-- For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like.

select
h1.name, h1.grade, h2.name, h2.grade
from
highschooler as h1, highschooler as h2

where
-- gets highschool id where A likes B and B is 2 grades younger
h2.id in (select id2 from likes where id1 = h1.id) and
h1.grade - 2 >= h2.grade;