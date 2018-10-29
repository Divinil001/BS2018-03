note
	description: "Summary description for {PROFESSOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROFESSOR

feature
	name: STRING
	list_of_the_students: ARRAYED_LIST[STRING]
	grades: ARRAYED_LIST[INTEGER]

feature {NONE}
	set_name(n: STRING)
		do
			name:=n
		end

	set_list_of_students(l: ARRAYED_LIST[STRING])
		do
			list_of_the_students:=l
		end

feature {ASSISTANT}
	set_grades(g: ARRAYED_LIST[INTEGER])
		do
			grades:=g
		end

feature {STUDENT, ASSISTANT}
	get_grades: ARRAYED_LIST[INTEGER]
		do
			Result:=grades
		end

end
