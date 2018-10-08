note
	description: "Summary description for {STUDENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT

--create
--	make

create
    create_student

feature{PROFESSOR} --variables
	grade: detachable STRING

feature{STUDENT}
	name: STRING

feature{STUDENT}
    a_email: detachable STRING

feature
	create_student(b_name:STRING)
		do
			name := b_name
		end


feature{STUDENT}
	set_name(a_name: STRING)
		do
			name:=a_name
		end

	get_name:STRING
	    do
	        Result:=name
	    end

feature{STUDENT, PROFESSOR}
    send_email(email:STRING)
        do
            a_email:=email
        end

feature{PROFESSOR}
	set_grade(a_grade:STRING)
		do
			grade:=a_grade
		end


end
