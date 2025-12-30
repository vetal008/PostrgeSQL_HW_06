-- Знайти список студентів у певній групі
SELECT s.id, s.fullname
FROM students s
JOIN "groups" g ON s.group_id = g.id
WHERE g.name = 'КН-11'
ORDER BY s.fullname;
