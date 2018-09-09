note
	description: "bank application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	BANK_ACCOUNT

inherit
	ARGUMENTS

create
	make

feature
	owner_name : STRING
	current_balance : INTEGER

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			owner_name := "DANAT"
			current_balance := 8006
			deposit(6967)
			withdraw(36000)

		end
	withdraw (sum : INTEGER)
		do
			if current_balance - sum < 100 then
				print("TOO SMALL BALANCE")
			else
				current_balance := current_balance - sum
			end
		end
	deposit (sum : INTEGER)
		do
			if current_balance + sum > 1000000 then
				print("TOO BIG BALANCE")
			else
				current_balance := current_balance + sum
			end
		end
end

