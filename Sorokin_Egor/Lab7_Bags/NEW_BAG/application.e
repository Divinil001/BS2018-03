class
	APPLICATION

create
	make

feature
	bag1, bag2: MY_BAG

feature {NONE}

	make

		do
			create bag1.init
			bag1.add ('a', 3)
			bag1.add('b', 2)
			bag1.draw

			create bag2.init
			bag2.add('b', 2)
			bag2.add('a', 3)
			bag2.draw

			Io.put_character (bag1.min)
			Io.put_string ("%N")

			Io.put_character (bag2.max)
			Io.put_string ("%N")

			Io.put_boolean (bag1.is_equal_bag (bag2))
			Io.put_string ("%N")

			bag2 := bag2.remove ('b', 10)
			bag2.draw
			bag1 := bag1.remove ('c', 1)
			bag1.draw

			Io.put_boolean (bag1.is_equal_bag (bag2))
			Io.put_string ("%N")
		end

end
