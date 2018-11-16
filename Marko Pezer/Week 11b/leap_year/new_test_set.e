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
		redefine
			on_prepare
		end

feature {NONE} -- Events

	test: YEAR

	on_prepare
			-- <Precursor>
		do
			create test
		end

feature -- Test routines

	leap_year
			-- New test routine
		do
			assert ("Leap year: 2000", test.is_leap_year(2000) = True)
			assert ("Leap year: 1900", test.is_leap_year(1900) = False)
			assert ("Leap year: 2018", test.is_leap_year(2018) = False)
			assert ("Leap year: 1999", test.is_leap_year(1999) = False)
			assert ("Leap year: 2012", test.is_leap_year(2012) = True)
		end

end


