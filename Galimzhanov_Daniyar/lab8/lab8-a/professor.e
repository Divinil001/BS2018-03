note
	description: "Summary description for {PROFESSOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROFESSOR

create
    create_professor


feature {PROFESSOR}
	task_answers:ARRAY[STRING]
	exam_test: detachable STRING
	list_of_students: ARRAY[STUDENT]
	office_hours:detachable STRING

feature{PROFESSOR}
	name:detachable STRING
	age: INTEGER




feature {PROFESSOR}
	set_name(a_name: STRING)
		do
			name:=a_name
		end

	set_age(a_age: INTEGER)
		do
			age:=a_age
		end

feature{PROFESSOR}
	grade_moodle(a_student:STUDENT;a_grade:STRING)
		do
			a_student.set_grade (a_grade)
		end

feature
	create_professor(task:ARRAY[STRING]; exam:STRING)
		do
			task_answers:=task
			exam_test:=exam
		end

feature{PROFESSOR}
    add_student(student:STUDENT; index_of_list:INTEGER)
        do
            list_of_students.put(student, index_of_list)
        end

    remove_student(index_of_list:INTEGER)
        do
            list_of_students.remove_head(index_of_list)
        end


end
