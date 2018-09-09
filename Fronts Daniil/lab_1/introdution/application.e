class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	execute
			-- Run application.
		do
			io.put_string("Name: Daniil Fronts")
			io.new_line()
			io.put_string("Age: 17")
			io.new_line()
			io.put_string("Mother tongue: Russian")
			io.new_line()
			io.put_string("Has a cat: True")
		end

end
