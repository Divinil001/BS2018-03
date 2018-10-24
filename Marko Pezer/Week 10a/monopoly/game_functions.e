note
	description: "Summary description for {GAME_FUNCTIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_FUNCTIONS

feature

	player_in_jail (p: PERSON; a: INTEGER; b: INTEGER)
	local
		flag: INTEGER
	do
		if p.days_in_jail = 1 then
			if p.money < 50000 then
				p.set_loser (True)
				io.put_string ("You have no enough money to go out of jail. You lose!%N%N")
			else
				p.set_days_in_jail (0)
				p.lose_money (50000)
				io.put_string ("You must pay 50000 RUB to go out of jail!%N%N")
			end
		else
			io.put_new_line
			io.put_string ("Do you want to pay 50000 RUB to go out from jail?%NType 1 for YES or 0 for NO: ")
			io.read_integer
			flag := io.last_integer.twin

			if flag = 1 then
				if p.money < 50000 then
					io.put_string ("You can not pay to go out of jail! %N%N")
				else
					p.set_days_in_jail (0)
					p.lose_money (50000)
					io.put_string ("You are out of jail! %N%N")
				end
			else
				if a = b then
					p.set_days_in_jail (0)
					io.put_string ("You are going out from jail! %N%N")
				end
			end
		end
	end

	-- Calculate position of player after the move

	move (pos: INTEGER; n: INTEGER): INTEGER
	do
		Result := ((pos + n - 1) \\ 20) + 1
	end

end
