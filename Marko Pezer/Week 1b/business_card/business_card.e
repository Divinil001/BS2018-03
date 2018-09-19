class
	BUSINESS_CARD

create
	fill_in

feature {NONE} -- Initialization

	fill_in
			-- Fill in the card and print it.
		do
			Io.put_string ("Your Name: ")
			Io.read_line
			set_name(Io.last_string)

			Io.put_string ("Your Job: ")
			Io.read_line
			set_job(Io.last_string)

			Io.put_string ("Your Age: ")
			Io.read_integer
			set_age(Io.last_integer)

			print_my_card
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

	Width: INTEGER = 35
			-- Width of the card (in characters), excluding borders.

	line (n: INTEGER): STRING
			-- Horizontal line on length `n'.
		do
			Result := "-"
			Result.multiply (n)
		end

	spaces (n: INTEGER): STRING
			-- Horizontal line on length `n'.
		do
			Result := " "
			Result.multiply (n)
		end

	print_my_card

		do
			Io.put_string (line(Width) + "%N")
			Io.put_string ("| Your Name: " + name + spaces(Width-14-name.count) + "|%N")

			Io.put_string ("| Your Job: " + job + spaces(Width-13-job.count) + "|%N")

			Io.put_string ("| Your Age: ")
			Io.put_integer (age)

			Io.put_string (spaces(Width-13-age.out.count) + "|%N")
			Io.put_string (line(Width) + "%N")
		end

end
