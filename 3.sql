-- For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships with oneself. (This one is a bit challenging; congratulations if you get it right.)

insert into friend
select f1.id1, f1.id2
from
(select distinct h1.id as id1, h3.id as id2
from
highschooler as h1, highschooler as h2, highschooler as h3
where
-- gets highschool id where A and B are friends
h2.id in (select id2 from friend where id1 = h1.id) and
-- gets highschool id where B and C are friends
h3.id in (select id2 from friend where id1 = h2.id) and
-- gets highschool id where A and C are not friends
h3.id not in (select id2 from friend where id1 = h1.id) and
-- gets highschool id that removes friendships with oneself
h1.id != h3.id
order by h1.id) as f1;

SELECT ID,
       name,
       grade,
  (SELECT count(*)
   FROM Friend
   WHERE id1 = H.id)
FROM Highschooler H
ORDER BY ID;