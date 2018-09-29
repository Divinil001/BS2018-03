note
	description: "Summary description for {LCS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LCS

feature

	longest (a, b: STRING): STRING
		do
			if a.capacity > b.capacity then
				result := a
			else
				result := b
			end
		end

	lcs (a, b: STRING): STRING
		do
			Result := ""
			if a.capacity = 0 or b.capacity = 0 then
				Result := ""
			elseif a[a.capacity] = b[b.capacity] then
				Result := Result + a[a.capacity].out + lcs (a.substring (1, a.capacity - 1), b.substring (1, b.capacity - 1))
			else
				Result := Result + longest (lcs (a.substring (1, a.capacity - 1), b), lcs(a, b.substring (1, b.capacity - 1)))
			end
		end
end
