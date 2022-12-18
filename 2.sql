-- If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.

delete from likes where
id1 in
(select id1 from likes
where id1 in
(select h1.id
from
highschooler as h1, highschooler as h2
where
-- gets highschool id where A likes B
h2.id in (select id2 from likes where id1 = h1.id) and
-- gets highschool id where B does not like A
h1.id not in (select id2 from likes where id1 = h2.id) and
-- gets highschool id where A and B are friends
h2.id in (select id2 from friend where id1 = h1.id)));

SELECT H1.name,
       H1.grade,
       H2.name,
       H2.grade
FROM Likes L,
     Highschooler H1,
     Highschooler H2
WHERE L.ID1 = H1.ID
  AND L.ID2 = H2.ID
ORDER BY H1.name,
         H1.grade;