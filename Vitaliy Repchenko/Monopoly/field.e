note
	description: "Summary description for {FIELD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD
create
	make
feature
	make(a_name: STRING; a_price, a_tax: INTEGER)
		do
			set_name(a_name)
			set_tax(a_tax)
			set_price(a_price)
			set_property(0)
		end

	set_name(a_name: STRING)
		do
			name:=a_name
		end

	set_tax(a_tax: INTEGER)
		do
			tax:=a_tax
		end

	set_price(a_price: INTEGER)
		do
			price:=a_price
		end

	set_property(a_property: INTEGER)
		do
			property:=a_property
		end

feature
	name: STRING
	tax: INTEGER
	price: INTEGER
	property: INTEGER
end
