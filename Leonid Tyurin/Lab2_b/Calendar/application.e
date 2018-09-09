note
	description: "cal application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	cal:CALENDAR

	temp_entry:ENTRY

	temp_person:PERSON

	temp_date:TIME

	make
			-- Run application.
		do
			create cal
			create temp_person.init
			create temp_entry.init
			create temp_date.make(0, 0, 0)


			temp_entry := cal.create_entry (temp_date, temp_person, "Meet", "Uni")
		end

end
