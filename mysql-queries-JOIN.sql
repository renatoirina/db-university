----------------------------------------
        -- QUERY CON JOIN --
----------------------------------------

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia --
    SELECT `students`.*
    FROM `students`
    JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
    WHERE `degrees`.`name` = 'Corso di Laurea in Economia';


-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze --
    SELECT `degrees`.*
    FROM `degrees`
    JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
    WHERE `departments`.`name` = 'Dipartimento di Neuroscienze' AND `degrees`.`level` = 'Magistrale';


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) --
    SELECT `courses`.*
    FROM `courses`
    JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    WHERE `course_teacher`.`teacher_id` = 44;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
    -- relativo dipartimento, in ordine alfabetico per cognome e nome --
    SELECT `students`.*, `degrees`.`name` AS `degree_name`, `departments`.`name` AS `department_name`
    FROM `students`
    JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
    JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
    ORDER BY `students`.`surname`, `students`.`name`;


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti --
    SELECT `degrees`.`name` AS `degree_name`, `courses`.`name` AS `course_name`, `teachers`.`name` AS `teacher_name`, `teachers`.`surname` AS `teacher_surname`
    FROM `degrees`
    JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
    JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) --
    SELECT DISTINCT `teachers`.`name` AS `teacher_name` , `teachers`.`surname`AS `teacher_surname`, `departments`.`name` AS `department`
    FROM `degrees`
    INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
    INNER JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
    INNER JOIN `teachers` ON `course_teacher`.`teacher_id`= `teachers`.`id`
    INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
    WHERE `departments`.`name` = "Dipartimento di Matematica";


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
    -- superare ciascuno dei suoi esami --
    SELECT `students`.`name`, `students`.`surname`, `courses`.`name` AS `course_name`,
    COUNT(`exams`.`id`) AS `exams_number`,
    MAX(`exam_student`.`vote`) AS `max_vote`
    FROM `students`
    INNER JOIN `exam_student` ON `exam_student`.`student_id` = `students`.`id`
    INNER JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
    INNER JOIN `courses` ON `exams`.`course_id` = `courses`.`id`
    GROUP BY `students`.`id`, `courses`.`id`
    HAVING `max_vote` >= 18;