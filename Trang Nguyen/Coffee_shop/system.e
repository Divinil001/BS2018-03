note
	description: "Summary description for {SYSTEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM

create
	make

feature
	make (esp, cap, cak: INTEGER)
		require
			non_negative: esp >=0 and cap >=0 and cak >= 0
		do
			create espresso
			create cappuccino
			create cake
			num_espresso := esp
			num_cappuccino := cap
			num_cake := cak
		end
	espresso: ESPRESSO
	cappuccino: CAPPUCCINO
	cake: CAKE

	num_espresso, num_cappuccino, num_cake: INTEGER

	set_price_public (esp, cap, cak: REAL)
		require
			price_public_not_negative: esp >= 0.0 and cap >= 0.0 and cak >= 0.0
		do
			espresso.set_price_public (esp)
			cappuccino.set_price_public (cap)
			cake.set_price_public (cak)
		end

	set_price (esp, cap, cak: REAL)
		require
			price_public_not_negative: esp >= 0.0 and cap >= 0.0 and cak >= 0.0
		do
			espresso.set_price (esp)
			cappuccino.set_price (cap)
			cake.set_price (cak)
		end

	profit: REAL
		do
			Result := 0.0
			Result := (espresso.price_public - espresso.price) * num_espresso + (cake.price_public - cake.price) * num_cake + (cappuccino.price_public - cappuccino.price) * num_cappuccino
		end

	print_menu
		do
			print("MENU%N")
			print("Coffee: %N")
			print("%T" + espresso.description + ": " + espresso.price_public.out + "%N")
			print("%T" + cappuccino.description + ": " + cappuccino.price_public.out + "%N")
			print(cake.description + ": " + cake.price_public.out + "%N")
		end
end
