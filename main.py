from faker import Faker
import random
import psycopg2
import logging

from psycopg2 import DatabaseError

fake = Faker("uk_UA")

conn = psycopg2.connect(host="localhost", database="postgres", user="postgres", password="password")
cur = conn.cursor()

# ---------- Groups ----------
groups = ["КН-11", "КН-12", "КН-13"]
groups_id = []
for g in groups:
    cur.execute("INSERT INTO groups (name) VALUES (%s) RETURNING id", (g,))
    groups_id.append(cur.fetchone()[0])
    # conn.commit()

# ---------- Teachers ----------
teachers = []
for _ in range(5):
    name = fake.name()
    cur.execute("INSERT INTO teachers (fullname) VALUES (%s) RETURNING id", (name,))
    teachers.append(cur.fetchone()[0])

# ---------- Subjects ----------
subjects_names = [
    "Бази даних", "Математика", "Програмування",
    "Алгоритми", "Операційні системи",
    "Комп'ютерні мережі", "Веб-технології"
]

subjects = []
for name in subjects_names:
    teacher_id = random.choice(teachers)
    cur.execute(
        "INSERT INTO subjects (name, teacher_id) VALUES (%s, %s) RETURNING id",
        (name, teacher_id)
    )
    subjects.append(cur.fetchone()[0])

# ---------- Students ----------
students = []
for _ in range(40):
    name = fake.name()
    group_id = random.choice(groups_id)
    cur.execute(
        "INSERT INTO students (fullname, group_id) VALUES (%s, %s) RETURNING id",
        (name, group_id)
    )
    students.append(cur.fetchone()[0])

# ---------- Grades ----------
for student_id in students:
    grades_count = random.randint(10, 20)
    for _ in range(grades_count):
        subject_id = random.choice(subjects)
        grade = random.randint(60, 100)
        date = fake.date_between(start_date="-1y", end_date="today")
        cur.execute(
            "INSERT INTO grades (student_id, subject_id, grade, grade_date)VALUES (%s, %s, %s, %s)",
            (student_id, subject_id, grade, date)
        )


conn.commit()

try:
    conn.commit()
except DatabaseError as e:
    logging.error(e)
    conn.rollback()
finally:
    conn.close()
    cur.close()

