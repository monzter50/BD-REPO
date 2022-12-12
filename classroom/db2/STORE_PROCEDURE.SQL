CREATE OR REPLACE PROCEDURE SEARCH_CLASS (IN NAME_CLASS VARCHAR(168))
	DYNAMIC RESULT SETS 1
P1: BEGIN
	-- Declare cursor
	DECLARE cursor1 CURSOR WITH RETURN for
	-- #######################################################################
	-- # Replace the SQL statement with your statement.
	-- #  Note: Be sure to end statements with the terminator character (usually ';')
	-- #
	-- # The example SQL statement SELECT NAME FROM SYSIBM.SYSTABLES
	-- # returns all names from SYSIBM.SYSTABLES.
	-- ######################################################################
	SELECT C.name_class FROM SCHOOL.CLASSROOM AS C WHERE C.name_class LIKE NAME_CLASS;

	-- Cursor left open for client application
	OPEN cursor1;
END P1



---------------------------

CREATE OR REPLACE PROCEDURE search_student_with_class (IN STUDENT_NAME VARCHAR(128))
P1: BEGIN
	DECLARE cursor1 CURSOR WITH RETURN for
	-- #######################################################################
	-- # Returns count of tables created by MONSTER and like VARNAME
	-- #######################################################################
	SELECT U.first_name,U.last_name,C.name_class FROM CLASSROOM AS C
	INNER JOIN CLASS_STUDENT AS CS ON C.id_class = CS.id_class
	INNER JOIN STUDENT AS S ON S.id_student = CS.id_student
	INNER JOIN USER AS U ON U.id_user= S.id_user WHERE U.first_name LIKE STUDENT_NAME;
	OPEN cursor1;
END P1



------------------

CREATE OR REPLACE PROCEDURE SCHOOL.updateNameClass(
IN id_class INT, IN name_class varchar(100))
language SQL    
 MODIFIES SQL DATA
    update SCHOOL.CLASSROOM 
        set name_class = name_class
        where id_class = id_class 



