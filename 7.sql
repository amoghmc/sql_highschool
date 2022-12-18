-- For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C.

select h1.name, h1.grade,
		h2.name, h2.grade,
		h3.name, h3.grade
from
highschooler as h1, highschooler as h2, highschooler as h3

where
-- gets highschool id where A likes B
h2.id in (select id2 from likes where id1 = h1.id) and
-- gets highschool id where A is not friends with B
h2.id not in (select id2 from friend where id1 = h1.id) and
h1.id not in (select id2 from friend where id1 = h2.id) and
-- gets highschool id where A is friends with C
(h3.id in (select id2 from friend where id1 = h1.id) or
h3.id in (select id1 from friend where id2 = h1.id)) and
-- gets highschool id where B is friends with C
(h3.id in (select id2 from friend where id1 = h2.id) or
h3.id in (select id1 from friend where id2 = h2.id));