-- Знайти середній бал, який ставить певний викладач зі своїх предметів
SELECT
    t.fullname,
    ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE t.fullname = 'Олекса Калениченко'
GROUP BY t.fullname;
