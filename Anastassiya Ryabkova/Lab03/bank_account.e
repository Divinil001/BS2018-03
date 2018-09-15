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

feature {NONE} -- Initialization
	name : STRING
	balance: INTEGER

	make
			-- Run application.
		do
			--| Add your code here
			balance := 100
			io.put_string ("Enter your name, please")
			io.new_line
			io.read_line
			set_name(io.last_string)

			io.put_string ("Enter the value of deposit")
			io.new_line
			io.read_integer
			deposit(io.last_integer)

			io.put_string ("Enter the value of withdraw")
			io.new_line
			io.read_integer
			withdraw(io.last_integer)



		end

	set_name(a_name:STRING)
	do
		name := a_name
	end

feature
	--deposit money
	deposit(money:INTEGER)
		do
			if money >0
				then
					if balance + money <= 100000 then
						balance := balance + money
						else
						io.put_string ("Your balance cannot be more than 100 000 rubels")
					end
			else
				io.put_string ("You enter incorrect ammount of money. It should be more than 0")
			end


		end
feature
	--withdraw money
	withdraw(money:INTEGER)
		do
			if money >0
						then
							if balance - money >=100 then
								balance := balance - money
								else
								io.put_string ("Your balance cannot be less than 100 rubels")
							end
					else
						io.put_string ("You enter incorrect ammount of money. It should be more than 0")
					end

		end

end
