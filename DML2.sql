/*question 1*/
SELECT student_name from student NATURAL JOIN enrolled NATURAL JOIN semester_course
where level like 'SR' and prof_id=1;

/*question 2*/
SELECT MAX(age) from student NATURAL JOIN enrolled NATURAL JOIN semester_course NATURAL JOIN professor
where major like 'History' or prof_name like 'Michael Miller';

 /*question 3*/
SELECT student_name,name from student LEFT JOIN enrolled NATURAL JOIN course on student.student_id=enrolled.student_id
where course_code is NULL or course_code is NOT NULL;

 /*question 4*/
SELECT prof_name from professor LEFT JOIN semester_course NATURAL JOIN enrolled
on professor.prof_id=semester_course.prof_id
group by professor.prof_id HAVING count(student_id)<5;

/*question 6*/
SELECT course.course_code,course.name from course LEFT JOIN semester_course NATURAL JOIN professor NATURAL JOIN department
ON course.course_code=semester_course.course_code where course.course_code not in
(SELECT semester_course.course_code from semester_course) or dept_name like 'Computer Science';

/*question 7*/
SELECT student_name from student where student_name like 'M%' and age<20
UNION ALL
SELECT prof_name from professor NATURAL JOIN semester_course where prof_name like 'M%' GROUP BY prof_id HAVING count(course_code)>2;

/*question 8*/
SELECT prof_name, professor.prof_id FROM professor LEFT JOIN semester_course on professor.prof_id=semester_course.prof_id
where dept_id=1 OR dept_id=2 OR dept_id=3 OR dept_id=4 GROUP BY professor.prof_id HAVING COUNT(professor.prof_id)<2;

/*question 9*/
SELECT student_name,prof_name from professor left join semester_course natural join enrolled natural join student on professor.prof_id=semester_course.prof_id
UNION
SELECT student_name,prof_name from student left join enrolled natural join semester_course natural join professor on student.student_id=enrolled.student_id;

 /*question 10*/
SELECT name,semester_course.course_code,prof_name,semester_course.prof_id
from course NATURAL JOIN semester_course NATURAL JOIN professor group by prof_id,course_code HAVING count(course_code)>=2;


/*question 11*/
SELECT dept_name from semester_course RIGHT JOIN professor NATURAL JOIN department ON professor.prof_id=semester_course.prof_id
 group by department.dept_id HAVING count(semester_course.course_code)<3;
