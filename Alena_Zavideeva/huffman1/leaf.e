class
	LEAF
create make

feature
	value: INTEGER
	c: CHARACTER
	code: STRING
	make( c_ : CHARACTER)
		do
			c := c_
			value := 1
			code := ""
		end

feature -- Query
	get_char: CHARACTER
		do
			Result := c
		end
	get_val : INTEGER
		do
			Result := value
		end
	get_code : STRING
		do
			Result := code
		end
feature -- Command
	add_v
		do
			value := value + 1
		end
	set_v (i: INTEGER)
		do
			value := i
		end
	set_code(i: STRING)
		do
			code := i
		end
end
