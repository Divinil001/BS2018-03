note
	description: "My_Calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	p1: PERSON
	ct1: TIME
	e1: ENTRY

	make
		do
			create p1.set("Almaz", 123456789, "SpaceX", "mail@mail.mail")
			create ct1.make (0, 0, 0)
			create e1.set (ct1, p1, "English exam", "University room 104")
		end

end
