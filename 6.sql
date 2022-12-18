-- Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade.

select distinct name, grade
from
(select h1.id as id, h1.name as name, h1.grade as grade, id2,
 h2.grade as grade2, h2.name as name2
 from ((highschooler as h1 join friend on h1.id = id1) join
highschooler as h2 on id2 = h2.id)) as t1,

(select h1.id as t2id, h1.name as t2name, h1.grade as t2grade,
 id2 as t2id2, h2.grade as t2grade2, h2.name as t2name2
 from ((highschooler as h1 join friend on h1.id = id1) join
highschooler as h2 on id2 = h2.id)) as t2

where id = t2.t2id and grade = grade2
and id not in

(select id
from
(select h1.id as id, h1.name as name, h1.grade as grade, id2,
 h2.grade as grade2, h2.name as name2
 from ((highschooler as h1 join friend on h1.id = id1) join
highschooler as h2 on id2 = h2.id)) as t1,

(select h1.id as t2id, h1.name as t2name, h1.grade as t2grade,
 id2 as t2id2, h2.grade as t2grade2, h2.name as t2name2
 from ((highschooler as h1 join friend on h1.id = id1) join
highschooler as h2 on id2 = h2.id)) as t2

where id = t2.t2id and grade != grade2)

order by grade, name;