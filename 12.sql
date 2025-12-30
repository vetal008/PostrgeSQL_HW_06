-- Оцінки студентів у певній групі з певного предмета на останньому занятті
SELECT
    s.fullname AS student,
    g.grade,
    g.grade_date
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN subjects sub ON g.subject_id = sub.id
JOIN "groups" gr ON s.group_id = gr.id
WHERE gr.name = 'КН-13'
  AND sub.name = 'Алгоритми'
  AND g.grade_date = (
        SELECT MAX(g2.grade_date)
        FROM grades g2
        JOIN students s2 ON g2.student_id = s2.id
        JOIN subjects sub2 ON g2.subject_id = sub2.id
        JOIN "groups" gr2 ON s2.group_id = gr2.id
        WHERE gr2.name = 'КН-13'
          AND sub2.name = 'Алгоритми'
  )
ORDER BY s.fullname;
