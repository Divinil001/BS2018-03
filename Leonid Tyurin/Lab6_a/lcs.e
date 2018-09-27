note
	description: "Summary description for {LCS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LCS

feature

	max(a, b : INTEGER):INTEGER
		do
			if a > b then
				result := a
			else
				result := b
			end
		end

	lcs(a, b : STRING):INTEGER
		do
			if a.capacity = 0 or b.capacity = 0 then
				result := 0
			elseif a[a.capacity] = b[b.capacity] then
				result := 1 + lcs(a.substring (1, a.capacity-1), b.substring (1, b.capacity-1))
			else
				result := max(lcs(a.substring (1, a.capacity-1), b), lcs(a, b.substring (1, b.capacity-1)))
			end
		end
end
