note
	description: "Summary description for {PRODUCTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PRODUCTION
create
	fill_in
feature {NONE}
	field: FIELD
	filials: INTEGER
feature
	fill_in(a_field: FIELD; a_filials: INTEGER)
	require
		valid_filials: a_filials >= 0
	do
		set_field(a_field)
		set_filials(a_filials)
	end

feature {NONE}
	set_field(a_field: FIELD)
	do
		field := a_field
	ensure
		set_operation_was_succesful: field = a_field
	end

	set_filials(a_filials: INTEGER)
	require
		valid_filials: filials >= 0
	do
		filials := a_filials
	ensure
		set_operation_was_succesful: filials = a_filials
	end

feature {ANY}
	get_field: FIELD
	do
		Result := field
	ensure
		get_operation_was_succesful: Result = field
	end

	get_filials: INTEGER
	do
		Result := filials
	ensure
		get_operation_was_succseful: Result = filials
	end

invariant
	valid_filials: filials >= 0
end
