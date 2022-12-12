CREATE VIEW LIST_TEACHER_WITH_CLASS AS
	SELECT U.first_name, U.last_name, C.name_class FROM SCHOOL.TEACHER AS T
	INNER JOIN SCHOOL.USER as U ON U.id_user = T.id_user
	INNER JOIN SCHOOL.CLASS_TEACHER AS CT ON CT.id_teacher = T.id_teacher
	INNER JOIN SCHOOL.CLASSROOM AS C ON C.id_class = CT.id_class
	GROUP BY U.first_name, U.last_name, C.name_class


-------------------------------------


CREATE VIEW TOTAL_STUDENT_IN_CLASS AS
	SELECT C.name_class,COUNT(CS.id_student)as Total FROM SCHOOL.CLASSROOM AS C
	INNER JOIN SCHOOL.CLASS_STUDENT as CS ON CS.id_class = C.id_class
	GROUP BY C.name_class


-------------------------------------

CREATE VIEW ACTIVITY_ACTIVES AS
	SELECT C.name_class,AC.name_activity,COUNT(AC.id_activity)as Total,AC.end_date FROM SCHOOL.ACTIVITY AS AC
	INNER JOIN SCHOOL.CLASSROOM as C ON C.id_class = AC.id_class WHERE AC.end_date >  CURRENT DATE
	GROUP BY AC.name_activity,C.name_class, AC.end_date

-------------------------------------

CREATE VIEW TOTAL_CLASS_HAVE_FOR_STUDENT AS
	SELECT U.first_name, U.last_name, COUNT(CS.id_class)AS "TOTAL JOINED" FROM SCHOOL.STUDENT AS S
		INNER JOIN SCHOOL.USER as U ON U.id_user = S.id_user
		INNER JOIN SCHOOL.CLASS_STUDENT AS CS ON CS.id_student = S.id_student
		INNER JOIN SCHOOL.CLASSROOM AS C ON C.id_class = CS.id_class
		GROUP BY U.first_name, U.last_name

--------------------------------------


CREATE VIEW PROFILE_TEACHER AS
    SELECT U.first_name, U.last_name, U.email FROM SCHOOL.TEACHER AS T
    INNER JOIN SCHOOL.USER as U ON U.id_user = T.id_user
    GROUP BY U.first_name, U.last_name, U.email 
