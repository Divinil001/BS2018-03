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
			Io.put_string ("Your name: ")
			Io.read_line
			name_owner := Io.last_string

			balance := 0
			Io.put_string ("Your balance: ")
			Io.read_integer
			deposit(Io.last_integer)
			

		end
feature
	name_owner: STRING
	balance: INTEGER

feature
	get_name: STRING
		do
			Result := name_owner
		end
	get_balance: INTEGER
		do
			Result := balance
		end
	deposit(money: INTEGER)
		do
			if balance+money > 1000000 then
				Io.put_string ("Sorry, but YOU ARE TOO RICH!!! We can't help you%N")
				balance := 1000000
			else
				balance := money + balance
				Io.put_string ("Deposit has been successful%N")
			end

		end
	withdraw(money: INTEGER)
		do
			if balance - money < 100 then
				Io.put_string ("Sorry, but YOU ARE too POOR%N")
				balance := 100
			else
				balance := balance - money
				Io.put_string ("Withdrawal has been successful%N")
			end
		end

end
