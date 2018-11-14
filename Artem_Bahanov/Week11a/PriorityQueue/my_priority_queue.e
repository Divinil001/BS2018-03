class
	MY_PRIORITY_QUEUE[G -> COMPARABLE]

create
	make_empty

feature -- attributes
	elements: LINKED_LIST[G] -- list of elements in queue

feature -- creation procedures
	make_empty
	do
		create elements.make
	end

feature -- public routines
	insert(a: G)
	require
		elements.count < 100000
	do
		elements.extend(a)
	end

	extract: G
	require
		elements.count > 0
	local
		i, minI: INTEGER
		min: G
	do
		from
			i := 2
			min := elements[1]
			minI := 1
		until
			i > elements.count
		loop
			if min > elements[i] then
				min := elements[i]
				minI := i
			end
			i := i + 1
		end
		Result := elements[minI]
	--	print(minI.out + "%N")
		elements.prune(elements.at (minI))
	end

	print_q
	local
		i: INTEGER
	do
		from
			i := 1
		until
			i > elements.count
		loop
			print(elements[i].out + " ")
			i := i + 1
		end
		print("%N")
	end
end
