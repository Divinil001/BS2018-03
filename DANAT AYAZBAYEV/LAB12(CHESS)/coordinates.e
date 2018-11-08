note
	description: "Summary description for {COORDINATES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COORDINATES

create
	init

feature
	r : INTEGER
	c : INTEGER
	init (r_, c_ : INTEGER)
		do
			r := r_
			c := c_
		end
end
