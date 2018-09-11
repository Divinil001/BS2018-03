note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

inherit
	ARGUMENTS

create
	make

feature -- Initialization
	p1: PERSON
	make

		do
			create p1
			p1.set_name("oi")
			p1.set_work_place("vei")
			p1.set_phone(1337)
			print(p1)
		end
feature
	create_enry(n_pe: PERSON; n_pl: STRING; n_sub: STRING):ENTRY
	local
		e: detachable ENTRY
	do
		create e
		if e /= void then
			e.set_owner (n_pe)
			e.set_place (n_pl)
			e.set_subject (n_sub)
		end
		Result := e
	end

	edit_subject(e: ENTRY; new_sub: STRING)
	do
		e.set_subject (new_sub)
	end

	edit_time(e: ENTRY; new_time: TIME)
	do
		e.set_time (new_time)
	end

	get_owner_name(e1: ENTRY): STRING
	do
		Result := e1.owner.name
	end


	in_conflict(e1: ENTRY; e2: ENTRY): BOOLEAN
	do
		Result := False
		if e1.place = e2.place then
			Result := True
		end
		if e1.time = e2.time then
			Result := True
		end
	end

end
