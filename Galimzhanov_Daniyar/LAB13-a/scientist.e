note
	description: "Summary description for {SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SCIENTIST

feature
	name:STRING
	id:INTEGER
	discipline:STRING

feature
	introduce:STRING
		do
			Result:="My name is: " + name + "%N" + "My id: " + id.out + "%N" + "My discipline: " + discipline + "%N"
		end

feature
	set_name(a:STRING)
		do
			name:=a
		end

	set_discipline(a:STRING)
		do
			discipline:=a
		end


end
