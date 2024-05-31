----------------------------------------
        -- QUERY CON GROUP BY --
----------------------------------------

-- 1. Contare quanti iscritti ci sono stati ogni anno --
    SELECT YEAR(`enrolment_date`) AS `enrolment_year`,
    COUNT(*) AS `total_students`
    FROM `students`
    GROUP BY `enrolment_year`;


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio --
    SELECT `office_address`,
    COUNT(*) AS `total_teachers`
    FROM `teachers`
    GROUP BY `office_address`;


-- 3. Calcolare la media dei voti di ogni appello d'esame --
    SELECT `exam_id`,
    AVG(`vote`) AS `average_vote`
    FROM `exam_student`
    GROUP BY `exam_id`;


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento --
    SELECT `department_id`,
    COUNT(*) AS `total_degrees`
    FROM `degrees`
    GROUP BY `department_id`;