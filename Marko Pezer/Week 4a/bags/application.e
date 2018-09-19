note
	description: "bags application root class"
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
	multi1, multi2: MULTISET

	make
		do
			create multi1.make
			multi1.add ('A', 2)
			multi1.add ('B', 4)
			multi1.add ('C', 1)
			multi1.add ('D', 6)

			create multi2.make
			multi2.add ('A', 1)
			multi2.add ('B', 2)
			multi2.add ('C', 3)
			multi2.add ('D', 4)

			io.put_string ("  Multiset 1: " + multi1.print_multiset)
			io.put_new_line

			io.put_string ("Remove 6 x B from Multiset 1...%N%N")
			multi1.remove ('B', 6)

			io.put_string ("  Multiset 1: " + multi1.print_multiset)
			io.put_new_line

			io.put_string ("Add 4 x D to Multiset 1...%N%N")
			multi1.add ('E', 4)

			io.put_string ("  Multiset 1: " + multi1.print_multiset)
			io.put_string ("  Multiset 2: " + multi2.print_multiset)
			io.put_new_line

			io.put_string ("Last character in Multiset 1 is: ")
			io.put_character (multi1.max)
			io.put_new_line
			io.put_new_line

			io.put_string ("Multiset 1 and Multiset 2 are equal: ")
			io.put_boolean (multi1.is_equal_multiset(multi2))
			io.put_new_line
		end


end
