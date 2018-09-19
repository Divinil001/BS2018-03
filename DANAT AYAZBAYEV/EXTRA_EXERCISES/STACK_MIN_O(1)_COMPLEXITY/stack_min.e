note
	description: "STACK_MIN application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	STACK_MIN

inherit
	ARGUMENTS

create
	make

feature
	a : ARRAYED_LIST[PAIR]
	n : INTEGER

feature {NONE}
	make
		local
			type : STRING
			val : INTEGER
			i : INTEGER
			help : PAIR
		do
			create a.make (0)
			io.read_integer
			--n -> number of queries (push value, pop and min)
			n := io.last_integer
			from
				i := 1
			until
				i > n
			loop
				io.read_line
				type := io.last_string
				if type.is_equal ("push") then
					io.read_integer
					val := io.last_integer
					if a.count = 0 or val < a[a.count].get_min_before then
						create help.init(val, val)
					else
						create help.init(val, a[a.count].get_min_before)
					end
					a.extend (help)
					a.move(1)
				elseif type.is_equal ("pop") then
					a.move(-1)
					a.remove_right
				else
					print(a[a.count].get_min_before.out + "%N")
				end
				i := i + 1
			end
		end
end
