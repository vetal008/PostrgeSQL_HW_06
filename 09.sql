-- Знайти список курсів, які відвідує студент
SELECT DISTINCT sub.name
FROM subjects sub
JOIN grades g ON sub.id = g.subject_id
JOIN students s ON g.student_id = s.id
WHERE s.fullname = 'Євген Дахно';
