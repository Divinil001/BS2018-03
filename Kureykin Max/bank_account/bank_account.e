note
	description: "Summary description for {BANK_ACCOUNT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BANK_ACCOUNT

create
	create_account

feature

	create_account(name:STRING; blnc:INTEGER)
	do
		set_owner(name)
		set_balance(blnc)
	end


feature
	owner:STRING
	balance:INTEGER

feature
	set_owner(name:STRING)
	do
		owner:=name
	end

	set_balance(blnc:INTEGER)
	do
		balance:=blnc
	end

	deposit(amount:INTEGER)
	require
		positive_amount : amount > 0
		max_balance : balance + amount < 1000000
	do
		balance:= balance + amount
	end

	withdraw(amount:INTEGER)
	require
		positive_balance: balance - amount > 100
		positive_amount: amount > 0
	do
		balance:=balance - amount
	end

end
