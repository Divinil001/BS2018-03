class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	execute
			-- Run application.
		do
			io.put_string("Name: Danat Ayazbayev%N")
			io.put_string("Age: 17%N")
			io.put_string ("Mother tongue: Kazakh%N")
			io.put_string ("Has a cat: True%N")
		end

end
