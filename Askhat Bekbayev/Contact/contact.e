class
	CONTACT
create
	make
feature

	make(a_name: STRING; a_number: INTEGER_64; a_place:STRING; an_email: STRING)
		do
			set_name(a_name)
			set_phone_number(a_number)
			set_work_place(a_place)
			set_email(an_email)
		end

feature
	Name: STRING
	Phone_number: INTEGER_64
	Work_place: STRING
	Email: STRING
	call_emergency: detachable CONTACT

	set_name(a_name: STRING)
		do
			name:= a_name
		end
	set_phone_number(a_number: INTEGER_64)
		require
			is_normal_digital: a_number.out.count = 10
		do
			phone_number := a_number
		end
	set_work_place(a_place: STRING)
		do
			work_place := a_place
		end
	set_email(a_mail: STRING)
		do
			email := a_mail
		end
	set_call_emergency(a_contact: detachable CONTACT)
		do
			call_emergency := a_contact
		end


end
