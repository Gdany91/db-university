--GROUP BY
--1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date),COUNT(*) 
FROM students
GROUP BY YEAR(enrolment_date);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address,COUNT(*) 
FROM teachers 
GROUP BY office_address;

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id,AVG(vote) 
FROM exam_student 
GROUP BY exam_id;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(*) 
FROM degrees 
GROUP by department_id;


--JOIN
--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*,degrees.name 
FROM degrees 
    JOIN students 
        ON degrees.id=students.degree_id 
WHERE degrees.name  LIKE 'Corso di Laurea in Economia';



--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT degrees.name
FROM departments
    JOIN degrees
        ON departments.id = degrees.department_id
WHERE departments.name LIKE 'Dipartimento di Neuroscienze'
    AND degrees.level LIKE 'magistrale';


--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.name
FROM courses
    JOIN course_teacher
        ON courses.id = course_teacher.course_id
    JOIN teachers
        ON teachers.id = course_teacher.teacher_id
WHERE course_teacher.teacher_id = 44;

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name, students.surname, degrees.name, departments.name
FROM students
    JOIN degrees
        ON degrees.id = students.degree_id
    JOIN departments
        ON departments.id = degrees.department_id
ORDER BY students.surname, students.name;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name , courses.name, teachers.name, teachers.surname
FROM degrees
    JOIN courses
        ON degrees.id = courses.degree_id
    JOIN course_teacher
        ON courses.id = course_teacher.course_id
    JOIN teachers
        ON teachers.id = course_teacher.teacher_id;