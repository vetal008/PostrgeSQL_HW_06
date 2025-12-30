-- Знайти оцінки студентів у групі з певного предмета
SELECT
    s.fullname AS student,
    g.grade,
    g.grade_date
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN subjects sub ON g.subject_id = sub.id
JOIN "groups" gr ON s.group_id = gr.id
WHERE gr.name = 'КН-11'
  AND sub.name = 'Бази даних'
ORDER BY student;
