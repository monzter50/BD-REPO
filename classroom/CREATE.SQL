
CREATE SCHEMA CLASSROOM;
	
SET SCHEMA = CLASSROOM;
------------------------

CREATE TABLE USER (
	id_user SERIAL PRIMARY KEY, 
	first_name VARCHAR, 
	last_name VARCHAR, 
	email VARCHAR,
    date_joined DATE
);

CREATE TABLE CLASS_TEACHER (
	id_class_teacher SERIAL PRIMARY KEY, 
	id_user INT NOT NULL, 
	FOREIGN KEY (id_user)
     REFERENCES USER (id_user) ON DELETE CASCADE
);

CREATE TABLE CLASS_STUDENT (
	id_class_student SERIAL PRIMARY KEY, 
	id_user INT NOT NUL, 
	FOREIGN KEY (id_user)
     REFERENCES USER (id_user) ON DELETE CASCADE
);

CREATE TABLE CLASSROOM (
	id_class SERIAL PRIMARY KEY, 
	id_class_teacher INT NOT NULL, 
	id_class_student INT NOT NULL, 
	name_class VARCHAR,
    created DATE,
    FOREIGN KEY (id_class_teacher)
     REFERENCES CLASS_TEACHER (id_class_teacher) ON DELETE CASCADE,
     FOREIGN KEY (id_class_student)
     REFERENCES CLASS_STUDENT (id_class_student) ON DELETE CASCADE,
);

CREATE TABLE SECTIONS (
	id_sections SERIAL PRIMARY KEY, 
	id_class INT NOT NULL, 
	name_sections VARCHAR,
    start_date DATE,
    end_date DATE,
     FOREIGN KEY (id_class)
     REFERENCES CLASSROOM (id_class) ON DELETE CASCADE,
);

CREATE TABLE ACTIVITY (
	id_activity SERIAL PRIMARY KEY, 
	id_sections INT NOT NULL, 
	name_activity VARCHAR,
    start_date DATE,
    end_date DATE,
     FOREIGN KEY (id_sections)
     REFERENCES SECTIONS (id_sections) ON DELETE CASCADE,
);


CREATE TABLE EXAMS (
	id_exams SERIAL PRIMARY KEY, 
	id_activity INT NOT NULL UNIQUE, 
	name_exam VARCHAR,
    start_date DATE,
    end_date DATE,
     FOREIGN KEY (id_activity)
     REFERENCES ACTIVITY (id_activity) ON DELETE CASCADE,
);

CREATE TABLE QUESTIONS (
	id_questions SERIAL PRIMARY KEY, 
	id_exams INT NOT NULL UNIQUE, 
	points INT DEFAULT 0,
    descriptions VARCHAR,
     FOREIGN KEY (id_exams)
     REFERENCES EXAMS (id_exams) ON DELETE CASCADE,
);