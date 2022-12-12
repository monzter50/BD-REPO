SELECT U.first_name,U.last_name,C.name_class  FROM CLASSROOM AS C
	INNER JOIN CLASS_STUDENT AS CS ON C.id_class = CS.id_class
	INNER JOIN STUDENT AS S ON S.id_student = CS.id_student
	INNER JOIN USER AS U ON U.id_user= S.id_user WHERE U.first_name LIKE 'J%'; 