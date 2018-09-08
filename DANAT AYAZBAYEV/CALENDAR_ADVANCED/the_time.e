note
	description: "Summary description for {THE_TIME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	THE_TIME

create
	time_init

feature
	start_time : INTEGER
	end_time : INTEGER

feature
	time_init (start_time_of : INTEGER; end_time_of : INTEGER)
		do
			set_the_start_time(start_time_of)
			set_the_end_time(end_time_of)
		end
	get_the_start_time : INTEGER
		do
			Result := start_time
		end
	get_the_end_time : INTEGER
		do
			Result := end_time
		end
	set_the_start_time (a_start_time : INTEGER)
		do
			start_time := a_start_time
		end
	set_the_end_time (an_end_time : INTEGER)
		do
			end_time := an_end_time
		end
end
