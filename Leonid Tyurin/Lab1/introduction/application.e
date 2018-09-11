class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	execute
			-- Run application.
		do
			io.put_string ("Name: JohnSmith ")
			io.new_line
			io.put_string ("Age:")
			io.put_integer (20)
			io.new_line
			io.put_string ("Mothertongue: English ")
			io.new_line
			io.put_string ("Hasacat:")
			io.put_boolean (True)
		end

end
