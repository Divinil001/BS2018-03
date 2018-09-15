note
	description: "Summary description for {CELL_INFO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CELL_INFO
create
	make
feature
	value: CHARACTER
	number_copies: INTEGER

feature
	make(v: CHARACTER)
		do
			set_value(v)
			number_copies:=0
		end
feature
	set_value(v: CHARACTER)
		do
			value:=v
		end
	add_number_copies(n: INTEGER)
		do
			number_copies:=max(number_copies+n, 0)
		end
	max(a,b: INTEGER): INTEGER
		do
			if
				a>b
			then
				Result:=a
			else
				Result:=b
			end
		end
end
