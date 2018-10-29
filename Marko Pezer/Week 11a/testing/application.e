note
	description: "testing application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	e1, e2, e3, e4: EVENT
	arr: P_QUEUE

	make
	do
		create arr.make
		create e1.make("ITP I Lecture", 14, 10)
		create e2.make("ITP I Tutorial", 17, 15)
		create e3.make("ITP I Lab", 18, 55)
		create e4.make("English Class", 12, 10)

		arr.add_element (e1)
		arr.add_element (e2)
		arr.add_element (e3)

		arr.get_element.print_event

		arr.add_element (e4)

		arr.get_element.print_event

	end

end
