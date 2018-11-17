class
	NEW_TEST_SET

inherit

	EQA_TEST_SET

feature -- Test routines

	year
		local
			app: APPLICATION
		do
			create app.make
			assert ("test1", app.is_leap_year (2000))
			assert ("test2", not app.is_leap_year (1999))
			assert ("test3", not app.is_leap_year (1900))
			assert ("test4", app.is_leap_year (2012))
		end

end
