note
	description: "Bank application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	BANK_ACCOUNT

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			create_account("Ivan", 150)
			io.put_string (name)
			io.new_line
			io.put_integer (balance)
			deposit(40)
			io.new_line
			io.put_integer (balance)
			withdraw(10)
			io.new_line
			io.put_integer (balance)
		end
feature

	create_account(name_p: STRING; balance_p: INTEGER)
		do
			set_name(name_p)
			set_balance(balance_p)
		end

	set_name(n: STRING)
		do
			name:=n
		end
	name: STRING

	set_balance(b: INTEGER)
		do
			if
				(b>=100) and (b<=1000000)
			then
				balance:=b
			end
		end
	balance: INTEGER

	deposit(a: INTEGER)
		do
			if
				(balance+a<=1000000)
			then
				balance:= balance+a
			end
		end

	withdraw(k: INTEGER)
		do
			balance:= balance-k
		end

end
