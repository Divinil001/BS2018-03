note
	description: "LoopPainting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit

	ARGUMENTS

create
	make

feature

	n, length: INTEGER

	make
		local
			i: INTEGER
			out_str: STRING
			space: STRING
		do
			io.read_integer
			n := io.last_integer
			length := compute_length (n)
			from
				i := 1
			until
				i >= n + 1
			loop
				out_str := get_line (i)
				space := " "
				space.multiply(length - (get_line (i).capacity * 2) + 1)
				out_str := out_str + space
				out_str := out_str + reversed_line (i) + "%N"
				print (out_str)
				i := i + 1
			end
		end

	compute_length (numb: INTEGER): INTEGER
		local
			i, numb2: INTEGER
		do
			numb2 := numb.to_integer
			Result := 0
			if numb2 <= 5 then
				Result := 2 + 2 * numb2
			else
				Result := Result + 21
				from
					i := 6
				until
					i = numb2
				loop
					if i \\ 2 = 1 then
						Result := Result + 4
					else
						Result := Result + 2
					end
					i := i + 1
				end
			end
		end

	get_line (line: INTEGER): STRING
		local
			i, curr: INTEGER
			res: STRING
		do
			res := ""
			curr := 1
			from
				i := 2
			until
				i >= line + 1
			loop
				curr := curr + (i // 2)
				i := i + 1
			end
			if line \\ 2 = 0 then
				res := res + " "
			end
			from
				i := 0
			until
				i >= (line + 1) // 2
			loop
				res := res + curr.out + " "
				curr := curr + 1
				i := i + 1
			end
			Result := res
		end

	reversed_line (line: INTEGER): STRING
		local
			i, curr, curr_nums: INTEGER
			res: STRING
		do
			res := ""
			curr := 1
			from
				i := 2
			until
				i >= line + 1
			loop
				curr := curr + (i // 2)
				i := i + 1
				curr_nums := i
			end
			curr := curr + (curr_nums // 2)
			if line > 1 then
				curr := curr - 1
			end
			from
				i := 0
			until
				i >= (line + 1) // 2
			loop
				res := res + curr.out + " "
				curr := curr - 1
				i := i + 1
			end
			if line \\ 2 = 0 then
				res := res + " "
			end
			Result := res
		end

end
