class
	CONTACT

create make1
feature
	name: STRING assign set_name
	phone_number: INTEGER_64 assign set_number
	work_place: STRING assign set_work
	email: STRING assign set_email
	call_emergency: detachable CONTACT
feature
	make1 (name_a: STRING; phone_number_a: INTEGER_64;work_place_a: STRING;email_a: STRING)
	do
		set_name(name_a)
		set_number(phone_number_a)
		set_work(work_place_a)
		set_email(email_a)
		call_emergency := Void

	end

	set_name(a_name:STRING)
	do
		name := a_name
	end

	set_number(a_number:INTEGER_64)
	do
		phone_number := a_number
	end

	set_work(a_work_place: STRING)
	do
		work_place := a_work_place
	end

	set_email(a_email: STRING)
	do
		email := a_email
	end

	set_emergency(a: detachable CONTACT)
	do
		call_emergency := a
	end
end
