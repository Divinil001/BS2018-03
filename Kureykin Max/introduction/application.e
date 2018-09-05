class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	execute
			-- Run application.
		do
			-- Add your code here.
			io.put_string ("Name: John Smith")
      		io.new_line
      		io.put_string ("Age: ")
      		io.put_integer (20)
      		io.new_line
      		io.put_string ("Mother tongue: English")
      		io.new_line
      		io.put_string ("Has a cat: ")
      		io.put_boolean (True)
		end

end
