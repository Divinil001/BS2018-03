note
	description: "Summary description for {EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EVENT

	create

	make



feature



	make (n: STRING; t: INTEGER)

		do

			name := n

			time_tag := t

		end



	name: STRING

		-- Name of event



	time_tag: INTEGER

		-- Time tag



	print_event

		do

			print("%N" + name + ", " + time_tag.out + "%N")

		end



invariant

	has_name: name /= Void

	time_non_negative: time_tag >= 0



end
