note
	description: "Summary description for {MY_BAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_BAG

create
	make

feature
	elements : ARRAY[CELL_INFO]
	name: STRING

feature
	make
	do
		name := ""
		create elements.make_empty
	end

	printable
	local
		i : INTEGER
	do
		print("HERE IS THE CHARACTERS IN BAG: " + name + "%N")
		from
			i := 1
		until
			i = elements.upper + 1
		loop
			elements[i].printable
			i := i + 1
		end
	end

	set_name(n: STRING)
	do
		name := n
	end

	add(val: CHARACTER; n: INTEGER)
	local
		i : INTEGER
		done : BOOLEAN
		new_cell : CELL_INFO
	do
		create new_cell.make(val, n)
		done := False
		from
			i := 1
		until
			i = elements.upper + 1
		loop
			if elements[i].value = val then
				elements[i].add (n)
				done := True
			end
			i := i + 1
		end
		if done /= True then
			elements.force (new_cell, elements.upper + 1)
		end
	end

	remove(val: CHARACTER; n: INTEGER)
	local
		i : INTEGER
	do
		from
			i := 1
		until
			i = elements.upper + 1
		loop
			if elements[i].value = val then
				elements[i].remove (n)
			end
			i := i + 1
		end
	end

	min : CHARACTER
	local
		i: INTEGER
		chr : CHARACTER
	do
		chr := elements[1].value
		from
			i := 2
		until
			i = elements.upper + 1
		loop
			if  elements[i].value < chr then
				chr := elements[i].value
			end
			i := i + 1
		end
		Result := chr
	end

	max : CHARACTER
	local
		i: INTEGER
		chr : CHARACTER
	do
		chr := elements[1].value
		from
			i := 2
		until
			i = elements.upper + 1
		loop
			if  elements[i].value > chr then
				chr := elements[i].value
			end
			i := i + 1
		end
		Result := chr
	end

	is_equal_bag(b: MY_BAG): BOOLEAN
	local
		i : INTEGER
		j : INTEGER
		exists : BOOLEAN
		counter : INTEGER
	do
		counter := 0
		from
			i := 1
		until
			i = elements.upper + 1
		loop
			exists := False
			from
				j := 1
			until
				j = b.elements.upper + 1
			loop
				if elements[i].is_equals(b.elements[j]) then
					exists := True
				end
				j := j + 1
			end
			if exists = True then
				counter := counter + 1
			end
			i := i + 1
		end
		if counter = elements.upper and elements.upper = b.elements.upper then
			Result := True
		else
			Result := False
		end
	end
end
