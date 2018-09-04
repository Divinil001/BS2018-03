class
	ENTRY
create
	make
feature
	Date: TIME
	Owner: PERSON
	Subject: STRING assign set_subject
	Place: STRING

feature
	make (owner_n: PERSON; date_n: TIME; subject_n: STRING; place_n: STRING)
	do
		Owner := owner_n
		Date := date_n
		Subject := subject_n
		Place := place_n
	end

feature
	set_subject(subject_n: STRING)
	do
		Subject := subject_n
	end

	set_date(date_n: TIME)
	do
		Date := date_n
	end

	printable: STRING
	local
		ans: STRING
	do
		ans := ""
		ans.append("Time: " + date.formatted_out ("hh12:[0]mi:[0]ss.ff3 AM") + "%N")
		ans.append ("Owner: %N" + owner.printable)
		ans.append ("Subject " + subject + "%N")
		ans.append ("Place " + place + "%N")
		Result := ans
	end
end
