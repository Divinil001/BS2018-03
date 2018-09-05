note
	description: "bank application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make


feature
	b : BANK_ACCOUNT
	name : STRING
	balance: INTEGER

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			--print ("Hello Eiffel World!%N")

			print("Enter the name of the owner: ")
			Io.read_line
			name := Io.last_string.twin
			print("Enter balance: ")
			Io.read_integer
			balance := Io.last_integer

			if balance > 1000000 then

				print("Ur balance cant be more than 1000000. Please, change it: ")
				Io.read_integer
				balance := Io.last_integer

			end


			create b.make(name, balance)

			b.deposit(1)
			b.withdraw (10)

			print(b.balance)
		end

end
