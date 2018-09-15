note
	description: "contact application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CMS

inherit
	ARGUMENTS_32

create
	make

feature
	create_contact(a_name: STRING; a_phone: INTEGER; a_place: STRING; a_email: STRING; a_emergency: detachable CONTACT): CONTACT
		require
			name_exists: a_name /= Void
			place_exists: a_place /= Void
			email_exists: a_email /= Void
			emergency_exists: a_emergency /= Void
			phone_exitsts: a_phone /= Void
		local
			contact: CONTACT
		do
			create contact.fill_in (a_name, a_phone, a_place, a_email, a_emergency)
			Result := contact
		end
	edit_contact(ccontact: detachable CONTACT)
		do
			if attached ccontact as contact then
				print("Type new data:")
				io.new_line
				print("Name:")
				io.read_line
				contact.set_name (io.last_string)
				io.new_line
				print("Phone:")
				io.read_integer
				contact.set_phone (io.last_integer)
				io.new_line
				print("Email:")
				io.read_line
				contact.set_email (io.last_string)
				io.new_line
				contact.set_emergency(Void)
			end
		end
	add_emergency_contact(ccontact: detachable CONTACT; nnew_emergency: detachable CONTACT)
		do
			if (attached ccontact as contact) and (attached nnew_emergency as new_emergency)then
				contact.set_emergency (new_emergency)
			end
		end
	remove_emergency_contact(ccontact: detachable CONTACT)
		do
			if attached ccontact as contact then
				contact.set_emergency (Void)
			end
		end

feature {NONE} -- Initialization
	make
		local
			c1: detachable CONTACT
			c2: detachable CONTACT
			c3: detachable CONTACT
			-- Run application.
		do
			create c1.fill_in ("John", 911, "Police", "This_is_the_police@police.ru", Void)
			create c2.fill_in ("James", 777, "NBA", "King@NBA.com", Void)
			create c3.fill_in ("Vasya", 1000, "Zavod", "rabot9ga@Zavod.ru", Void)
			add_emergency_contact(c2, c1)
			add_emergency_contact(c3, c2)
			edit_contact(c2)
			remove_emergency_contact(c2)
			remove_emergency_contact(c3)
			--| Add your code here
		end
end
