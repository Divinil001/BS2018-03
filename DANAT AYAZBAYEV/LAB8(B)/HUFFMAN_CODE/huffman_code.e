note
	description: "HUFFMAN_CODE application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	HUFFMAN_CODE

inherit
	ARGUMENTS

create
	make

feature
	st : STRING --Given string of symbols

	a : ARRAYED_LIST[INTEGER]  --Ascii value of given symbols
	n : INTEGER  --Number of different given symbols
	i : INTEGER  --Variable/Iterator
	j : INTEGER  --Variable/Iterator

	used : ARRAYED_LIST[INTEGER] --Number of occurrences of every given symbol

	g_left : ARRAYED_LIST[INTEGER] --The left child of the vertex (ascii/number)
	g_right : ARRAYED_LIST[INTEGER] --The right child of the vertex (ascii/number)

	bit_left : ARRAYED_LIST[INTEGER] --The bit of the edge passing to the left child (0 or 1)
	bit_right : ARRAYED_LIST[INTEGER] --The bit of the edge passing to the left child (0 or 1)

	par : ARRAYED_LIST[INTEGER] --The parent of some non-root vertex (ascii/number)

	mx : INTEGER --Maximum value of ascii code of the given symbols	
	sum : INTEGER --Helper variable to find sum

	mn : INTEGER --Helper variable to find minimum
	mn2 : INTEGER --Helper variable to find second minimum

	ind : INTEGER --Helper variable to find the index of the minimum
	ind2 : INTEGER --Helper variable to find the index of the second minimum

	help : ARRAYED_LIST[INTEGER]
	--(help) -> The massive that contains roots of subtrees and suspends them to another root (merges)
	help2 : ARRAYED_LIST[INTEGER]
	--(helps) -> The massive like (help) but with the ascii values instead of weight values

	rev : ARRAYED_LIST[INTEGER] --Helped array which is needed to reverse the binary sequence

	cur_max : INTEGER --The maximum number(ascii) of some vertex in the tree

	x : INTEGER --Just the helper variable

	ans : STRING --Decoded string from binary sequence


feature {NONE}
	make
		do
			create a.make (0)
			io.read_line
			st := io.last_string.out
			from i := 1 until i > st.count loop
				mx := mx.max(st[i].code)
				i := i + 1
			end
			create used.make_filled(mx)
			from i := 1 until i > st.count loop
				used[st[i].code] := used[st[i].code] + 1
				if used[st[i].code] = 1 then
					n := n + 1
					a.extend (st[i].code)
				end
				i := i + 1
			end

			create help.make_filled (n)
			create help2.make_filled (n)
			from i := 1 until i > n loop
				help2[i] := a[i]
				i := i + 1
			end
			cur_max := mx
			from i := 1 until i > n loop
				help[i] := used[a[i]]
				sum := sum + used[a[i]]
				i := i + 1
			end
			create g_left.make_filled (mx + n - 1)
			create g_right.make_filled (mx + n - 1)
			create par.make_filled (mx + n - 1)
			create bit_left.make_filled (mx + n - 1)
			create bit_right.make_filled (mx + n - 1)
			from i := 1 until i > mx + n - 1 loop
				bit_left[i] := -1
				bit_right[i] := -1
				i := i + 1
			end
			from until help.count = 1 loop
				mn2 := sum
				mn := sum
				from i := 1 until i > help.count loop
					if help[i] <= mn then
						mn2 := mn
						ind2 := ind
						mn := help[i]
						ind := i
					elseif help[i] < mn2  then
						mn2 := help[i]
						ind2 := i
					end
					i := i + 1
				end

				cur_max := cur_max + 1

				par[help2[ind]] := cur_max
				par[help2[ind2]] := cur_max

				g_left[cur_max] := help2[ind]
				g_right[cur_max] := help2[ind2]

				bit_left[cur_max] := 1
				bit_right[cur_max] := 0

				help.extend (mn2 + mn)
				help2.extend (cur_max)

				help.go_i_th (ind)
				help.remove
				help2.go_i_th (ind)
				help2.remove

				help.go_i_th (ind2)
				help2.go_i_th (ind2)

				if ind < ind2 then
					help.move (-1)
					help2.move (-1)
				end
				help.remove
				help2.remove
			end
			st.mirror
			ans := ""
			create rev.make (0)
			if st.count = 1 then
				print("Only one distinct character%NNo need to encoding%N")
			else
				--encoding given string starts from here
				from
					i := 1
				until
					i > st.count
				loop
					from x := st[i].code until x = cur_max loop
						if g_left[par[x]] = x then
							rev.extend(1)
						else
							rev.extend(0)
						end
						x := par[x]
					end
					i := i + 1
				end
				from i := rev.count until i < 1 loop
					print(rev[i])
					i := i - 1
				end
				--encoding given string ends
				print("%N")
				io.read_line --byte sequence to decode
				st := io.last_string.out
				from
					i := 1
					x := cur_max
				until i > st.count or x < 1 loop
					if st[i].code - 48 = bit_left[x] then
						x := g_left[x]
					elseif st[i].code - 48 = bit_right[x] then
						x := g_right[x]
					else
						if x < 1 or x > mx or used[x] = 0 then
							x := -1    --it is done to break from the cycle
						else
							ans.extend (x.to_character)
							x := cur_max
							i := i - 1
						end
					end
					if i = st.count then
						if x < 1 or x > mx or used[x] = 0 then
							x := -1
						else
							ans.extend (x.to_character)
						end
					end
					i := i + 1
				end
				if x = -1 then
					print("Incorrect sequence%N")
				else
					print(ans)
				end
			end
		end
end
