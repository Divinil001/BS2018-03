note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT
create
	fill_in
feature {NONE}
	fill_in(a_name: STRING; a_phone: INTEGER; a_place: STRING; a_email: STRING; a_emergency: detachable CONTACT)
		do
			set_name(a_name)
			set_phone(a_phone)
			set_place(a_place)
			set_email(a_email)
			if attached a_emergency as aa_emergency then
				set_emergency(aa_emergency)
			else
				call_emergency := Void
			end
		end
feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING
	call_emergency: detachable CONTACT

feature

	set_name (a_name: STRING)
		require
			name_exists: a_name /= Void
		do
			name := a_name.twin
		end

	set_phone (a_phone: INTEGER)
		require
			phone_exists: a_phone /= Void
		do
			phone_number := a_phone.twin
		end
	set_place (a_place: STRING)
		require
			place_exists: a_place /= Void
		do
			work_place := a_place.twin
		end
	set_email (a_email: STRING)
		require
			email_exists: a_email /= Void
		do
			email := a_email.twin
		end
	set_emergency(a_emergency: detachable CONTACT)
		do
			if attached a_emergency as aa_emergency then
				call_emergency := aa_emergency
			else
				call_emergency := Void
			end
		end
end
