note
	description: "Summary description for {COURSE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COURSE
create
	create_course

feature
	create_course(n:STRING; id:INTEGER; schd:STRING; max:INTEGER; num_students:INTEGER)
	do
		if num_students > 3 then
			set_name(n)
			set_id(id)
			set_schd(schd)
			set_max(max)
		else
			print("Not enough students to create new course " + n +"%N")
			set_schd("")
			set_name("")
		end
	end

feature
	name:STRING
	identifier:INTEGER
	schedule:STRING
	max_students:INTEGER

feature
	set_name(n:STRING)
	do
		name:=n
	end

	set_id(id:INTEGER)
	do
		identifier:=id
	end

	set_schd(str:STRING)
	do
		schedule:=str
	end

	set_max(max:INTEGER)
	do
		max_students:=max
	end

end
