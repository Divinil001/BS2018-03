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
	name_of_the_owner : STRING
	balance : INTEGER


feature

	make (n : STRING; b : INTEGER)

		do

			name_of_the_owner := n.twin
			balance := b

		end


feature

	deposit(a:INTEGER)

	do
		balance := balance + a

		if balance > 1000000 then

			print("Ur balance cant be more than 1000000 rubles, so we gave rest of the money to kittens %N")
			balance := 1000000

		end
	end

	withdraw(a:INTEGER)

	do
		balance := balance - a
	end

end
