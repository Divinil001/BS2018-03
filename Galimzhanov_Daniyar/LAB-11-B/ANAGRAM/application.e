note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
    APPLICATION

inherit
    ARGUMENTS

create
    make
    
feature
    word:STRING
    
feature
    anagram(first, last: INTEGER)
	local
		i: INTEGER
		letter: CHARACTER
	do
		if first = last then
			print(word)
			io.new_line
		else
			from i := first until i > last loop
				letter := word [first]
				word [first] := word [i]
				word [i] := letter
				--recursion
				anagram(first + 1, last)
				
				letter := word [first]
				word [first] := word [i]
				word [i] := letter 
				i := i + 1
				end
			end
		end
    
    

feature {NONE} -- Initialization

    make
            -- Run application.
        do
            -- Add your code here
            
            word:="abc"
            anagram(1, word.count)
        end

end
