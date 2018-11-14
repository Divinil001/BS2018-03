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
		deferred
		end

feature
	introduce: STRING
		do
			Result:="Name: "+ name + " ; ID: " + id.out
		end

	make(i: INTEGER; n: STRING)
		do
			id:=i
			name:=n
		end
end

