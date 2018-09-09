note
	description: "contact_of_a_management_system application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CMS

inherit
	ARGUMENTS

create
	make

feature


feature {NONE} -- Initialization

	make
		local
			cont_1 : CONTACT
			cont_2 : CONTACT
			cont_3 : CONTACT
			-- Run application.
		do
			cont_1 := create_contact("DANAT", 123, "PROG", "asdsa@a.com")
			cont_2 := create_contact("ASDDSA", 111, "ASDASD", "asda@aaf.com")
			cont_3 := create_contact("INNO", 332, "CODER", "asdggsa@aasd.com")
			add_emergency_contact(cont_1, cont_2)
			add_emergency_contact(cont_2, cont_3)
			edit_contact(cont_2, "ABCDE", 954, "JOB", "ohasd@gmail.com")
			remove_emergency_contact(cont_2)
			remove_emergency_contact(cont_3)
		end

feature
	create_contact (a_name : STRING; a_phone_number : INTEGER_64; a_work_place : STRING; an_email : STRING) : CONTACT
		local
			c : CONTACT
		do
			create c.eiffel_studio(a_name, a_phone_number, a_work_place, an_email)
			Result := c
		end
	edit_contact (c : CONTACT; a_name : STRING; a_phone_number : INTEGER_64; a_work_place : STRING; an_email : STRING)
		do
			c.set_name (a_name)
			c.set_phone_number(a_phone_number)
			c.set_work_place(a_work_place)
			c.set_email(an_email)
		end
	add_emergency_contact (c1 : CONTACT; c2 : CONTACT)
		do
			c1.set_emergency_contact(c2)
		end
	remove_emergency_contact (c : CONTACT)
		do
			c.set_emergency_contact(void)
		end
end
