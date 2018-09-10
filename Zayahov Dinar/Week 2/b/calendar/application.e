note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS; DATE_VALUE; TIME_VALUE

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create o1.set_name("John")
			create e1.set_owner (o1)

			get_owner_name(e1)

			o1.set_email ("John@mail.ru")
			print("Email: "+o1.email+"%N")

			o1.set_phone_number (3405)
			print("Phone number: "+o1.phone_number.out+"%N")

			o1.set_work_place ("School")
			print("Work place: "+o1.work_place+"%N")
			e1.set_subject ("IFA2018")
			e1.set_place ("Germany")
			print("Event: "+e1.subject+"%N")
			print("Where: "+e1.place+"%N")

			edit_subject(e1, "Apple Presentation")
			print("Event: "+e1.subject+"%N")

			create e2.set_place ("Germany")
			in_conflict(e1, e2)

			e1.set_day (24)
			e2.set_day (23)

		end

feature
	e1: ENTRY
	o1: PERSON
	e2: ENTRY
	o2: PERSON
feature
	edit_subject(ent: ENTRY; new_subj: STRING)
		do
			ent.set_subject(new_subj)
		end

	edit_date(ent: ENTRY; y,m,d,h,m0,s: INTEGER)
		do
			ent.set_date_o(y,m,d,h,m0,s)
		end

	get_owner_name(ent: ENTRY)
		do
			print(ent.owner.name+"%N")
		end
	in_conflict(ent1, ent2: ENTRY)
		do
			if
				(ent1.place=ent2.place) or (ent1.minute=ent2.minute) or (ent1.hour=ent2.hour) or (ent1.day=ent2.day) or (ent1.month=ent2.month)
			then
				print(True)
			else
				print(False)
			end
		end
end
