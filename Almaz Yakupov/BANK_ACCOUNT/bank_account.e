note
	description: "Summary description for {BANK_ACCOUNT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BANK_ACCOUNT

inherit
	ARGUMENTS

create
	make

feature
	make
		do
			Io.put_string("Account Name: ")
			Io.read_line
			account_name := Io.last_string

			account_balance := 0
			Io.put_string ("Primary balance: ")
			Io.read_integer
			deposit(Io.last_integer)
		end

feature
	account_name: STRING
	account_balance: INTEGER

feature
	get_name: STRING
		do
			Result := account_name
		end
	get_balance: INTEGER
		do
			Result := account_balance
		end
	deposit(cash: INTEGER)
		require
			cash_not_negative: cash >=0
		do
			account_balance := account_balance + cash
		end
	withdraw(cash: INTEGER)
		require
			cash_more_100: account_balance - cash >=100
		do
			account_balance := account_balance - cash
		end

end
