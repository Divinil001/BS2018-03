note
	description: "Summary description for {SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SCIENTIST

feature
	id : INTEGER
	name : STRING
	discipline : STRING
	introduce : STRING
		do
			Result := "My name is " + name + "%N"
			Result := Result + "My id is " + id.out + "%N"
			Result := Result + "My discipline is " + discipline.out + "%N"
		end
	init (id_ : INTEGER; name_ : STRING; discipline_ : STRING)
		do
			set_id(id_)
			set_name(name_)
			set_discipline(discipline_)
		end
	set_id (id_ : INTEGER)
		do
			id := id_
		end
	set_name (name_ : STRING)
		do
			name := name_
		end
	set_discipline (discipline_ : STRING)
		do
			discipline := discipline_
		end
end
