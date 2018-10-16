note
	description: "hufmann application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}
	make -- entry point
	local
		l_str: STRING
		huff: HUFFMAN
		chars: BINARY_SEARCH_TREE_SET[CHARACTER]
	do
		l_str := "Here is your D"

		create huff.make (l_str)

		create chars.make
		chars.fill (l_str)

		from
			chars.start
		until
			chars.off
		loop
			print (chars.item.out + ": " + huff.encode (chars.item) + "%N")
			chars.forth
		end
	end

end
