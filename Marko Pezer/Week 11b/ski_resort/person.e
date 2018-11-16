note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature

	i: INTEGER
	name: STRING
	phone_number: STRING
	primary, secondary: ARRAYED_LIST[STRING]

	make (n, p: STRING)
	do
		create primary.make(0)
		create secondary.make(0)
		name := n
		phone_number := p
	end

	add_primary (x: STRING)
	require
		good_length: x.count > 0
	do
		primary.extend (x)
	end

	add_secondary (x: STRING)
	require
		good_length: x.count > 0
	do
		secondary.extend (x)
	end

	return_all
	do
		create primary.make(0)
		create secondary.make(0)
	end

	does_person_own (x: STRING): BOOLEAN
	do
		Result := False

		from i := 1
		until i > primary.count
		loop
			if primary[i] ~ x then
				Result := true
			end
			i := i + 1
		end
	end

end
