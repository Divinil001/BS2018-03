note
	description: "Summary description for {INDUSTRY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	INDUSTRY
feature {NONE}
	name: STRING
	fields: ARRAYED_LIST [PRODUCTION]

feature {NONE}
	set_name(a_name: STRING)
	do
		name := a_name
	ensure
		set_operation_was_succesful: name = a_name
	end

	set_fields(a_fields: ARRAYED_LIST [PRODUCTION])
	do
		fields := a_fields
	ensure
		set_operation_was_succesful: fields = a_fields
	end

feature {ANY}
	get_name: STRING
	do
		Result := name
	ensure
		get_operation_was_succesful: Result = name
	end

	get_fields: ARRAYED_LIST [PRODUCTION]
	do
		Result := fields
	ensure
		get_operation_was_succesful: Result = fields
	end

	in_fields(a_field: FIELD): BOOLEAN
	local
		i: INTEGER
	do
		Result := false
		from
			i := 1
		until
			i > fields.count or not Result
		loop
			if fields.i_th (i).get_field.is_equal(a_field) then
				Result := true
			end
			i := i + 1
		end
	end

feature
	add_field(a_field: FIELD)
	require
		is_unique: not current.in_fields(a_field)
	local
		production: PRODUCTION
	do
		create production.fill_in (a_field, 0)
		fields.extend (production)
	ensure
		was_added: current.in_fields (a_field)
	end

	remove_field(a_field: FIELD)
	require
		valid_remove: current.in_fields(a_field)
	local
		new_fields: ARRAYED_LIST [PRODUCTION]
		i: INTEGER
	do
		create new_fields.make (0)
		from
			i := 1
		until
			i > fields.count
		loop
			if not fields.i_th (i).get_field.is_equal(a_field) then
				new_fields.extend (fields.i_th (i))
			end
			i := i + 1
		end
		set_fields(new_fields)
	ensure
		remove_was_succesful: fields.count = old fields.count - 1 and not current.in_fields(a_field)
	end

	vanish_fields
	do
		from
		until
			fields.is_empty
		loop
			fields.remove
		end
	ensure
		was_vanished: fields.is_empty
	end

feature
	add_filial
	require
	do
	ensure
	end

	del_filial
	require
	do
	ensure
	end
end
