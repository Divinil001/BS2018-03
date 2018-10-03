note
	description: "power_set application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature

	res: ARRAYED_LIST [ARRAYED_LIST [INTEGER]]

	make
		local
			i, j: INTEGER
			set: ARRAYED_LIST [INTEGER]
			cur: ARRAYED_LIST [INTEGER]
		do
			create set.make (0)
			set.extend (1)
			set.extend (2)
			set.extend (3)
			create cur.make (0)
			create res.make (0)
			gen_power_set (set, 0, cur)

			from
				i := 1
			until
				i > res.count
			loop
				from
					j := 1
				until
					j > res[i].count
				loop
					print((res[i])[j])
					print(" ")

					j := j + 1
				end

				print("%N")

				i := i + 1
			end
		end

	gen_power_set (arr: ARRAYED_LIST [INTEGER] index: INTEGER cur: ARRAYED_LIST [INTEGER])
		local
			i, n: INTEGER
			tmp: ARRAYED_LIST [INTEGER]
		do
			print("Running gen_power_set%N")

			n := arr.count

			if index = n then
					-- do nothing
			else
				create tmp.make (0)
				tmp.copy (cur)
				res.extend (tmp)
				from
					i := index + 1
				until
					i > n
				loop
					cur.extend (arr [i])
					tmp.copy (cur)
					gen_power_set (arr, i, tmp);
					cur.prune(cur[cur.count])
					i := i + 1
				end
			end
		end

end
