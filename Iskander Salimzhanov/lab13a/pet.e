note
	description: "Summary description for {PET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PET
create
	make
feature {NONE}
	type, name: STRING

	set_type(a_type: STRING)
	do
		type := a_type
	ensure
		type = a_type
	end

	set_name(a_name: STRING)
	do
		name := a_name
	ensure
		name = a_name
	end

feature {ANY}
	get_type: STRING
	do
		Result := type
	end

	get_name: STRING
	do
		Result := name
	end

feature
	make(a_type, a_name: STRING)
	do
		set_type(a_type)
		set_name(a_name)
	end
end
