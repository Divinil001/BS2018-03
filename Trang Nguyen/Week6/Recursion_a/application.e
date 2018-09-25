note
	description: "recursion application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS
	REVERSE_STRING
	LCS
	MERGE_SORT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create l.make (0)
			l.extend (2)
			l.extend (15)
			l.extend (5)
			l.extend (9)
			l.extend (0)
			print (recursive ("This is a Test"))
			io.new_line
			print (iterative ("This is a Test"))
			io.new_line
			print (lcs ("This is a test", "I am not a test"))
			io.new_line
			print_sort (merge_sort (l))
		end

feature -- Access

	l: ARRAYED_LIST [INTEGER]
			-- `l'

	print_sort (a: ARRAYED_LIST [INTEGER])
			-- `print_sort'
		local i: INTEGER
		do
			from i := 1
			until i > a.count
			loop
				print (a[i].out + " ")
				i := i + 1
			end
		end
end
