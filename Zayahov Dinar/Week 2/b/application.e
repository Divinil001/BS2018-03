note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create c0.set_name("No emergency")

			create c1.set_name ("John")

			create c2.set_name ("Smit")
			c2.set_email ("c@mail.ru")
			c2.set_phone_number (321)
			print(c2.name+" "+c2.email+" "+c2.phone_number.out+"%N")

			create c3.set_name ("Alan")

			add_emergency_contact(c1, c2)
			add_emergency_contact(c2,c3)

			remove_emergency_contact(c2)
			remove_emergency_contact(c3)
			
			edit_contact(c2, 123, "c2@mail.ru")
			print(c2.name+" "+c2.email+" "+c2.phone_number.out+"%N")
		end

feature
	c0: CONTACT
	c1: CONTACT
	c2: CONTACT
	c3: CONTACT
feature
	add_emergency_contact(con1: CONTACT; con2: CONTACT)
		do
			con1.set_call_emergency(con2)
		end
	remove_emergency_contact(con:CONTACT)
		do
			con.set_call_emergency (c0)
		end
	edit_contact(cont: CONTACT; p_n: INTEGER; e_m: STRING)
		do
			cont.set_phone_number(p_n)
			cont.set_email(e_m)
		end
end

