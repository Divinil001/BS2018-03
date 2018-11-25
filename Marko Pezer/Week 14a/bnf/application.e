note
	description: "bnf application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}



	make
	local
		s, ss: STRING
		i, n: INTEGER
	do
		print_bnf
		io.put_string ("Test your strings...%N")
		io.put_string ("Enter number of strings: ")
		io.read_integer
		n := io.last_integer.twin
		io.put_new_line

		from i := 1
		until i > n
		loop
			io.put_string ("String " + i.out + ": %N")
			io.read_line
			ss := io.last_string

			s := format_string (ss)
			s := remove_long_names (s)

			if (is_correct (s) = True and check_brackets (ss) = True) then
				io.put_string ("VALID BOOLEAN EXPESSION %N")
			else
				io.put_string ("INVALID BOOLEAN EXPESSION %N")
			end

			io.put_new_line
			i := i + 1
		end
	end

	format_string (x: STRING): STRING
	local
		i: INTEGER
		tmp: STRING
	do
		tmp := ""

		from i := 1
		until i > x.count
		loop
			if x.item (i) /= ' ' then
				tmp.append (x.item (i).out)
			end
			i := i + 1
		end
		tmp := tmp.as_upper

		Result := tmp
	end

	remove_long_names (x: STRING): STRING
	local
		i: INTEGER
		tmp: STRING
	do
		tmp := ""

		from i := 1
		until i > x.count
		loop
			if x.item (i) = '(' or x.item (i) = ')' then
				-- Do nothing
			elseif x.item (i) = 'N' and x.item (i + 1) = 'O' and x.item (i + 2) = 'T' then
				i := i + 2
			elseif x.item (i) = 'O' and x.item (i + 1) = 'R' then
				tmp.append ("O")
				i := i + 1
			elseif x.item (i) = 'A' and x.item (i + 1) = 'N' and x.item (i + 2) = 'D' then
				tmp.append ("A")
				i := i + 2
			elseif x.item (i) = 'I' and x.item (i + 1) = 'M' and x.item (i + 2) = 'P' and x.item (i + 3) = 'L' and x.item (i + 4) = 'I' and x.item (i + 5) = 'E' and x.item (i + 6) = 'S' then
				tmp.append ("I")
				i := i + 6
			else
				tmp.append (x.item (i).out)
			end
			i := i + 1
		end

		Result := tmp
	end

	check_brackets (x: STRING): BOOLEAN
	local
		i: INTEGER
		open: INTEGER
		tmp: BOOLEAN
	do
		tmp := True
		open := 0

		from i := 1
		until i > x.count or tmp = False
		loop
			if x.item (i) = '(' then
				open := open + 1
			elseif x.item (i) = ')' then
				open := open - 1
				if open < 0 then
					tmp := False
				end
			enD
			i := i + 1
		end

		if open /= 0 then
			tmp := False
		end

		Result := tmp
	end

	is_correct (x: STRING): BOOLEAN
	local
		i: INTEGER
	do
		Result := True

		from i := 1
		until i > x.count or Result = False
		loop
			if i \\ 2 = 1 then
				if (x.item (i) /= 'X' and x.item (i) /= 'Y' and x.item (i) /= 'Z')  then
					Result := False
				end
			else
				if (x.item (i) /= 'I' and x.item (i) /= 'A' and x.item (i) /= 'O')  then
					Result := False
				end
			end
			i := i + 1
		end
	end

	print_bnf
	do
		io.put_string ("BNF GRAMMAR: %N")
		io.put_string ("<boolean_expression> ::== <expression> {<operator> <expression>}* %N")
		io.put_string ("<expression>         ::== ['NOT'] <variable> %N")
		io.put_string ("<operator>           ::== 'OR' | 'AND' | 'IMPLIES' %N")
		io.put_string ("<variable>           ::== 'X' | 'Y' | 'Z' %N")
		io.put_new_line
	end

end
