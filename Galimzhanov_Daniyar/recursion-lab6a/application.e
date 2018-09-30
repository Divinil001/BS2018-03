note
	description: "project_str_revrs application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	iterative_reverse_string(word:STRING):STRING
		local
			index1:INTEGER
		do
			Result:=""
			from
				index1:=word.count
			until
				index1=0
			loop
				Result:=Result + word.at (index1).out
				index1 := index1 - 1
			end

		end

feature
	recursive_reverse_string(word:STRING):STRING
		do
			if word.count=1 then
				Result:= word
			else
				Result:=word.at (word.count).out + recursive_reverse_string (word.substring (1, word.count-1))
			end
		end

feature
	merge_sort (array : ARRAYED_LIST[INTEGER]) : ARRAYED_LIST[INTEGER]
		local
			left : ARRAYED_LIST[INTEGER]
			right : ARRAYED_LIST[INTEGER]
			sorted_array : ARRAYED_LIST[INTEGER]
			index1 : INTEGER
			index2 : INTEGER
		do
			create left.make (0)
			create right.make (0)
			create sorted_array.make (0)
			if array.count = 1 then
				Result := array
			else
				from index1 := 1 until index1 > array.count // 2 loop
					left.extend (array[index1])
					index1 := index1 + 1
				end
				left := merge_sort(left)
				from index1 := array.count // 2 + 1 until index1 > array.count loop
					right.extend (array[index1])
					index1 := index1 + 1
				end
				right := merge_sort(right)
				from
					index1 := 1
					index2 := 1
				until
					index1 > left.count and index2 > right.count
				loop
					if index1 > left.count then
						sorted_array.extend (right[index2])
						index2 := index2 + 1
					elseif index2 > right.count then
						sorted_array.extend (left[index1])
						index1 := index1 + 1
					else
						if left[index1] < right[index2] then
							sorted_array.extend (left[index1])
							index1 := index1 + 1
						else
							sorted_array.extend (right[index2])
							index2 := index2 + 1
						end
					end
				end
				Result := sorted_array
			end
		end


feature
	word1:STRING

feature

	array_to_merge:ARRAYED_LIST[INTEGER]
	number_of_elements: INTEGER
	index:INTEGER

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			word1:=iterative_reverse_string ("Eiffel")
			--io.put_string(word1)
			--word1:=recursive_reverse_string ("Eiffel")
			create array_to_merge.make (0)
			number_of_elements := 7
			from
				index := 1
			until
				index > number_of_elements
			loop
				io.read_integer
				array_to_merge.extend(io.last_integer)
				index := index + 1
			end
			array_to_merge := merge_sort(array_to_merge)
			io.put_new_line
			io.putstring ("Sorted array" + "%N")
			from
				index := 1
			until
				index > number_of_elements
			loop
				print(array_to_merge[index].out)
				io.put_new_line
				index := index + 1
			end
		end

end
