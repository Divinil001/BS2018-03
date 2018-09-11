note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON
create
	fill_in
feature {NONE}
	fill_in(a_name: STRING; a_phone: INTEGER; a_place: STRING; a_email: STRING)
	require
		name_exists: a_name /= Void
		phone_exists: a_phone /= Void
		place_exists: a_place /= Void
		email_exists: a_email /= Void
	do
		set_name(a_name)
		set_phone(a_phone)
		set_place(a_place)
		set_email(a_email)
	end
feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING
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
end
