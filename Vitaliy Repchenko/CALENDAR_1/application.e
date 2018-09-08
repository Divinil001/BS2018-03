note
	description: "Calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	p1: PERSON
	e1, e2: ENTRY
	d1, d2: DATE
	c1: CALENDAR

	make

		do
			create c1
			create d1.make(28, 10, 2018)
			create d2.make(29, 10, 2018)

			p1 := c1.create_person("NAME", 8912056458, "a_work_place", "a_email")
			e1 := c1.create_entry(d1, p1, "a_subject", "a_place")
			e2 := c1.create_entry(d1, p1, "a_subject", "a_place")

			print(c1.in_conflict (e1, e2))
			c1.edit_subject (e1, "new_subject")
			c1.edit_date (e1, d2)
			print(c1.get_owner_name (e1))
			print(c1.in_conflict (e1, e2))



		end

end
