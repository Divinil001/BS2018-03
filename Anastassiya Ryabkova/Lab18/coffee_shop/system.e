note
	description: "Summary description for {SYSTEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM

	create make

	feature --initialization
		ESPRESSO:COFFEE
		CAPPUCCINO:COFFEE
		CAKE:PRODUCT

		count_esp, count_cap, count_cake :INTEGER
		make
			do
				create ESPRESSO
				create CAPPUCCINO
				create CAKE

				ESPRESSO.description:="ESPRESSO"
				CAPPUCCINO.description:="CAPPUCCINO"
				CAKE.description:="CAKE"

			end

			set_price_public (esp, cap, cak: REAL)

		require

			price_public_not_negative: esp >= 0.0 and cap >= 0.0 and cak >= 0.0

		do

			ESPRESSO.set_price_public (esp)

			CAPPUCCINO.set_price_public (cap)

			CAKE.set_price_public (cak)

		end



		set_price (esp, cap, cak: REAL)

		require

			price_public_not_negative: esp >= 0.0 and cap >= 0.0 and cak >= 0.0

		do

			ESPRESSO.set_price (esp)

			CAPPUCCINO.set_price (cap)

			CAKE.set_price (cak)

		end


		profit: REAL

		do

			Result := 0.0

			Result := (ESPRESSO.price_public - ESPRESSO.price) * espresso_count + (CAKE.price_public - CAKE.price) * cake_count + (CAPPUCCINO.price_public - CAPPUCCINO.price) * cappuccino_count

		end



	print_menu

		do

			print("***MENU**%N")

			print("Coffee: %N")

			print("%T" + ESPRESSO.description + ": " + ESPRESSO.price_public.out + "%N")

			print("%T" + CAPPUCCINO.description + ": " + CAPPUCCINO.price_public.out + "%N")

			print(CAKE.description + ": " + CAKE.price_public.out + "%N")

		end

end
