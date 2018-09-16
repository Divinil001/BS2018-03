class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	execute
			-- Run application.
		do

			Io.put_string("Name: Marko Pezer")
			Io.new_line
			Io.put_string("Age: ")
			Io.put_integer(19)
			Io.new_line
			Io.put_string("Mother tongue: Serbian")
			Io.new_line
			Io.put_string("Has a cat: ")
			Io.put_boolean(true)
			Io.new_line

		end

end
