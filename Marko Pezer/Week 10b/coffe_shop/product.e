note
	description: "Summary description for {PRODUCT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PRODUCT

feature

	name: STRING
	public_price: REAL
	price: REAL
	available: BOOLEAN

feature

	set_name (n: STRING)
	do
		name := n
	end

	set_public_price (p: REAL)
	do
		public_price := p
	end

	set_price (p: REAL)
	do
		price := p
	end

	set_available (b: BOOLEAN)
	do
		available := b
	end

	print_info
	do
		io.put_string ("- Article: " + name + "%N  Price: " + price.out + "%N  Public price: " + public_price.out + "%N  Available: " + available.out + "%N%N")
	end

end
