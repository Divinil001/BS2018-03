note
	description: "bank_account application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	acc1, acc2:BANK_ACCOUNT

	make
			-- Run application.
		do
			--| Add your code here
			create acc1.create_account("Max", 1500)
			create acc2.create_account("Ruslan", 1000)

			acc1.deposit (100)
			acc2.deposit(2500)

			print("Acc1: " + acc1.balance.out + " Acc2: " + acc2.balance.out + "%N")

			acc1.withdraw(150)
			acc2.withdraw(1000)

			print("Acc1: " + acc1.balance.out + " Acc2: " + acc2.balance.out + "%N")
		end

end
