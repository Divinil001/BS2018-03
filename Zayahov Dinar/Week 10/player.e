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
	name: STRING assign set_name
	balance: REAL assign set_balance
	position: INTEGER assign set_position
	jail_counter: INTEGER assign set_counter
	properties:  ARRAYED_LIST[PROPERTY] assign set_properties

feature
	make(n: STRING; b: INTEGER; p: INTEGER; prop: ARRAYED_LIST[PROPERTY])
		do
			name:=n
			balance:=b
			position:=p
			properties:=prop
		end

	set_name(n:STRING)
		do
			name:=n
		end

	set_balance(b: REAL)
		do
			balance:=b
		end

	set_position(p: INTEGER)
		do
			position:=p
		end

	set_counter(c: INTEGER)
		do
			jail_counter:=c
		end

	set_properties(p: ARRAYED_LIST[PROPERTY])
		do
			properties:=p
		end

end
