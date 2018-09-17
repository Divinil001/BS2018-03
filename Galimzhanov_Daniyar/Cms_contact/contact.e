note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create
	create_class

feature
	name: STRING
	phone_number: INTEGER
	work_place: STRING
	email: STRING
	call_emergency: detachable CONTACT


feature
	create_class(a_name: STRING; a_phone_number: INTEGER; a_work_place: STRING; a_email: STRING)
		do
			name := a_name
			phone_number := a_phone_number
			work_place := a_work_place
			email := a_email
			call_emergency := void
		end

	--setters
	set_name (a_name: STRING)
		do
			--create name.make_empty
			name := a_name
		end

	set_phone_number (num: INTEGER)
		require
			positive_number: num>0
		do
			phone_number := num
		ensure
			phone_number = num
		end

	set_work_place ( work: STRING)
		do
			--create work_place.make_empty
			work_place := work
		ensure
			work_place = work
		end

	set_email ( mail: STRING)
		do
			--create email.make_empty
			email := mail
		ensure
			email=mail
		end

	set_emergency ( emergency: detachable CONTACT)
		do
			--create call_emergency.default_make
			call_emergency := emergency
		end

	--getters
	get_name : STRING
		do
			Result:= name
		end

	get_number: INTEGER
		do
			Result:= phone_number
		end

	get_work: STRING
		do
			Result:= work_place
		end

	get_email: STRING
		do
			Result:= email
		end

	get_emergency: detachable CONTACT
		do
			Result := call_emergency
		end

end
