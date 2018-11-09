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
	make(a_money, a_number: INTEGER)
	require
		valid_quantity_of_money: a_money >= 0
		valid_number: a_number > 0;
	do
		set_money(a_money)
		set_number(a_number)
		set_bankruptcy(false)
		create fields.make (0);
	end

feature {NONE}
	money: INTEGER
	number: INTEGER
	bankrupt: BOOLEAN
	fields: ARRAYED_LIST [FIELD]

	set_money(a_money: INTEGER)
	require
		valid_quantity_of_money: a_money >= 0
	do
		money := a_money
	ensure
		set_operation_was_succesful: money = a_money
	end

	set_number(a_number: INTEGER)
	require
		valid_number: a_number > 0
	do
		number := a_number
	ensure
		set_operation_was_succesful: number = a_number
	end

	set_bankruptcy(a_b: BOOLEAN)
	do
		bankrupt := a_b
	ensure
		set_operation_was_succesful: bankrupt = a_b
	end

	set_fields(a_fields: ARRAYED_LIST [FIELD])
	do
		fields := a_fields
	ensure
		fields.is_equal (a_fields)
	end

feature {ANY}
	get_money: INTEGER
	do
		Result := money
	ensure
		get_operation_was_succesful: Result = money
	end

	get_number: INTEGER
	do
		Result := number
	ensure
		get_operation_was_succesful: Result = number
	end

	is_bankrupt: BOOLEAN
	do
		Result := bankrupt
	ensure
		get_operation_was_succesful: Result = bankrupt
	end

	in_fields(a_field: FIELD): BOOLEAN
	local
		i: INTEGER
	do
		Result := false
		from
			i := 1
		until
			i > fields.count or not Result
		loop
			if fields.i_th (i).is_equal(a_field) then
				Result := true
			end
			i := i + 1
		end
	end

feature {PLAYER, FIELD}
	is_equal_to(a_player: PLAYER): BOOLEAN
	do
		Result := number = a_player.get_number
	end

	add_money(a_money: INTEGER)
	require
		not_bankrupt: not current.is_bankrupt
		valid_quantity_of_money: a_money >= 0
	do
		money := a_money + money
	ensure
		add_operation_was_succesful: money = old money + a_money
	end

	sub_money(a_money: INTEGER)
	require
		not_bankrupt: not current.is_bankrupt
		valid_quantity_of_money: a_money >= 0
		valid_sub: current.get_money > a_money
	do
		money := money - a_money
	ensure
		sub_operation_was_succesful: money = old money - a_money
	end

	zeroize_money
	do
		money := 0
	ensure
		zeroize_operation_was_succesful: money = 0
	end

	to_bankrupt
	require
		not_bankrupt: not current.is_bankrupt
	do
		bankrupt := true
		current.zeroize_money
		current.vanish_fields
	ensure
		is_bankrupt: current.is_bankrupt
	end

	add_field(a_field: FIELD)
	require
		unique_field: not current.in_fields(a_field)
	do
		fields.extend (a_field)
	ensure
		field_was_added: fields.count = old fields.count + 1 and not current.in_fields(a_field)
	end

	remove_field(a_field: FIELD)
	require
		valid_remove: current.in_fields(a_field)
	local
		new_fields: ARRAYED_LIST [FIELD]
		i: INTEGER
	do
		create new_fields.make (0)
		from
			i := 1
		until
			i > fields.count
		loop
			if not fields.i_th (i).is_equal(a_field) then
				new_fields.extend (fields.i_th (i))
			end
			i := i + 1
		end
		set_fields(new_fields)
	ensure
		remove_was_succesful: fields.count = old fields.count - 1 and not current.in_fields(a_field)
	end

	vanish_fields
	do
		from
		until
			fields.is_empty
		loop
			fields.remove
		end
	ensure
		was_vanished: fields.is_empty
	end

	deposit_something
	local
		x: INTEGER
	do
		print("Choose field: ")
		io.read_integer
		x := io.last_integer
		print("%N")
		if not (x <= fields.count and x >= 1) then
			print("Illegal one. Try again %N")
			deposit_something
		end
		fields.i_th (x).deposit
	end

invariant
	valid_quantity_of_money: money >= 0
	valid_number: number > 0
end
