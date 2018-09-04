class
	PERSON
create
	make
feature
	name: STRING
	phone_number: INTEGER_64
	work_place: STRING
	email: STRING
feature
	make(name_a: STRING; phone_number_a: INTEGER_64; work_place_a: STRING; email_a: STRING)
		do
			name := name_a
			phone_number := phone_number_a
			work_place := work_place_a
			email := email_a
		end
	get_name: STRING
	do
		Result := name
	end
end

