note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

feature
	create_entry(date:TIME; owner:PERSON; subject:STRING; place:detachable STRING):ENTRY
	local
		new_entry:ENTRY
	do
		create new_entry.create_entry(date, owner, subject, place)
		Result:=new_entry
	end

	edit_subject(e:ENTRY; new_subject:STRING)
	do
		e.set_subject (new_subject)
	end

	edit_date(e:ENTRY; new_date:TIME)
	do
		e.set_date (new_date)
	end

	get_owners_name(e:ENTRY):STRING
	do
		Result:=e.owner.name
	end

	in_coflict(e1,e2:ENTRY):BOOLEAN
	do
		if e1.date=e2.date then
			Result:=True
		end
		if attached{STRING} e1.place as pl1 and attached{STRING} e1.place as pl2 then
			if(pl1 = pl2) then
				Result:=True
			end
		end
		if Result = True then
			print("Entries are in coflict%N")
		else
			print("Nothing common between two entries%N")
		end
	end

end
