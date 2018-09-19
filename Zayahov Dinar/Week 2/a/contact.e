note
	description: "Management_System application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here.
			c1("Ivan", 8987, "school", "Ivan@mail.ru")
			c2("Dima", 8765, "store", "Dima@mail.ru")
			c3("Alla", 7654, "Police", "Alla@mail.ru")
			add_emergency_contact(c1, c2)
			add_emergency_contact(c2, c3)
		end
feature

	set_name(n:STRING)
		do
			name:=n
		end
	name: STRING

	set_phone_number(pn: INTEGER)
		do
			phone_number:=pn
		end
	phone_number: INTEGER

	set_work_place(wp: STRING)
		do
			work_place:=wp
		end
	work_place: STRING

	set_email(em: STRING)
		do
			email:=em
		end
	email: STRING

	set_call_emergency(ce: CONTACT)
		do
			call_emergency:=ce
		end
	call_emergency: CONTACT

end





