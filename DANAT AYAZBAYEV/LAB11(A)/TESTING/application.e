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
	a : ARRAYED_LIST[INTEGER]
	j : INTEGER

feature {NONE}
	make
		local
			n : INTEGER --Number of addings
			x : INTEGER --Current element to add
			i : INTEGER
			type : INTEGER --Type 0 to delete, type 1 to add
		do
			print("Enter the number of instructions%N")
			io.read_integer
			n := io.last_integer
			create a.make (n)
			from i := 1 until i > n loop
				print("Type 1 to enter the event into the queue%N")
				print("Type 0 to delete the front element from the queue%N%N")
				io.read_integer
				type := io.last_integer
				if type < 0 or type > 1 then
					i := i - 1
					print("Type 1 or 0!%N%N")
				elseif type = 0 then
					if a.empty then
						i := i - 1
						print("Queue is already empty!%N")
					else
						a.remove
					end
				else
					print("Enter the event time tag%N")
					io.read_integer
					x := io.last_integer
					if x < 0 then
						--NOTHING
					elseif a.empty then
						a.extend (x)
					else
						if x < a[a.count] then
							i := i - 1
							print("New time tag should be bigger or equal than the last time tag!%N")
						elseif x > a[a.count] then
							a.extend (x)
						end
					end
				end
				print("Your queue is:%N")
				from j := 1 until j > a.count loop
					print(a[j].out + " ")
					j := j + 1
				end
				print("%N%N")
			end
		end

end
