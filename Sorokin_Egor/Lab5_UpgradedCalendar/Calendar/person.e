class
	PERSON

create
	init

feature
	name: STRING
	phone_number: INTEGER_64
	work_place: STRING
	email: STRING

feature
	init(name_: STRING; number: INTEGER_64; job: STRING; mail: STRING)
		do
			name := name_
			phone_number := number
			work_place := job
			email := mail
		end

	get_name: STRING
		do
			Result := name
		end
end
