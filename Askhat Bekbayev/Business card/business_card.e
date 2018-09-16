class
	BUSINESS_CARD

create
	fill_in

feature {NONE} -- Initialization

	fill_in
			-- Fill in the card and print it.
		do
			-- Add your code here.
			print("Please enter your name: ")
			Io.read_line
			set_name (Io.laststring)
			print("And your age: ")
			Io.read_integer
			set_age (Io.last_integer)
			print("Your job is... ")
			Io.read_line
			set_job (Io.last_string)

			print_card

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
			Result.multiply (50-n-1)
		end

	print_card
		do
			print ("%N%N")

			print (line (width) + "%N")
			print ("|" + "Name: " + name + spaces(name.count + 7) + "|%N")
			print (line (width) + "%N")
			print ("|" + age_info + spaces(age_info.count + 1) + "|%N")
			print (line (width) + "%N")
			print ("|" + "Job: " + job + spaces(job.count + 6) + "|%N")
			print (line (width) + "%N")

			--We can use some formula for calculating width
			--Like width := ( count > 50 ? count + 4 : 50 )

		end

end
