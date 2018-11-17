class
	NEW_TEST_SET

inherit

	EQA_TEST_SET

feature -- Test routines

	the_same
			-- New test routine
		local
			app: APPLICATION
			i: INTEGER
		do
			create app.make
			from
				i := 1
			until
				i > 100
			loop
				app.add_event (i)
				i := i + 1
			end
			assert ("test1", app.the_same (3))
			assert ("test2", not app.the_same (-10))
		end

	add_event
		local
			app: APPLICATION
		do
			create app.make
			app.add_event (1)
			assert ("test1", app.a.count = 1 and app.the_same (1))
			app.add_event (1)
			assert ("test2", app.a.count = 1 and app.the_same (1))
			app.add_event (2)
			assert ("test3", app.a.count = 2 and app.the_same (2))

			create app.make
			app.add_event (7)
			app.add_event (2)
			assert("test4", app.a[1] = 2 and app.a[2] = 7)
			app.add_event (5)
			assert("test5", app.a[1] = 2 and app.a[2] = 5 and app.a[3] = 7)
		end

	remove_event
		local
			app: APPLICATION
			event: INTEGER
		do
			create app.make
			app.add_event (1)
			event := app.remove_event
			assert ("test1", event = 1 and app.a.count = 0)
		end

end
