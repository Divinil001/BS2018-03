class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			s: MY_STACK[INTEGER]
			b: MY_BOUNDED_STACK[INTEGER]
			-- Run application.
		do
			--| Add your code here
			print("MY_STACK TEST%N")
			create s.make_with_one_element(2)
			s.push (4)
			print(s.item)
			io.put_new_line
			s.remove
			s.push (5)
			s.push (10)
			print(s.item)
			io.put_new_line
			s.remove
			print(s.item)
			io.put_new_line

			print("%NMY_BOUNDED_STACK TEST%N")
			create b.make_empty(5)
			b.push (5)
			b.push (4)
			b.push (3)
			b.push (2)
			b.push (1)
			print(b.item)
			io.put_new_line
			b.remove
			b.remove
			print(b.item)
			io.put_new_line
			b.push (11)
			print(b.item)
			io.put_new_line
			b.remove
			b.remove
			print(b.item)
			io.put_new_line
		end

end
