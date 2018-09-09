class
	CONTACT

create
	init

feature

	init
		do
			name := ""
			work_place := ""
			email := ""
		end

	name:STRING

	phone_number:INTEGER

	work_place:STRING

	email:STRING

	call_emergency: detachable CONTACT

	set_name(n:STRING)
		do
			name := n
		end

	set_phone_number(p:INTEGER)
		do
			phone_number := p
		end

	set_emergency_contact(c: detachable CONTACT)
		do
			call_emergency := c
		end

	set_email(e:STRING)
		do
			email := e
		end

	set_work_place(w:STRING)
		do
			work_place := w
		end
end
