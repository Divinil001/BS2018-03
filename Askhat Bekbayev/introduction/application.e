class
	APPLICATION

create
	execute

feature {NONE} -- Initialization

	name: STRING
	age: INTEGER
	mother_tongue: STRING
	has_a_cat: BOOLEAN

	execute
			-- Run application.
		do
			-- Add your code here.
			name := "Askhat"
			age := 17
			mother_tongue := "Kazakh"
			has_a_cat := False
			print("Name: " + name + "%N")
			print("Age: " )
			print(age)
			print("%N")
			print("Mother tongue: " + mother_tongue + "%N")
			print("Has a cat: ")
			print(has_a_cat)
		end


end
