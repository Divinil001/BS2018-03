note
	description: "Bag application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	s: CHARACTER
	m1, m2: MULTISET
	make
			-- Run application.
		do
			--| Add your code here
			create m1.make
			create m2.make
			m1.add ('A', 3)
			m1.add ('b', 1)
			m1.add ('c', 2)
			m1.add ('z', 5)
			m2.add ('A', 3)
			m2.add ('b', 1)
			m2.add ('c', 2)
			m2.add ('z', 6)
			io.put_string ("Bag 2 " + m2.to_string)
			m2.remove ('z', 7)
			io.put_string ("Bag 2 " + m2.to_string)
			m2.add ('z', 4)
			io.put_string ("Bag 1 " + m1.to_string)
			io.put_string ("Bag 2 " + m2.to_string)
			io.put_character (m1.max)
			io.put_new_line
			io.put_boolean (m1.is_equal_bag (m2))
			io.put_new_line
			m2.add ('z', 1)
			io.put_boolean (m1.is_equal_bag (m2))
		end

end
