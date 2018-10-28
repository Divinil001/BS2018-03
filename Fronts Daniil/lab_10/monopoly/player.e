note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature
	is_bankrupt: BOOLEAN
	in_jail: BOOLEAN
	hodok: INTEGER
	name: STRING
	money: INTEGER
	square_ind: INTEGER
	make(new_name: STRING)
	do
		is_bankrupt := FALSE
		name := new_name
		money := 1500
		square_ind := 1
	end

	to_jail
	do
		print("%NPlayer " + name + " is moving to jail.%N")
		in_jail := True
		square_ind := 6
		hodok := 3
	end

	change_money(c: INTEGER)
	do
		money := money + c
	end

	balance
	do
		print("%NPlayer " + name + " now has " + money.out + ".%N")
	end

	change_square_ind(i: INTEGER)
	do
		square_ind := i
	end

	make_bankrupt
	do
		print("%N" + name + " is bankrupt now.%N")
		is_bankrupt := TRUE
	end

	butilka(f, s: INTEGER)
	local
		ans: STRING
	do
		print("%NPlayer " + name + " in jail. Will he pay 50 to exit? y\n%N")
		from
			ans := ""
		until
			ans ~ "y" or ans ~ "n"
		loop
			io.read_line
			ans := io.last_string.string
		end
		if ans ~ "y" then
			if money >= 50  then
				change_money(-50)
				print("%NDone%N")
				in_jail := false
				hodok := 0
			else
				print("%NNo enough money.%N")
			end
		else
			if f = s then
				print("%NPlayer " + name + " is lucky. He got " + f.out + " and " + s.out + ". He will exit.%N")
				in_jail := false
				hodok := 0
			end
		end
		hodok := hodok - 1
		if hodok = 0 then
			print("%NAfter 3 turns player " + name + " pays to exit jail.%N")
			change_money(-50)
			in_jail := false
		end
	end
end
