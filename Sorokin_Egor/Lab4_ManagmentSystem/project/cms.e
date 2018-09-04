class
	CMS

create
	make

feature
	contact1:CONTACT
	contact2:CONTACT
	contact3:CONTACT
feature {NONE}

	make

		do
			contact1 := create_contact("Egor", 89270876214, "Nothing", "e.sorokin@innopolis.ru")
			contact2 := create_contact("Vlad", 891706346465, "Student", "v.kantaev@innopolis.ru")
			contact3 := create_contact("Alyona", 89325233443, "Policeman", "a.ivanova@innopolis.ru")

			add_emergency_contact(contact1, contact2)
			add_emergency_contact(contact2, contact3)
			edit_contact(contact2, "Vlad", 89270000000, "Scientist", "v.kantaev@innopolis.ru")
			remove_emergency_contact(contact2)
			remove_emergency_contact(contact1)
		end

feature

	create_contact(name_:STRING; number: INTEGER_64; job: STRING; mail:STRING): CONTACT
		local
			c:CONTACT
		do
			create c.init(name_, number, job, mail)
			Result := c
		end

	edit_contact(c: CONTACT; name_:STRING; number: INTEGER_64; job: STRING; mail:STRING)
		do
			c.set_name(name_)
			c.set_number (number)
			c.set_job (job)
			c.set_mail (mail)
		end

	add_emergency_contact(c1: CONTACT; c2: CONTACT)
		do
			c1.set_emergency(c2)
		end

	remove_emergency_contact(c: CONTACT)
		do
			c.set_emergency (Void)
		end

end
