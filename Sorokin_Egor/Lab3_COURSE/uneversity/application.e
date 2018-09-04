class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			create_class("MA", 105, "Monday all day", 5, 10)
			Io.put_string (name + "%N")
			Io.put_integer (identifier)
			Io.put_string ("%N")
			Io.put_string (schedule + "%N")
			Io.put_integer (max_num_of_students)
		end

feature
	name: STRING
	identifier: INTEGER
	schedule: STRING
	num_of_students: INTEGER
	max_num_of_students: INTEGER
	min_num_of_students: INTEGER = 3

feature

	create_class (n: STRING; id: INTEGER; sched: STRING; students: INTEGER; max: INTEGER)

		do
			if students <= min_num_of_students
				then
					name := "There is no name"
					schedule := "There is no schedule"
					Io.put_string ("Not enough students%N")
				else
					name := n
					identifier := id
					schedule := sched
					num_of_students := students
					max_num_of_students := max
			end

		end
end
