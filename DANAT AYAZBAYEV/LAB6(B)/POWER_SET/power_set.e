note
	description: "POWER_SET application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	POWER_SET

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make
		local
			n : INTEGER
			a : ARRAYED_LIST[INTEGER]
			i : INTEGER
			x : INTEGER
			j : INTEGER
			val : INTEGER
			one : INTEGER
		do
			io.read_integer
			n := io.last_integer
			create a.make (n)
			from
				i := 1
			until
				i > n
			loop
				io.read_integer
				a.extend (io.last_integer)
				i := i + 1
			end
			x := 2
			x := x.power (n).rounded
			print("{")
			from
				i := 0
			until
				i >= x
			loop
				print("{")
				val := i
				one := 0
				from
					j := 1
				until
					j > n
				loop
					if val \\ 2 = 1 then
						one := one + 1
					end
					val := val // 2
					j := j + 1
				end
				val := i
				from
					j := 1
				until
					j > n
				loop
					if val \\ 2 = 1 then
						one := one - 1
						print(a[j].out)
						if one /= 0 then
							print(", ")
						end
					end
					val := val // 2
					j := j + 1
				end
				print("}")
				if i /= x - 1 then
					print(", ")
				end
				i := i + 1
			end
			print("}")
		end

end
