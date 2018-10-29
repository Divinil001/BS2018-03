note
	description: "Summary description for {STUDENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT
feature
	prof: PROFESSOR
	s_name: STRING
	--owner_grades: ARRAYED_LIST[INTEGER]

feature
	set_professor(p: PROFESSOR)
		do
			prof:=p
		end
	show_grades: ARRAYED_LIST[INTEGER]
		do
			Result:=prof.get_grades
		end
end
