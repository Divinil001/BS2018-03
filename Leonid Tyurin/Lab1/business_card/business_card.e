class
	BUSINESS_CARD

create
	fill_in

feature {NONE} -- Initialization

	fill_in
			-- Fill in the card and print it.
		do
			io.put_string ("Your name : ")
			io.read_line
			set_name (io.last_string)
			io.put_string ("Your job : ")
			io.read_line
			set_job (io.last_string)
			io.put_string ("Your age : ")
			io.read_integer
			set_age (io.last_integer)
			print_card (name, job, age_info)
		end

feature -- Access

	name: STRING
			-- Owner's name.

	job: STRING
			-- Owner's job.

	age: INTEGER
			-- Owner's age.

feature -- Setting

	set_name (a_name: STRING)
			-- Set `name' to `a_name'.
		require
			name_exists: a_name /= Void
		do
			name := a_name.twin
		end

	set_job (a_job: STRING)
			-- Set `job' to `a_job'.
		require
			job_exists: a_job /= Void
		do
			job := a_job.twin
		end

	set_age (a_age: INTEGER)
			-- Set `age' to `a_age'.
		require
			age_non_negative: a_age >= 0
		do
			age := a_age
		end

feature -- Output

	age_info: STRING
			-- Text representation of age on the card.
		do
			Result := age.out + " years old"
		end

	Width: INTEGER = 50
			-- Width of the card (in characters), excluding borders.

	line (n: INTEGER): STRING
			-- Horizontal line on length `n'.
		do
			Result := "-"
			Result.multiply (n)
		end

	spaces (n: INTEGER): STRING
		do
			Result := " "
			Result.multiply (n)
		end

	print_card (n: STRING; j: STRING; a: STRING)
		do
			io.put_string (line (Width))
			io.new_line
			io.put_string ("|Your name : " + n)
			io.put_string (spaces (Width - n.count - 13) + "|")
			io.new_line
			io.put_string ("|Your job : " + j)
			io.put_string (spaces (Width - j.count - 12) + "|")
			io.new_line
			io.put_string ("|" + a)
			io.put_string (spaces (Width - a.count - 1) + "|")
			io.new_line
			io.put_string (line (Width))
		end

end
