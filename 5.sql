-- For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades.

select name, grade, name2, grade2
from
(select h1.id as id, h1.name as name, h1.grade as grade, id2,
 h2.grade as grade2, h2.name as name2
 from ((highschooler as h1 join likes on h1.id = id1) join
highschooler as h2 on id2 = h2.id)) as t1,

(select h1.id as t2id, h1.name as t2name, h1.grade as t2grade,
 id2 as t2id2, h2.grade as t2grade2, h2.name as t2name2
 from ((highschooler as h1 join likes on h1.id = id1) join
highschooler as h2 on id2 = h2.id)) as t2
where id = t2.t2id
and id2 not in (select id1 from likes);