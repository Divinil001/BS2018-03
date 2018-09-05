note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON
create
	create_person

feature
	name:STRING
	phone_number:INTEGER_64
	work_place:STRING
	email:STRING

feature
	create_person(nm:STRING; phone:INTEGER_64; work:STRING; mail:STRING)
	do
		set_name(nm)
		set_phone_number(phone)
		set_work_place(work)
		set_email(mail)
	end

feature --setters
	set_name(n:STRING)
	do
		name:=n
	end

	set_phone_number(p:INTEGER_64)
	do
		phone_number:=p
	end

	set_work_place(w:STRING)
	do
		work_place:=w
	end

	set_email(e:STRING)
	do
		email:=e
	end
end
