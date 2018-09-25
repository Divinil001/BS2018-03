note
	description: "Summary description for {LCS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LCS

feature -- Access

	lcs_help (x: STRING; y: STRING; i: INTEGER; j: INTEGER): STRING
			-- `lcs_help'
		do
			if i = 0 or j = 0 then
				Result := ""
			elseif x[i] = y [j] then
				Result := lcs_help (x, y, i - 1, j - 1) + x[i].out
			else
				if lcs_help (x, y, i, j - 1).count > lcs_help (x, y, i - 1, j).count then
					Result := lcs_help (x, y, i, j - 1)
				else
					Result := lcs_help (x, y, i - 1, j)
				end
			end
		end

	lcs (x: STRING; y: STRING): STRING
			-- `lcs'
		do
			Result := lcs_help (x, y, x.count, y.count)
		end

end
