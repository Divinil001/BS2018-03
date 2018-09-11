note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

create
	make

feature
	create_entry(ndate: TIME; nowner: PERSON; nsubject: STRING; nplace: STRING):ENTRY
	local
		e_tmp : ENTRY
	do
		create e_tmp.make
		e_tmp.edit_entry (ndate, nowner, nsubject, nplace)
		Result := e_tmp
	end

	edit_subject(e: ENTRY; new_subject: STRING)
	do
		e.set_subject (new_subject)
	end

	edit_date(e:ENTRY; new_date: TIME)
	do
		e.set_date (new_date)
	end

	get_owner_name(e: ENTRY): STRING
	do
		Result := e.owner.name
	end

	in_conflict(e1_conf: ENTRY; e2_conf: ENTRY) : BOOLEAN
	do
		if e1_conf.date ~ e2_conf.date or e1_conf.place ~ e2_conf.place then
			Result := True
		else
			Result:= False
		end

	end
feature -- Initialization
	p1 :PERSON
	e1 :ENTRY
	t1: TIME
	t2: TIME
	e2: ENTRY
	make
			-- Run application.
		do
			create p1.make
			create t1.make_now
			create t2.make_now
			p1.edit_contact ("VOVAN", 1488, "INNOPOLICE", "IAMNOTA@mail.com")
			e1 := create_entry(t1, p1, "sub", "place")
			e2 := create_entry(t2, p1, "sub", "place")
			print(get_owner_name(e1))
			print("%N")
			print(e1.place + " " + e2.place)
			print("%N")
			print(in_conflict(e1, e2))
		end

end
