note
	description: "Summary description for {ASSISTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ASSISTANT

feature
	prof: PROFESSOR

feature {NONE}
	set_grades(gr: ARRAYED_LIST[INTEGER])
	 do
	 	prof.set_grades(gr)
	 end
end
