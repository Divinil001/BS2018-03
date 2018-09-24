note
	description: "SORTING_ALGORITHM application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	SORTING_ALGORITHM

inherit
	ARGUMENTS

create
	make

feature
	a : ARRAYED_LIST[INTEGER]
	n : INTEGER

feature
	merge_sort (res : ARRAYED_LIST[INTEGER]) : ARRAYED_LIST[INTEGER]
		local
			b : ARRAYED_LIST[INTEGER]
			c : ARRAYED_LIST[INTEGER]
			sorted : ARRAYED_LIST[INTEGER]
			i : INTEGER
			j : INTEGER
		do
			create b.make (0)
			create c.make (0)
			create sorted.make (0)
			if res.count = 1 then
				Result := res
			else
				from i := 1 until i > res.count // 2 loop
					b.extend (res[i])
					i := i + 1
				end
				b := merge_sort(b)
				from i := res.count // 2 + 1 until i > res.count loop
					c.extend (res[i])
					i := i + 1
				end
				c := merge_sort(c)
				from
					i := 1
					j := 1
				until
					i > b.count and j > c.count
				loop
					if i > b.count then
						sorted.extend (c[j])
						j := j + 1
					elseif j > c.count then
						sorted.extend (b[i])
						i := i + 1
					else
						if b[i] < c[j] then
							sorted.extend (b[i])
							i := i + 1
						else
							sorted.extend (c[j])
							j := j + 1
						end
					end
				end
				Result := sorted
			end
		end

feature {NONE}
	make
		local
			i : INTEGER
		do
			create a.make (0)
			io.read_integer
			n := io.last_integer
			from i := 1 until i > n loop
				io.read_integer
				a.extend(io.last_integer)
				i := i + 1
			end
			a := merge_sort(a)

			from i := 1 until i > n loop
				print(a[i].out + " ")
				i := i + 1
			end
		end

end
