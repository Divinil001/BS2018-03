note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	a : ARRAYED_QUEUE[INTEGER]
	last : INTEGER --Last element in the queue

feature {NONE}
	make
		local
			n : INTEGER --Number of addings
			x : INTEGER --Current element to add
			i : INTEGER
			type : INTEGER --Type 0 to delete, type 1 to add
		do
			io.read_integer
			n := io.last_integer
			create a.make (n)
			from i := 1 until i > n loop
				io.read_integer
				type := io.last_integer
				if type < 0 or type > 1 then
					i := i - 1
					print("Type 1 or 0!%N")
				elseif type = 0 then
					if a.empty then
						i := i - 1
						print("Queue is already empty!%N")
					else
						a.remove
					end
				else
					io.read_integer
					x := io.last_integer
					if x < 0 then
						--NOTHING
					elseif a.empty then
						a.extend (x)
						last := x
					else
						if x < last then
							i := i - 1
							print("New time tag should be bigger or equal than the last time tag!%N")
						elseif x > last then
							a.extend (x)
							last := x
						end
					end
				end
				i := i + 1
			end
		end

end
