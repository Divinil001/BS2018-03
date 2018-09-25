note
	description: "string application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	string:STRING
	count : INTEGER
	make
			-- Run application.
		do
			--| Add your code here
			string:="Hello"
			count := string.count
			reverse_str (string)
			io.new_line
			print(recursive_reverse (string))



		end

	reverse_str(str:STRING)
	local i:INTEGER -- reverse string using iterative ways
		do
			from
				i:=str.count
			until
				i<=0
			loop
				print(str[i])
				i:=i-1
			end
		end

		recursive_reverse (str : STRING) : STRING

		do

			if str.count < 1 then

				Result := ""

			else

				Result := recursive_reverse(str.substring (2, str.count)) + str.at(1).out

			end



		end





end
