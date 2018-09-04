class
	APPLICATION

create
	make

feature

	make

		do
			create_account("Egor", 1000)
			Io.put_integer (balance)
			Io.put_string ("%N")
			deposit(5000)
			Io.put_integer (balance)
			Io.put_string ("%N")
			withdrow(4500)
			Io.put_integer (balance)
		end


feature
	name: STRING
	balance: INTEGER

feature
	create_account(n: STRING; money: INTEGER)
		do
			if money >= 100 and money <= 1000000
				then
					name := n
					balance := money
				else
					name := "There is no name"
					Io.put_string ("Incorrect amount of money%NAccount was not created%N")

			end
		end

	deposit(n: INTEGER)
		do
			if balance + n > 1000000 or balance < 100
				then
					Io.put_string ("Incorrect amount of money%NToo many money or account was not created%N")
				else
					balance := balance + n
			end
		end


	withdrow (n: INTEGER)
		do
			if balance - n < 100 or balance < 100
				then
					Io.put_string ("Incorrect amount of money%NNot enough money or account was nor created%N")
				else
					balance := balance - n
			end
		end
end
