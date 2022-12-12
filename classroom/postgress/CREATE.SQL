
CREATE SCHEMA CLASSROOM;
	
SET SCHEMA = CLASSROOM;
------------------------

CREATE TABLE USER (
	id_user SERIAL PRIMARY KEY, 
	first_name VARCHAR, 
	last_name VARCHAR, 
	email VARCHAR,
    date_joined DATE DEFAULT NOW()
);

CREATE TABLE TEACHER (
	id_teacher SERIAL PRIMARY KEY, 
	id_user INT NOT NULL, 
	FOREIGN KEY (id_user)
     REFERENCES USER (id_user) ON DELETE CASCADE
);

CREATE TABLE STUDENT (
	id_student SERIAL PRIMARY KEY, 
	id_user INT NOT NUL, 
	FOREIGN KEY (id_user)
     REFERENCES USER (id_user) ON DELETE CASCADE
);

CREATE TABLE CLASSROOM (
	id_class SERIAL PRIMARY KEY, 
	name_class VARCHAR,
    created DATE,
    FOREIGN KEY (id_teacher)
     REFERENCES TEACHER (id_teacher) ON DELETE CASCADE,
     FOREIGN KEY (id_student)
     REFERENCES STUDENT (id_student) ON DELETE CASCADE,
);

CREATE TABLE CLASS_STUDENT (
	id_class_student SERIAL PRIMARY KEY, 
	id_student INT NOT NULL, 
	id_class INT NOT NULL,
    FOREIGN KEY (id_class)
     REFERENCES CLASSROOM (id_class) ON DELETE CASCADE,
     FOREIGN KEY (id_student)
     REFERENCES STUDENT (id_student) ON DELETE CASCADE,
);

CREATE TABLE CLASS_TEACHER (
	id_class_teacher SERIAL PRIMARY KEY, 
	id_teacher INT NOT NULL UNIQUE, 
	id_class INT NOT NULL,
    FOREIGN KEY (id_class)
     REFERENCES CLASSROOM (id_class) ON DELETE CASCADE,
     FOREIGN KEY (id_teacher)
     REFERENCES TEACHER (id_teacher) ON DELETE CASCADE,
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

CREATE TABLE ANSWERS (
	id_answers SERIAL PRIMARY KEY, 
	id_questions INT NOT NULL UNIQUE, 
	is_correct BOOLEAN DEFAULT FALSE,
    descriptions VARCHAR,
     FOREIGN KEY (id_questions)
     REFERENCES QUESTIONS (id_questions) ON DELETE CASCADE,
);

CREATE TABLE ASSIGMENT (
	id_assigment SERIAL PRIMARY KEY, 
	id_activity INT NOT NULL UNIQUE, 
	descriptions VARCHAR,
     FOREIGN KEY (id_activity)
     REFERENCES ACTIVITY (id_activity) ON DELETE CASCADE,
);