note
	description: "range application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	range_1: RANGE
	range_2: RANGE
	range_3: RANGE

	make
		do
			create range_1.summon(-3,9)
			create range_2.summon(-3,9)
			create range_3.summon(3,3)

			print("I am alive, piece of cake!")
			Io.new_line
			print(range_1.is_equal_range(range_2))
			Io.new_line
			print(range_3.is_empty)
			Io.new_line
			print(range_1.is_sub_range_of(range_3))
			Io.new_line
			print(range_3.is_sub_range_of(range_1))
			Io.new_line
			print(range_1.is_super_range_of(range_3))
			Io.new_line
			print(range_3.is_super_range_of(range_1))
		end
end
