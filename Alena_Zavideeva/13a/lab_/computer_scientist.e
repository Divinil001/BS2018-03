class
	COMPUTER_SCIENTIST
inherit SCIENTIST

create make

feature
	make(name_: STRING; id_: INTEGER)
		do
			create name.make_from_string (name_)
			id := id_
			discipline :=  "Computer scientist"
		end
end
