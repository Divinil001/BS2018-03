class
	PERSON
create
	make
feature
	make(a_name: STRING; a_phone_number: INTEGER_64; a_place: STRING; an_email: STRING)
		do
			name := a_name
			phone_number := a_phone_number
			work_place := a_place
			email := an_email
		end
feature
	Name: STRING
	Phone_number: INTEGER_64
	Work_place: STRING
	Email: STRING

	printable_person: STRING
		local
			answer: STRING
		do
			answer := ""
			answer.append("%TName: " + name.out + "%N")
			answer.append("%TPhone number: " + phone_number.out + "%N")
			answer.append("%TWork place: " + work_place.out + "%N")
			answer.append("%TEmail: " + email.out)
			Result := answer
		end
end
