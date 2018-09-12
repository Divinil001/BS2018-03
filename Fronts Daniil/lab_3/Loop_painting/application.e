note
	description: "Loop_painting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	list_to_string(l : LINKED_LIST[STRING]): STRING
	local
		jj : INTEGER
		res: STRING
	do
		res := ""
		from
			jj := 1
		until
			jj = l.count + 1
		loop
			res := res + l[jj] + " "
			jj := jj + 1
		end
		Result := res
	end

	spaces(h: INTEGER): STRING
	do
		Result := " "
		Result.multiply(h)
	end

	list_to_reversed_string(li : LINKED_LIST[STRING]): STRING
	local
		jjj : INTEGER
		res: STRING
	do
		res := ""
		from
			jjj := li.count
		until
			jjj = 0
		loop
			res := res + li[jjj] + " "
			jjj := jjj - 1
		end
		Result := res
	end

feature {NONE} -- Initialization
	num : INTEGER
	count_of_last_row : INTEGER
	nums_per_row: INTEGER
	j : INTEGER
	arrays: LINKED_LIST[LINKED_LIST[STRING]]
	i : INTEGER
	k : INTEGER
	row : LINKED_LIST[STRING]
	last_row : LINKED_LIST[STRING]
	last_string: STRING
	left: STRING
	right: STRING
	width: INTEGER
	make
		do
			create arrays.make
			create row.make
			create last_row.make
			left := ""
			right := ""
			j := 1
			last_string := ""
			nums_per_row := 0
			print("Write number:")
			io.read_integer
			num := io.last_integer
			count_of_last_row := (num + 1)//2
			from
				i := 0
			until
				i = num + 1
			loop
				if i \\ 2 /= 0 then
					nums_per_row := nums_per_row + 1
				end

				create row.make
				from
					k := 0
				until
					k = nums_per_row
				loop
					row.extend (j.out)
					k := k + 1
					j := j + 1
				end
				if not row.is_empty then
					arrays.extend (row)
				end
				i := i + 1
			end


	last_row := arrays[arrays.count]
	last_string := list_to_string(last_row)
	width := last_string.count * 2 + 1

	from
		i := 1
	until
		i = arrays.count + 1
	loop
		row := arrays[i]
		left := list_to_string(row)
		right := list_to_reversed_string(row)
		print(left + spaces(width - left.count*2) +right+"%N")
		i := i + 1
	end

	end
end
