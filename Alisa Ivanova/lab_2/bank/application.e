note
	description: "bank application root class"
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
			local
				b: BANK_ACCOUNT
				a_name: STRING
				a_balance: INTEGER
		do
			io.put_string ("Enter name of owner:")
			io.read_line
			a_name:= io.last_string

			io.put_string ("Enter the balance:")
			io.read_integer
			a_balance:= io.last_integer

			create b.create_bank (a_name, a_balance)
		end

end
