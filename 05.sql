-- Знайти курси, які читає певний викладач
SELECT sub.name
FROM subjects sub
JOIN teachers t ON sub.teacher_id = t.id
WHERE t.fullname = 'Стус Хома Ростиславович';
