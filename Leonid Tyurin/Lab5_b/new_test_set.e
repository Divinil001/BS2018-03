note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	NEW_TEST_SET

inherit

	EQA_TEST_SET
feature

	test_make
		local
			r: RANGE
		do
			create r.make (5, 10)
			assert ("left correct", r.left = 5)
			assert ("right correct", r.right = 10)
		end

	test_equal
		local
			r, r1, r2: RANGE
		do
			create r.make (5, 10)
			create r1.make (5, 10)
			create r2.make (5, 9)
			assert ("equal", r.is_equal_range (r1))
			assert ("not equal", not r.is_equal_range (r2))
		end

	test_sub_and_super
		local
			r, r1, r2, r3, r4, r5, r6, r7, r8: RANGE
		do
			create r.make (5, 10)
			create r1.make (5, 10)
			create r2.make (5, 9)
			create r3.make (6, 10)
			create r4.make (7, 7)
			create r5.make (4, 10)
			create r6.make (1, 5)
			create r7.make (11, 11)
			create r8.make (1, 0)
			assert ("5-10 is super of 5-10", r.is_super_range_of (r1))
			assert ("5-10 is super of 5-10", r1.is_super_range_of (r))
			assert ("5-10 is super of 5-9", r.is_super_range_of (r2))
			assert ("5-10 is super of 6-10", r.is_super_range_of (r3))
			assert ("5-10 is super of 7-7", r.is_super_range_of (r4))
			assert ("5-10 is not super of 4-10", not r.is_super_range_of (r5))
			assert ("5-10 is not super of 1-5", not r.is_super_range_of (r6))
			assert ("5-10 is not super of 11-11", not r.is_super_range_of (r7))
			assert ("5-10 is a super of <empty>", r.is_super_range_of (r8))

			assert ("5-10 is sub of 5-10", r1.is_sub_range_of (r))
			assert ("5-9 is sub of 5-10", r2.is_sub_range_of (r))
			assert ("6-10 is sub of 5-10", r3.is_sub_range_of (r))
			assert ("7-7 is sub of 5-10", r4.is_sub_range_of (r))
			assert ("4-10 is not sub of 5-10", not r5.is_sub_range_of (r))
			assert ("1-5 is not sub of 5-10", not r6.is_sub_range_of (r))
			assert ("11-11 is not sub of 5-10", not r7.is_sub_range_of (r))
			assert ("<empty> is sub of 5-10", r8.is_sub_range_of (r))
		end

	test_empty
		local
			r, r1, r2: RANGE
		do
			create r.make (3, 1)
			create r1.make (2, 2)
			create r2.make (3, 5)

			assert("3-1 is empty", r.is_empty)
			assert("2-2 is not empty", not r1.is_empty)
			assert("3-5 is not empty", not r2.is_empty)
		end

	test_overlaps
		local
			r, r1, r2, r3: RANGE
		do
			create r.make (5, 10)
			create r1.make (2, 6)
			create r2.make (10, 10)

			assert("5-10 left overlaps 2-6", r.left_overlaps (r1))
			assert("2-6 right overlaps 5-10", r1.right_overlaps (r))
			assert("5-10 overlaps 2-6", r.overlaps (r1))
			assert("2-6 overlaps 5-10", r1.overlaps (r))
			assert("5-10 right overlaps 10-10", r.right_overlaps (r2))
			assert("10-10 left overlaps 5-10", r2.left_overlaps (r))
			assert("2-6 not left overlaps 10-10", not r1.left_overlaps (r2))
			assert("2-6 not right overlaps 10-10", not r1.right_overlaps (r2))
			assert("2-6 not overlaps 10-10", not r1.overlaps (r2))
		end

	test_add
		local
			r, r1, r2, r3, r4, r5, r6: RANGE
		do
			create r.make (5, 10)
			create r1.make (8, 12)
			create r2.make (10, 12)
			create r3.make (11, 12)
			create r4.make (6, 9)
			create r5.make (1, 4)
			create r6.make (1, 0)

			assert("5-10 + 8-12", r.add (r1).is_equal_range (create {RANGE}.make (5, 12)))
			assert("5-10 + 10-12", r.add (r2).is_equal_range (create {RANGE}.make (5, 12)))
			assert("5-10 + 11-12", r.add (r3).is_equal_range (create {RANGE}.make (5, 12)))
			assert("5-10 + 6-9", r.add (r4).is_equal_range (create {RANGE}.make (5, 10)))
			assert("5-10 + 1-4", r.add (r5).is_equal_range (create {RANGE}.make (1, 10)))
			assert("8-12 + 5-10", r1.add (r).is_equal_range (create {RANGE}.make (5, 12)))
			assert("10-12 + 5-10", r2.add (r).is_equal_range (create {RANGE}.make (5, 12)))
			assert("11-12 + 5-10", r3.add (r).is_equal_range (create {RANGE}.make (5, 12)))
			assert("6-9 + 5-10", r4.add (r).is_equal_range (create {RANGE}.make (5, 10)))
			assert("1-4 + 5-10", r5.add (r).is_equal_range (create {RANGE}.make (1, 10)))

			assert("5-10 + <empty>", r.add (r6).is_equal_range (create {RANGE}.make (5, 10)))
			assert("<empty> + 5-10", r6.add (r).is_equal_range (create {RANGE}.make (5, 10)))
			assert("<empty> + <empty>", r6.add (r6).is_empty)
		end

	test_subtract
		local
			r, r1, r2, r3, r4, r5, r6: RANGE
		do
			create r.make (5, 10)
			create r1.make (8, 12)
			create r2.make (10, 12)
			create r3.make (11, 12)
			create r4.make (6, 9)
			create r5.make (1, 4)
			create r6.make (1, 0)

			assert("5-10 - 8-12", r.subtract (r1).is_equal_range (create {RANGE}.make (5, 7)))
			assert("5-10 - 10-12", r.subtract (r2).is_equal_range (create {RANGE}.make (5, 9)))
			assert("5-10 - 11-12", r.subtract (r3).is_equal_range (create {RANGE}.make (5, 10)))
			assert("8-12 - 5-10", r1.subtract (r).is_equal_range (create {RANGE}.make (11, 12)))
			assert("10-12 - 5-10", r2.subtract (r).is_equal_range (create {RANGE}.make (11, 12)))
			assert("11-12 - 5-10", r3.subtract (r).is_equal_range (create {RANGE}.make (11, 12)))
			assert("6-9 - 5-10", r4.subtract (r).is_empty)
			assert("1-4 - 5-10", r5.subtract (r).is_equal_range (create {RANGE}.make (1, 4)))

			assert("5-10 - <empty>", r.subtract (r6).is_equal_range (create {RANGE}.make (5, 10)))
			assert("5-10 - 5-10", r.subtract (r).is_empty)
			assert("<empty> + <empty>", r6.subtract (r6).is_empty)
		end


end


