note
	description: "project1 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CMS

inherit
	ARGUMENTS

create
	make

feature
	--create_class(instance of class)
	instance(an_name: STRING; an_phone_number: INTEGER; an_work_place: STRING; an_email: STRING): CONTACT
	local contact1: CONTACT
		do
			create contact1.create_class(an_name, an_phone_number, an_work_place, an_email)
			Result := contact1
		end

feature

	edit_contact (cont: CONTACT; name: STRING; work: STRING; mail: STRING)
		do
			cont.set_name (name)
			cont.set_work_place (work)
			cont.set_email (mail)
		end

	add_emergency_contact (cont1, cont2: CONTACT)
		do
			cont1.set_emergency (cont2)
		end

	remove_emergency_contact (cont: CONTACT)
		do
			cont.set_emergency (Void)
		end



feature {NONE} -- Initialization
	object1: CONTACT
	object2: CONTACT
	make
			-- Run application.
		do
			object1 := instance("Geyorgy", 89888, "worker", "eiffel@gmail.com")
			object2 := instance("Sergey", 87888, "nonworker", "ei@gmail.com")
			--editing
			edit_contact(object1, "Oleg", "cleaner", "caligo@gmail.com")
			add_emergency_contact (object1, object2)
			remove_emergency_contact (object1)
			io.putstring (object1.get_name)
 		end

end
