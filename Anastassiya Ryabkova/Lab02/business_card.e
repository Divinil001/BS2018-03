class
	BUSINESS_CARD

create
	fill_in

feature {NONE} -- Initialization

	fill_in
			-- Fill in the card and print it.
		do
			-- Add your code here.
			io.put_string ("Please enter your name:")
			io.new_line
			io.read_line
			set_name(Io.last_string)

			io.put_string ("Please enter your job:")
			io.new_line
			io.read_line
			set_job(io.last_string)

			io.put_string ("Please enter your age:")
			io.new_line
			io.read_integer_32
			set_age(io.last_integer)

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
			--spaces in border
			do

				Result := " "
				Result.multiply (n)
			end
	print_card
			--Output the data
		do
			io.put_string(line(30)+ "%N")
			io.put_string ("| Your name: " + name)
			io.put_string(spaces(17- name.count))
			io.put_string ("|")
			io.new_line
			io.put_string ("| Your job: " + job )
			io.put_string(spaces(18-job.count))
			io.put_string ("|")
			io.new_line
			io.put_string ("| Your age: " + age_info)
			io.put_string(spaces(18 - age_info.count))
			io.put_string ("|")
			io.new_line
			io.put_string(line(30)+ "%N")
		end
	end


