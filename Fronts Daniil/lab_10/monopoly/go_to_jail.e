note
	description: "Summary description for {GO_TO_JAIL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GO_TO_JAIL
inherit
	SQUARE

create
	make

feature
	make
	do
		name := "GO TO JAIL SQUARE"
	end

	action(p: PLAYER)
	do
		p.to_jail
	end

	info:STRING
	do
		Result := "%NThis is " + name + ". Player will go to jail.%N"
	end
end
