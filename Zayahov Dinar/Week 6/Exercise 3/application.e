note
	description: "sorting application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	unsorted_list: ARRAYED_LIST[INTEGER]

feature {NONE} -- Initialization

	make
	-- Run application.

		local
			i: INTEGER
			length, n: INTEGER
		do
			--| Add your code here
			create unsorted_list.make(0)
			io.read_integer
			length:=io.last_integer
			from
				i:=1
			until
				i>length
			loop
				io.read_integer
				unsorted_list.extend(io.last_integer)
				i:=i+1
			end
			--print(unsorted_list)
			print(merge_sort(unsorted_list))
end


feature -- Access
	merge_sort (a: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [INTEGER]
			-- `merge_sort'
		local
		    l1, l2: ARRAYED_LIST [INTEGER]
		    i: INTEGER
		do
		    create Result.make (0)
			create l1.make (0)
			create l2.make (0)
			if a.count = 1 then Result.extend (a[1])
			else
			    from i := 1
			    until i > a.count //2
			    loop
			        l1.extend (a[i])
			        i := i + 1
			    end
			    from i := a.count // 2 + 1
			    until i > a.count

			    loop
			    	l2.extend (a[i])
			     		i := i + 1
			    end
			    l1 := merge_sort (l1)
			    l2 := merge_sort (l2)
			    Result := merge (l1, l2)
			end
		end

	merge (a: ARRAYED_LIST [INTEGER]; b: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [INTEGER]
			-- `merge'
		local
			i, j, k: INTEGER
		do
			create Result.make (0)
			if a.count > 0 and b.count > 0 then
				from
					i := 1
					j := 1
				until
					i > a.count or j > b.count
				loop
					if a[i] > b[j] then
						Result.extend (b[j])
						j := j + 1
					else
						Result.extend (a[i])
						i := i + 1
					end

				end
				if i <= a.count then
					from k := i
					until k > a.count
					loop
						Result.extend (a[k])
						k := k + 1
					end
				end
				if j <= b.count then
					from k:= j
					until k > b.count
					loop
						Result.extend (b[k])
						k := k + 1
					end
				end
			end
		end
end
