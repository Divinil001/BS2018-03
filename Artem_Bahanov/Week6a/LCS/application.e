note
	description: "LCS application root class"
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
			io.put_string (lcs("wow", "hewowh"))
			io.read_character

		end


feature
	lcs(x, y: STRING): STRING
	do
		if x.count = 0 or y.count = 0 then
			Result := ""
		elseif x.tail (1) ~ y.tail (1) then
			Result := lcs(x.head (x.count - 1), y.head (y.count - 1))
			Result.append (x.tail(1))
		else
			Result := longest(lcs(x.head (x.count), y.head (y.count - 1)), lcs(x.head (x.count - 1), y.head (y.count)))
		end
	end

	longest(a, b: STRING): STRING
	do
		if a.count > b.count then
			Result := a
		else
			Result := b
		end
	end
end
