note
	description: "Summary description for {BUYABLE_FIELD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BUYABLE_FIELD
inherit
	FIELD
	redefine
		act
	end
create
	make

feature
	make(a_name: STRING; a_cost, a_rent, a_deposit_term, a_deposit_days: INTEGER; a_industry: INDUSTRY; a_owner: detachable PLAYER)
	do
		set_name(a_name)
		set_cost(a_cost)
		set_rent(a_rent)
		set_deposit_term(a_deposit_term)
		set_deposit_days(a_deposit_days)
		set_industry(a_industry)
		set_owner(a_owner)
	end

feature
	act(a_player: PLAYER)
	local
		s: STRING
	do
		print("Welcome to ")
		print(current.get_name)
		if current.owner_exists and then not current.get_owner.is_equal(a_player) then
			print("Pay rent %N")
			from
			until
				a_player.get_money < rent
			loop
				a_player.deposit_something
			end
		elseif current.owner_exists and then a_player.is_equal_to (current.get_owner) then
			print("%N Choose you action: %N")
			print("1.Sell %N")
			if current.get_deposit_days = 0 then
				print("2.Deposit %N")
				io.read_line
				s := io.last_string
				if not s.is_equal ("Sell") and not s.is_equal ("Deposit")  then
					print("Illegal move try again %N")
					act(a_player)
				else
					if s.is_equal ("Sell") then
						sell
					else
						deposit
					end
				end
			else
				print("2.Cancel deposit %N")
				io.read_line
				s := io.last_string
				if not s.is_equal ("Sell") and not s.is_equal ("Cancel deposit")  then
					print("Illegal move try again %N")
					act(a_player)
				else
					if s.is_equal ("Sell") then
						sell
					else
						cancel_deposit
					end
				end
			end
		elseif not current.owner_exists then
			print("%N Choose you action: %N")
			print("1.Buy %N")
			io.read_line
			s := io.last_string
			if not s.is_equal("Buy") then
				print("Illegal move try again %N")
				act(a_player)
			else
				buy(a_player)
			end
		end
	end
end
