note
	description: "Recursio_exercize_3 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create a.make_filled (0, 1, 5)

			a.put (2, 1)
			a.put (1, 2)
			a.put (5, 3)
			a.put (9, 4)
			a.put (3, 5)

			b:=recursion_sort(a)
			print(b)

		end
feature
	recursion_sort(alist: ARRAY[INTEGER]) : ARRAY[INTEGER]
		local
			mid, i, j, k : INTEGER
			lefthalf, righthalf, alist_2: ARRAY[INTEGER]
		do
			alist_2:= alist.subarray (alist.lower, alist.upper)

		    if alist_2.count>1 then
		        mid := (alist_2.upper+alist_2.lower) // 2
		        if mid = alist_2.lower+1 then
		        	lefthalf := alist_2.subarray (alist_2.lower, mid-1)
		        	righthalf := alist_2.subarray (mid, alist_2.upper)
		        else
		        	lefthalf := alist_2.subarray (alist_2.lower, mid)
		        	righthalf := alist_2.subarray (mid+1, alist_2.upper)
		        end
		        lefthalf := recursion_sort(lefthalf)
		        righthalf := recursion_sort(righthalf)

		        i:=lefthalf.lower
		        j:=righthalf.lower
		        k:=alist_2.lower
		        from
		        until i>lefthalf.upper or j>righthalf.upper
		        loop
		            if lefthalf[i]<righthalf[j] then
		                alist_2[k]:=lefthalf[i]
		                i:=i+1
		            else
		                alist_2[k]:=righthalf[j]
		                j:=j+1
		            end
		            k:=k+1
				end

		        from
		        until
		        	i>lefthalf.upper
		        loop
		        	alist_2[k]:=lefthalf[i]
		            i:=i+1
		            k:=k+1
		        end


		        from
		        until
		        	j>righthalf.upper
		        loop
		        	alist_2[k]:=righthalf[j]
		            j:=j+1
		            k:=k+1
		        end
		    end

		    Result:=alist_2
		end


feature
	a, b: ARRAY[INTEGER]
end
