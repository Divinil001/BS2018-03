class
	CONTACT

create
	init

feature
	name: STRING --assign set_name
	phone_number: INTEGER_64 -- assign set_number
	work_place: STRING --assign set_job
	email: STRING --assign set_mail
	call_emergency: detachable CONTACT --assign set_emergency

feature
	init (name_:STRING; number: INTEGER_64; job: STRING; mail:STRING)
		do
			set_name(name_)
			set_number(number)
			set_job(job)
			set_mail(mail)
			call_emergency := Void
		end

	set_name(name_: STRING)
		do
			name := name_
		end

	set_number(number: INTEGER_64)
		do
			phone_number := number
		end

	set_job(job: STRING)
		do
			work_place := job
		end

	set_mail(mail: STRING)
		do
			email := mail
		end

	set_emergency(c2: detachable CONTACT)
		do
			call_emergency := c2
		end
end
