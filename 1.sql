-- It's time for the seniors to graduate. Remove all 12th graders from Highschooler.

delete from highschooler
where grade = 12;

SELECT *
FROM Highschooler
ORDER BY ID;