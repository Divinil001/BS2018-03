note
	description: "Summary description for {COURSE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COURSE

create
	create_class

feature

	schedule:STRING

	name:STRING

	id: INTEGER

	max_number_of_students: INTEGER



feature
	create_class(nname:STRING; nid:INTEGER; nschedule:STRING; nmnos:INTEGER)
	do
		name := nname
		id := nid
		schedule := nschedule
		max_number_of_students := nmnos
	end


end
