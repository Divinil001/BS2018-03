note
	description: "longest_common_subsequence application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	a, b, ans: STRING
	lcs_oper: LCS

	make
		do
			a := "ACBCED"
			b := "ACDDDDDEFD"

			create lcs_oper

			ans := lcs_oper.lcs(a, b)
			ans.mirror

			io.put_string ("Longest common subsequence is: " + ans + "%N")

		end

end
