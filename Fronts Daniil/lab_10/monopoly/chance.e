note
	description: "Summary description for {CHANCE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CHANCE
inherit
	SQUARE


create
	make

feature
	make
	do
		name := "CHANCE SQUARE"
	end

	action(p: PLAYER)
	local
		r: INTEGER
		sign: INTEGER
		g: GAME
	do
		create g.make
		if g.rand(2) = 1 then
			sign := 1
		else
			sign := -1
		end
		if sign = 1 then
			r := 10 * g.rand(20)
		else
			r := -10 * g.rand(30)
		end
		p.change_money (r)
	end

	info:STRING
	do
		Result := "%NThis is CHANCE square. Player will have extra money bonus or loose some money.%N"
	end

end
