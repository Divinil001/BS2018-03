note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY
create
	create_entry

feature
	date:TIME
	owner:PERSON
	subject:STRING
	place:detachable STRING

feature
	create_entry(dt:TIME; own:PERSON; subj:STRING; pl: detachable STRING)
	do
		set_date(dt)
		set_owner(own)
		set_subject(subj)
		set_place(pl)
	end

feature --setters
	set_date(d:TIME)
	do
		date:=d
	end

	set_owner(p:PERSON)
	do
		owner:=p
	end

	set_subject(subj:STRING)
	do
		subject:=subj
	end

	set_place(pl:detachable STRING)
	do
		place:=pl
	end

	print_entry_info
	do
		print("Date is: " + date.out +"%N")
		print("Owner's name is: " + owner.name +"%N")
		print("Owner's email is: " + owner.email +"%N")
		print("Owner's phone is: " + owner.phone_number.out +"%N")
		print("Owner's workplace is: " + owner.work_place +"%N")
		print("Entry's subject is: " + subject +"%N")
		if attached{STRING} place as pl then
			print("Entry's place is: " + pl +"%N")
		else
			print("Place is not specified!"+"%N")
		end
		print("%N")
	end
end
