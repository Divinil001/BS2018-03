note
	description: "Summary description for {CMS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CMS

create
	make

feature
	create_contact(name: STRING; phone: INTEGER; work_place: STRING; email: STRING): detachable CONTACT
	local
		cr: detachable CONTACT
	do
		create cr
		if cr /= void then
			cr.set_name (name)
			cr.set_phone (phone)
			cr.set_work_place (work_place)
			cr.set_email (email)
		end
		Result := cr
	end

feature
	edit_contact(c: detachable CONTACT; name: STRING; phone: INTEGER; work_place: STRING; email: STRING)
	do
		if c /= void then
			c.set_name(name)
			c.set_phone(phone)
			c.set_work_place(work_place)
			c.set_email(email)
		end
	end

	add_emergency_contact(con1: detachable CONTACT; con2: detachable CONTACT)
	do
		if con1 /= void then
			con1.set_emergency_contact(con2)
		end
	end

	remove_emergency_contact(c: detachable CONTACT)
	do
		if c /= void then
			c.remove_emergency_contact
		end
	end

feature
	c1: detachable CONTACT
	c2: detachable CONTACT
	c3: detachable CONTACT
	make
		do
			c1 := create_contact("c1", 1234, "c1_home", "c1@mail")
			c2 := create_contact("c2", 12345, "c2_home", "c2@mail")
			c3 := create_contact("c3", 1234567, "c3_home", "c3@mail")
			add_emergency_contact(c1,c2)
			print(c1)
			add_emergency_contact(c2,c3)
			print(c2)
			edit_contact(c2,"c2_changed", 123456, "c2_home", "c2@mail")
			remove_emergency_contact(c1)
			print(c1)
			remove_emergency_contact(c2)
			print(c2)
		end

end
