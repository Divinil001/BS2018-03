class
	CMS
create
	make
feature
	make
		do
--			create c1.make("Ammit", 8705147, "INNO", "b@a.c")
			contact := create_contact("Ammit", 7052546086, "INNO", "b@a.c")
			print_contact (contact)
			print("%N")


			edit_contact (contact, "Amat", 7014514010, "Dorm", "a.b@i.u")
			print_contact (contact)
		end
feature
	contact: CONTACT
	print_contact(a_contact: CONTACT)
		do
			a_contact.print(a_contact.name)
			print("%N")
			a_contact.print(a_contact.phone_number)
			print("%N")
			a_contact.print(a_contact.work_place)
			print("%N")
			a_contact.print(a_contact.email)
			print("%N")
		end

	create_contact(a_name: STRING; a_number: INTEGER_64; a_place:STRING; an_email: STRING): CONTACT
		local
			a_contact: CONTACT
		do
			create a_contact.make(a_name, a_number, a_place, an_email)
			Result := a_contact
		end
	edit_contact(a_c: CONTACT; a_name: STRING; a_number: INTEGER_64; a_place:STRING; an_email: STRING)
		do
			a_c.set_name(a_name)
			a_c.set_phone_number(a_number)
			a_c.set_work_place(a_place)
			a_c.set_email(an_email)
		end
	add_emetgency_contact(c1:CONTACT; c2: CONTACT)
		do
			c1.set_call_emergency (c2)
		end
	remove_emergency_contact(a_contact: CONTACT)
		do
			a_contact.set_call_emergency (Void)
		end

end
