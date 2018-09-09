note
	description: "Summary description for {BANK_ACCOUNT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BANK_ACCOUNT

create
	create_bank

feature
	name_of_owner:STRING
	balance:INTEGER

	deposit (a_num: INTEGER)
		do
			balance:= balance + a_num
		end

	withdraw (a_num: INTEGER)
		do
			balance:= balance - a_num
		end

	create_bank(a_name:STRING; a_balance:INTEGER)

		do
			name_of_owner:= a_name
			balance:= a_balance
		end

	invariant
		balance > 100 and balance < 1000000

end
