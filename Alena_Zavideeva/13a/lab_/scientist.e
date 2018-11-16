deferred class
	SCIENTIST

feature

	id: INTEGER

feature {NONE}

	discipline: STRING

	name: STRING

feature

	introduce
		do
			print ("Name: " + name + "%N")
			print ("ID: " + id.out + "%N")
			print ("Discipline: " + discipline + "%N")
		end

	get_discipline: STRING
		do
			create Result.make_from_string (discipline)
		end

	get_name: STRING
		do
			create Result.make_from_string (name)
		end

end
