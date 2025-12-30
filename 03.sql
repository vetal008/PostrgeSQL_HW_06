-- Знайти середній бал у групах з певного предмета
SELECT
    gr.name AS group_name,
    ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN "groups" gr ON s.group_id = gr.id
JOIN subjects sub ON g.subject_id = sub.id
WHERE sub.name = 'Програмування'
GROUP BY gr.name
ORDER BY gr.name;
