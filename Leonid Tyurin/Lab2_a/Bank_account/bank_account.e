note
	description: "Summary description for {BANK_ACCOUNT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BANK_ACCOUNT
create
	make
feature

	make
		do
			NAME := "Leonid"
			BALANCE := 3000
			print(BALANCE)
			deposit(200000)
			Io.new_line
			print(BALANCE)
			withdraw(10000000)
			Io.new_line
			print(NAME)
			print(BALANCE)
		end

	NAME: STRING

	BALANCE: INTEGER

	deposit(money: INTEGER)
		require
			money + BALANCE <= 1000000
		do
			BALANCE := BALANCE + money
		end
	withdraw(money1: INTEGER)
		require
			BALANCE - money1 >= 100
		do
			BALANCE := BALANCE - money1
		end

end
