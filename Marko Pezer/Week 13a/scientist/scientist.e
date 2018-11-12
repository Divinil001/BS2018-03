note
	description: "Summary description for {SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SCIENTIST

feature

	id: INTEGER
	name: STRING
	discipline: STRING

	set_id (i: INTEGER)
	do
		id := i
	end

	set_name (n: STRING)
	do
		name := n
	end

	set_discipline (d: STRING)
	do
		discipline := d
	end

end
