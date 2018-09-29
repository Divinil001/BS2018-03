note
	description: "Summary description for {SORT_ARRAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SORT_ARRAY
create
	make

feature

	make
	do

	end

	sort_arr (arr: ARRAY[INTEGER]; n: INTEGER): ARRAY[INTEGER]
	local
		i, j, x: INTEGER
		ans: ARRAY[INTEGER]
	do
		ans := arr

		from i := 1
		until i > n
		loop
			from j := i + 1
			until j > n
			loop
				if ans.item(i) > ans.item(j)  then
					x := ans.item(j)
					ans.item(j) := ans.item(i)
					ans.item(i) := x
				end
				j := j + 1
			end
			i := i + 1
		end
		Result := ans
	end

end
