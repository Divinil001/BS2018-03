note
	description: "Summary description for {BAG_1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAG_1
create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create boof
			create elements.make_filled (boof.create_cell (' ', 0), 1, 10000)
			m:=0
		end
feature

	add (val: CHARACTER; n: INTEGER)
		require
			n_are_not_equal: n>=0
		local
			i, i_1:INTEGER_32
			flag: BOOLEAN

		do
			flag:=false
			if m=0 then
				m:=1
				elements[m]:= boof.create_cell(val, n)
			else
				from
					i:=1
				until
					i = m+1
				loop
					if val = elements[i].value then
						flag:= true
						i_1:=i
					end
					i:=i+1
				end
				if flag = true then
					elements[i_1]:= boof.create_cell (val, elements[i_1].number_copies+n)
				else
					m:=m+1
					elements[m]:= boof.create_cell (val, n)
				end
			end
		end


	remove (val: CHARACTER; n: INTEGER)
		require
			n_are_not_equal: n>=0
		local
			i, i_1:INTEGER_32
			flag: BOOLEAN
		do
			i_1:=0
			from
				i:=1
			until
				i = m+1
			loop
				if val = elements[i].value then
					flag:= true
					i_1:=i
				end
				i:=i+1
			end
			if flag = true and elements[i_1].number_copies > n then
				elements[i_1]:= boof.create_cell (val, elements[i_1].number_copies - n)
			else
				if i_1 /= 0 then
				elements[i_1]:= boof.create_cell (' ', 0)
				from i:=i_1
				until i=m
				loop
				elements[i]:= boof.create_cell (elements[i+1].value, elements[i+1].number_copies)
				i:=i+1
				end
				elements[m]:= boof.create_cell (' ', 0)
				m:=m-1
				end
			end

		end


	min : CHARACTER
		local
			i: INTEGER_32
		do
			if m=0 then
				print("BAG is VOID")
			else
				from i := 1
				until i = m+1
				loop
					if i = 1 then
						Result:= elements[i].value
					else
						if Result > elements[i].value then
							Result:= elements[i].value
						end
					end
					i:=i+1
				end
			end
		end


	max: CHARACTER
		local
			i: INTEGER_32
		do
			if m=0 then
				print("BAG is VOID")
			else
				from i := 1
				until i = m+1
				loop
					if i = 1 then
						Result:= elements[i].value
					else
						if Result < elements[i].value then
							Result:= elements[i].value
						end
					end
					i:=i+1
				end
			end
		end

is_equal_bag (b: BAG_1): BOOLEAN
	local
		i,j: INTEGER_32
		flag : BOOLEAN
	do
		Result:= true
		if m = b.m then
			from
				i:=1
			until
				i = m+1
			loop
				from
					j:=1
				until
					j = m+1
				loop
					if b.elements[i].value = elements[j].value and b.elements[i].number_copies=elements[j].number_copies then
							flag:= true
					end
					j:=j+1
				end
				if flag = false then
					Result:= false
				end
				i:=i+1
			end
		else
			Result:=false
		end

	end

feature
	elements: ARRAY[CELL_INFO]
	m: INTEGER_32
	boof: BOOFER

end
