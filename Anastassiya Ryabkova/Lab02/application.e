class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	execute
			-- Run application.
		do
			-- Add your code here.
			io.put_string ("Name Anastassiya Ryabkova")
			io.new_line
			io.put_string ("Age:")
			io.put_integer (17)
			io.new_line
			io.put_string ("Mother tongue: russian")
			io.new_line
			io.put_string ("Has a dog")
			io.put_boolean (True)
		end

end
