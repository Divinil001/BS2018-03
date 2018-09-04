class
	CMS

create
	make

feature
	contact1, contact2, contact3: CONTACT
	make
			-- Run application.
		do
			contact1 := create_contact("Alyona", 89536031449, "Innopolis", "alenaz2304@gmail.com")
			contact2 := create_contact("Anna", 89523422449, "Innopolis", "anna2304@gmail.com")
			contact3 := create_contact("Dima", 89523235834, "Innopolis", "dima2304@gmail.com")
			add_emergency_contact(contact1, contact2)
			add_emergency_contact(contact2, contact3)
			edit_contact(contact2, "Anna", 89425999449, "Innopolis", "anna2304@gmail.com")
			remove_emergency_contact(contact2)
			remove_emergency_contact(contact3)
		end

feature
	create_contact(name_a:STRING; phone_number_a: INTEGER_64;
				work_place_a: STRING;	email_a: STRING;): CONTACT
		local
			a:CONTACT
		do
			create a.make1 (name_a, phone_number_a, work_place_a, email_a)
			Result := a
		end
	edit_contact(a: CONTACT; name_a:STRING; phone_number_a: INTEGER_64;
				work_place_a: STRING;	email_a: STRING;)
		do
			a.set_name(name_a)
			a.set_number(phone_number_a)
			a.set_work(work_place_a)
			a.set_email(email_a)
		end

	add_emergency_contact(c1, c2: CONTACT)
		do
			c1.set_emergency(c2)
		end
	remove_emergency_contact(c: CONTACT)
		do
			c.set_emergency(Void)
		end
end
