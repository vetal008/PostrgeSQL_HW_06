-- Середній бал, який певний викладач ставить певному студентові
SELECT
    s.fullname AS student,
    t.fullname AS teacher,
    ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE s.fullname = 'Надія Єременко'
  AND t.fullname = 'Стус Хома Ростиславович'
GROUP BY s.fullname, t.fullname;
