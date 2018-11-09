note
	description: "Summary description for {FIELD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	FIELD
feature {NONE}
	name: STRING
	cost, rent, deposit_term, deposit_days: INTEGER
	industry: INDUSTRY
	owner: detachable PLAYER

feature {FIELD, INDUSTRY}
	set_name(a_name: STRING)
	do
		name := a_name
	ensure
		set_operation_was_succesful: name = a_name
	end

	set_cost(a_cost: INTEGER)
	require
		valid_cost: a_cost >= 0
	do
		cost := a_cost
	ensure
		set_operation_was_succesful: cost = a_cost
	end

	set_rent(a_rent: INTEGER)
	require
		valid_rent: a_rent >= 0
	do
		rent := a_rent
	ensure
		set_operation_was_succesful: rent = a_rent
	end

	set_deposit_term(a_deposit_term: INTEGER)
	require
		valid_deposit_term: a_deposit_term >= 0
	do
		deposit_term := a_deposit_term
	ensure
		set_operation_was_succesful: deposit_term = a_deposit_term
	end

	set_deposit_days(a_deposit_days: INTEGER)
	require
		valid_deposit_days: a_deposit_days >= 0
	do
		deposit_days := a_deposit_days
	ensure
		set_operation_was_succesful: deposit_days = a_deposit_days
	end

	set_industry(a_industry: INDUSTRY)
	do
		industry := a_industry
	ensure
		set_operation_was_succesful: industry = a_industry
	end

	set_owner(a_player: detachable PLAYER)
	do
		owner := a_player
	ensure
		set_operation_was_succesful: owner = a_player
	end


feature {ANY}
	get_name: STRING
	do
		Result := name
	ensure
		get_operation_was_succesful: Result = name
	end

	get_cost: INTEGER
	do
		Result := cost
	ensure
		get_operation_was_succesful: Result = cost
	end

	get_rent: INTEGER
	do
		Result := rent
	ensure
		get_operation_was_succesful: Result = rent
	end

	get_deposit_term: INTEGER
	do
		Result := deposit_term
	ensure
		get_operation_was_succesful: Result = deposit_term
	end

	get_deposit_days: INTEGER
	do
		Result := deposit_days
	ensure
		get_operation_was_succesful: Result = deposit_days
	end

	get_industry: INDUSTRY
	do
		Result := industry
	ensure
		get_operation_was_succesful: Result = industry
	end

	owner_exists: BOOLEAN
	do
		if attached owner as oowner then
			if oowner.is_bankrupt then
				oowner.remove_field (current)
				set_owner(Void)
				Result := false
			else
				Result := true
			end
		else
			Result := false
		end
	end

	get_owner: PLAYER
	require
		valid_getter: current.owner_exists
	do
		Result := current.get_owner
	ensure
		get_operation_was_succesful: Result = current.get_owner
	end

feature {FIELD}
	add_deposit_days(val: INTEGER)
	require
		valid_val: val >= 0
		valid_deposit: current.get_deposit_days + val <= current.get_deposit_term
	do
		deposit_days := deposit_days + val
		if deposit_days = deposit_term then
			remove_owner
		end
	ensure
		add_operation_was_succesful: deposit_days = old deposit_days + val
	end

	sub_deposit_days(val: INTEGER)
	require
		valid_val: val >= 0
		valid_deposit: current.get_deposit_days - val >= 0
	do
		deposit_days := deposit_days - val
	ensure
		sub_operation_was_succesful: deposit_days = old deposit_days - val
	end

	remove_owner
	require
		valid_remove: not current.owner_exists
	do
		current.get_owner.remove_field (current)
		set_owner(Void)
	ensure
		remove_was_succesful: current.get_owner = Void
	end

feature {ANY}
	act(a_player: PLAYER)
	do
	end

	buy(a_player: PLAYER)
	require
		valid_purchase: not current.owner_exists and a_player.get_money >= current.get_cost
	do
		a_player.sub_money (cost)
		a_player.add_field (current)
		set_owner(a_player)
	ensure
		purchase_was_succesful: current.owner_exists and then current.get_owner.is_equal(a_player) and then a_player.in_fields (current)
	end

	sell
	require
		valid_sale: not current.owner_exists
	do
		current.get_owner.add_money (cost // 2)
		current.get_owner.remove_field (current)
		set_owner(Void)
	ensure
		sale_was_succesful: current.get_owner = Void
	end

	deposit
	require
		valid_deposit: current.owner_exists and current.get_deposit_days = 0
	do
		add_deposit_days(1);
	ensure
		deposit_was_succesful: current.get_deposit_days = 1
	end

	cancel_deposit
	require
		valid_deposit:  current.get_deposit_days /= 0
		valid_owner: current.owner_exists and then current.get_owner.get_money >= current.get_cost
	do
		current.get_owner.sub_money (cost)
		deposit_days := 0
	ensure
		cancel_operation_was_succesful: deposit_days = 0
	end

invariant
	valid_cost: cost >= 0
	valid_rent: rent >= 0
	valid_deposit_term: deposit_term >= 0
	valid_deposit_days: deposit_days >= 0
end
