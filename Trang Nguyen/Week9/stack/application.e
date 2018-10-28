note
	description: "stack application root class"
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
			-- Test stack
		local
            stack: MY_STACK [INTEGER]
            bounded_stack: MY_BOUNDED_STACK [INTEGER]
        do
            -- Add your code here
            create stack.make
            stack.push (1)
            stack.push (2)
            print (stack.item)
            io.new_line
            stack.remove
            print (stack.item)
            io.new_line
            print (stack.is_empty)
            io.new_line
            create bounded_stack.make_bounded (2)
            print (bounded_stack.is_empty)
            io.new_line
            bounded_stack.push (3)
            bounded_stack.push (2)
            bounded_stack.push (1)
            print (bounded_stack.item)
        end

end
