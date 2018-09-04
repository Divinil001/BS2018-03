class
	PERSON
create
	make

feature
	Name: STRING assign set_name
	Phone_number: INTEGER_64 assign set_phone_number
	Work_place: STRING assign set_work_place
	Email: STRING assign set_email

feature
	make(name_n: STRING; phone_number_n: INTEGER_64; work_place_n: STRING; email_n: STRING)
	do
		Name := name_n
		Phone_number := phone_number_n
		Work_place := work_place_n
		Email := email_n
	end

feature
	set_name(name_n: STRING)
	do
		Name := name_n
	end

	set_phone_number(phone_number_n: INTEGER_64)
	do
		Phone_number := phone_number_n
	end

	set_work_place(work_place_n: STRING)
	do
		Work_place := work_place_n
	end

	set_email(email_n: STRING)
	do
		Email := email_n
	end


feature
	print_info
	do
		Io.put_string ("Name: " + Name + "%N")
		Io.put_string ("Phone_number: " + Phone_number.out + "%N")
		Io.put_string ("Work place: " + Work_place + "%N")
		Io.put_string ("Email: " + Email + "%N")
		Io.put_new_line
	end
feature
	printable: STRING
	local
		ans: STRING
	do
		ans := ""
		ans.append("%TName: " + Name + "%N")
		ans.append ("%TPhone_number: " + Phone_number.out + "%N")
		ans.append ("%TWork place: " + Work_place + "%N")
		ans.append ("%TEmail: " + Email + "%N")
		Result := ans
	end
end
