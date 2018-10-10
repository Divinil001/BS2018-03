note
	description: "Huffman_Code application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	input: STRING
	dicti: STRING
	

	make
		local
			i: INTEGER
		do
			input := "Hello, my friend"
			print(input)
			Io.new_line

			dicti := ""
			from
				i := 1
			until
				i > input.capacity
			loop
				if dicti.has_substring(input.substring(i,i)) = False
				then
					dicti.append(input.substring(i,i))
				end
				i := i + 1
			end

			print(dicti)
		end

end
