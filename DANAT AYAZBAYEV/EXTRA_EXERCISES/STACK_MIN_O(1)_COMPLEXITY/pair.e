note
	description: "Summary description for {PAIR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PAIR

create
	init

feature
	element : INTEGER
	min_before : INTEGER

feature
	init (el : INTEGER; b : INTEGER)
		do
			set_element(el)
			set_min_before(b)
		end
	set_element (el : INTEGER)
		do
			element := el
		end
	set_min_before (el : INTEGER)
		do
			min_before := el
		end
	get_element : INTEGER
		do
			Result := element
		end
	get_min_before : INTEGER
		do
			Result := min_before
		end
end
