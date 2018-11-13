note
	description: "Summary description for {SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SCIENTIST


feature -- Access

	introduce
			-- `introduce'
		do
			print("Name: " + name + "%NID: " + id.out + "%N" + discipline + "%N")
		end

	discipline: STRING
			-- `discipline'

	name: STRING
			-- `name'

	id: INTEGER
			-- `id'

feature -- Element change

	set_discipline (a_discipline: like discipline)
			-- Assign `discipline' with `a_discipline'.
		do
			discipline := a_discipline
		ensure
			discipline_assigned: discipline = a_discipline
		end

	set_name (a_name: like name)
			-- Assign `name' with `a_name'.
		do
			name := a_name
		ensure
			name_assigned: name = a_name
		end

	set_id (an_id: like id)
			-- Assign `id' with `an_id'.
		do
			id := an_id
		ensure
			id_assigned: id = an_id
		end

end
