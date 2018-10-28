note
	description: "Summary description for {INCOME_TAX}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INCOME_TAX
inherit
	SQUARE


create
	make

feature
	make
	do
		name := "INCOME TAX SQUARE"
	end

	action(p: player)
	do
		p.change_money (-ten_procents(p.money))
	end

	info:STRING
	do
		Result := "This is " + name + ". Player will loos ten procents of money.%N"
	end

	ten_procents(m: INTEGER): INTEGER
	local
		tmp: DOUBLE
		res: INTEGER
	do
		tmp := m / 10
		res := tmp.rounded
		res := res + (10 - res \\ 10)
		Result := res
	end
end
