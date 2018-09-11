note
	description: "Summary description for {ENTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTRY

create
	set

feature
	date: STRING
	owner: PERSON
	subject: STRING
	place: STRING

feature
	set(i_date: STRING; i_owner: PERSON; i_subject: STRING; i_place: STRING)
		do
			date := i_date
			owner := i_owner
			subject := i_subject
			place := i_place
		end

feature
	set_subject(new: STRING)
		do
			subject := new
		end

feature
	set_date(new: STRING)
		do
			date := new
		end

feature
	get_owner_name(): STRING
		do
			Result := owner.get_name
		end

feature
	get_date(): STRING
	 do
	 	Result := date
	 end

end
