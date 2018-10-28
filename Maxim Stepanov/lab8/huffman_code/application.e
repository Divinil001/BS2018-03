note
	description: "huffman_code application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			bag: CHAR_BAG
			root: M_BINARY_TREE_NODE[BAG_PAIR[CHARACTER]]
			huffman: HUFFMAN_CODE
			str: STRING
			i, j, l: INTEGER
			encoded, decoded: STRING
			c: CHARACTER
		do
			create huffman.make

			create bag.make
			bag.consume ("A beautiful string")
			bag.sort

			root := huffman.build_tree(bag)

			huffman.traverse (root, "")

			str := "A beautiful string"
			encoded := ""
			decoded := ""
			from i := 1
			until i > str.count
			loop
				encoded := encoded + huffman.encode (root, str[i], "")

				i := i + 1
			end

			print("Encoded string: ")
			print(encoded)
			print("%N")

			from
			until encoded.count = 0
			loop
				c := '\'
				from
					j := 1
				until
					c /= '\'
				loop
					c := huffman.decode (root, encoded.substring (1, j), "")
					l := huffman.character_length (root, encoded.substring (1, j), "")

					j := j + 1
				end

				decoded := decoded + c.out

				encoded := encoded.substring (l + 1, encoded.count)
			end
			print("Decoded string: ")
			print(decoded)
			print("%N")


		end

end
