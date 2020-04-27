CREATE DATABASE CourseProccessingSystem;

CREATE TABLE CourseProccessingSystem.department(
dept_id int NOT NULL,
dept_name varchar(50) NOT NULL,

PRIMARY KEY(dept_id)
);

CREATE TABLE CourseProccessingSystem.student(
  student_id int NOT NULL,
  student_name varchar(50) NOT NULL,
  major varchar(50) NOT NULL,
  level varchar(10) NOT NULL,
  age int NOT NULL,

  PRIMARY KEY(student_id)
);

CREATE TABLE CourseProccessingSystem.professor(
  prof_id int NOT NULL,
  prof_name varchar(50) NOT NULL,
  dept_id int NOT NULL,

  PRIMARY KEY(prof_id)
);

CREATE TABLE CourseProccessingSystem.course(
  course_code varchar(10) NOT NULL,
  name varchar(50) NOT NULL,

  PRIMARY KEY(course_code)
);

CREATE TABLE CourseProccessingSystem.semester_course(
  course_code varchar(10) NOT NULL,
  quarter varchar(10) NOT NULL,
  year int NOT NULL,
  prof_id int NOT NULL,

  PRIMARY KEY(course_code,quarter,year)
);

CREATE TABLE CourseProccessingSystem.enrolled(
  student_id int NOT NULL,
  course_code varchar(10) NOT NULL,
  quarter varchar(10) NOT NULL,
  year int NOT NULL,
  enrolled_at timestamp NOT NULL,
 PRIMARY KEY(student_id,course_code,quarter,year)
);


ALTER TABLE professor ADD FOREIGN KEY (dept_id) REFERENCES department(dept_id);
ALTER TABLE semester_course ADD FOREIGN KEY (prof_id) REFERENCES professor(prof_id);
ALTER TABLE semester_course ADD FOREIGN KEY (course_code) REFERENCES course(course_code);
ALTER TABLE enrolled ADD FOREIGN KEY (student_id) REFERENCES student(student_id);
ALTER TABLE enrolled ADD FOREIGN KEY (course_code,quarter,year) REFERENCES semester_course(course_code,quarter,year);
