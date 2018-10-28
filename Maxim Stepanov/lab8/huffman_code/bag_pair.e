note
	description: "Summary description for {BAG_PAIR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAG_PAIR[G]

create make

feature
	count: INTEGER
	val: G

	make(c: G)
	do
		val := c
		count := 0
	end

	inc
	do
		count := count + 1
	end

	set_count(c: INTEGER)
	do
		count := c
	end

end
