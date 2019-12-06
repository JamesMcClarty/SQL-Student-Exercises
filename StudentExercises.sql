--Assignment 1

--CREATE TABLE exercises (
--id INTEGER NOT NULL PRIMARY KEY IDENTITY,
--name VARCHAR(100) NOT NULL,
--language VARCHAR(100) NOT NULL
--);

--CREATE TABLE cohorts (
--id INTEGER NOT NULL PRIMARY KEY IDENTITY,
--name VARCHAR(100) NOT NULL
--);

--CREATE TABLE students (
--id INTEGER NOT NULL PRIMARY KEY IDENTITY,
--first_name VARCHAR(100) NOT NULL,
--last_name VARCHAR(100) NOT NULL,
--slack_handle VARCHAR(100) NOT NULL,
--cohort_id INTEGER,
--CONSTRAINT FK_student_cohort FOREIGN KEY (cohort_id) references cohorts(id),
--);

--CREATE TABLE instructors (
--id INTEGER NOT NULL PRIMARY KEY IDENTITY,
--first_name VARCHAR(100) NOT NULL,
--last_name VARCHAR(100) NOT NULL,
--slack_handle VARCHAR(100) NOT NULL,
--specialty VARCHAR(100) NOT NULL,
--cohort_id INTEGER,
--CONSTRAINT FK_instructor_cohort FOREIGN KEY (cohort_id) references cohorts(id)
--);

--CREATE TABLE studentexercises (
--id INTEGER NOT NULL PRIMARY KEY IDENTITY,
--student_id INTEGER,
--exercise_id INTEGER,
--CONSTRAINT FK_studentexercises_student FOREIGN KEY (student_id) references students(id),
--CONSTRAINT FK_studentexercises_exercise FOREIGN KEY (exercise_id) references exercises(id)
--);

--Assignment 2

--exercises
--INSERT INTO exercises (name, language) VALUES ('Make a database','SQL');
--INSERT INTO exercises (name, language) VALUES ('Make a website','Javascript');
--INSERT INTO exercises (name, language) VALUES ('Make a design','UI/UX');

--cohorts
--INSERT INTO cohorts (name) VALUES ('Cohort 32');
--INSERT INTO cohorts (name) VALUES ('Cohort 33');
--INSERT INTO cohorts (name) VALUES ('Cohort 34');

--students
--INSERT INTO students (first_name, last_name, slack_handle, cohort_id) VALUES ('James','McClarty','JamesMcC',3);
--INSERT INTO students (first_name, last_name, slack_handle, cohort_id) VALUES ('David','Cornish','DavidCorn',3);
--INSERT INTO students (first_name, last_name, slack_handle, cohort_id) VALUES ('Keaton','Williamson','KeatonWill',1);
--INSERT INTO students (first_name, last_name, slack_handle, cohort_id) VALUES ('Nate','Vogal','NateVog',2);
--INSERT INTO students (first_name, last_name, slack_handle, cohort_id) VALUES ('Simon','Belmont','SimonBel',2);

--instructors
--INSERT INTO instructors(first_name, last_name, slack_handle, specialty, cohort_id) VALUES ('Brenda','Long','BrendaLong','UI/UX', 1);
--INSERT INTO instructors(first_name, last_name, slack_handle, specialty, cohort_id) VALUES ('Madi','Peper','MadiPepe','Javascript', 2);
--INSERT INTO instructors(first_name, last_name, slack_handle, specialty, cohort_id) VALUES ('Adam','Sheaffer','AdamShea','SQL', 3);
--INSERT INTO instructors(first_name, last_name, slack_handle, specialty, cohort_id) VALUES ('Mister','Smart','MrSmart','SQL', 3);

--Student Exercises
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (1, 1);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (1, 2);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (2, 1);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (2, 3);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (3, 3);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (3, 1);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (4, 2);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (4, 1);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (5, 2);
--INSERT INTO studentexercises(student_id, exercise_id) VALUES (5, 3);

--Assignment 3
SELECT students.first_name, students.last_name FROM students

--Assignment 4
SELECT students.first_name, students.last_name, cohorts.name FROM students
LEFT JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.[name] = 'Cohort 33'

--Assignment 5
SELECT instructors.last_name FROM instructors
ORDER BY instructors.last_name

--Assignment 6
SELECT DISTINCT instructors.specialty FROM instructors

--Assignment 7
SELECT exercises.[name], students.first_name, students.last_name FROM exercises
RIGHT JOIN studentexercises on exercise_id = exercises.id
RIGHT JOIN students on student_id = students.id
WHERE studentexercises.exercise_id IS NOT NULL;

--Assignment 8

SELECT students.first_name, students.last_name, COUNT(exercises.name) from exercises
RIGHT JOIN studentexercises on exercise_id = exercises.id
RIGHT JOIN students on student_id = students.id
GROUP BY students.first_name, students.last_name;