class
	APPLICATION

create
	make

feature

	make
		local
			x: INTEGER
			str: STRING

		do
			name := ""

			io.put_string ("Input your name: ")
			io.read_line
			str := io.last_string
			io.put_string ("Input your initial balance: ")
			io.read_integer
			x := io.last_integer
			create_account (str, x)
			io.put_new_line

			io.put_string ("Your name: ")
			io.put_string (name)
			io.put_new_line
			io.put_string ("Your initial balance: ")
			io.put_integer (balance)
			io.put_new_line
			io.put_new_line

			io.put_string ("Input amount to deposit: ")
			io.read_integer
			x := io.last_integer
			deposit(x)

			io.put_string ("Your current balance: ")
			io.put_integer (balance)
			io.put_new_line
			io.put_new_line

			io.put_string ("Input amount to withdraw: ")
			io.read_integer
			x := io.last_integer
			withdraw(x)

			io.put_string ("Your current balance: ")
			io.put_integer (balance)
			io.put_new_line
			io.put_new_line

		end

feature
	name: STRING
	balance: INTEGER

feature
	create_account(new_name: STRING; amount: INTEGER)
		do
			if amount < 100 then
					io.put_string ("ERROR! Amount is too low.")
					io.put_new_line
					io.put_string ("Account is not created.")
					io.put_new_line
				else
					if amount > 1000000 then
						io.put_string ("ERROR! Amount is too high.")
						io.put_new_line
						io.put_string ("Account is not created.")
						io.put_new_line
					else
						name := new_name
						balance := amount
					end
			end
		end

	deposit (amount: INTEGER)
		do
			if balance + amount < 100 then
					io.put_string ("ERROR! Amount is too low.")
					io.put_new_line
				else
					if balance + amount > 1000000 then
						io.put_string ("ERROR! Amount is too high.")
						io.put_new_line
					else
						balance := balance + amount
					end
			end
		end


	withdraw (amount: INTEGER)
		do
			if balance - amount < 100 then
					io.put_string ("ERROR! Amount is too low.")
					io.put_new_line
				else
					if balance - amount > 1000000 then
						io.put_string ("ERROR! Amount is too high.")
						io.put_new_line
					else
						balance := balance - amount

					end
			end
		end
end
