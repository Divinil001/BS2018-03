class
	NEW_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	new_test_routine
			-- New test routine
		local
			pq: MY_PRIORITY_QUEUE[INTEGER]
		do
			create pq.make_empty
			pq.insert (29)
			pq.insert (1)
			pq.insert (10)
			pq.insert (7)
			assert("extract test (1)", pq.extract = 1)
			assert("extract test (2)", pq.extract = 7)
			pq.insert (12)
			pq.insert (4)
			assert("extract test (3)", pq.extract = 4)
		end

end


