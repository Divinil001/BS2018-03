note
	description: "Summary description for {DICTIONARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DICTIONARY

create
	make

feature

	input_file: PLAIN_TEXT_FILE

	colour: ARRAYED_LIST [STRING]

	make
		do
			set_dictionary
		end

feature -- File

	set_dictionary
		do

			create colour.make (0)
			create input_file.make_open_read ("input.txt")

			from
				input_file.read_line
			until
				input_file.exhausted
			loop
				colour.extend (input_file.last_string)
				input_file.read_line
			end
			input_file.close
		
		end

end
