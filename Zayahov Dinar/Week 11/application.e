note
	description: "queue application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here
			print("To make it easier to work with queue we assume that the queue must accept at least 4 events.")
			io.new_line
			create q.set_queue
			--test_case_1
			--test_case_2
			--test_case_3
			--test_case_4
		end

feature
	test_case_1
		do
			print("Test case 1 about extracting event.")
			io.new_line
			--create q.set_queue
			from
				i:=1
			until
				i>q.queue.count
			loop
				print(q.queue[i].name)
				print(" ")
				print(q.queue[i].time_tag)
				io.new_line
				i:=i+1
			end
			print("Result:")
			q.extract
		end

	test_case_2
		do
			print("Test case 2 about discarding negative tag event.")
			io.new_line
			print("Program will ask 4 events with positive time tag.")
			io.new_line
			--create q.set_queue
			from
				i:=1
			until
				i>q.queue.count
			loop
				print(q.queue[i].name)
				print(" ")
				print(q.queue[i].time_tag)
				io.new_line
				i:=i+1
			end
		end

	test_case_3
		do
			print("Test case 3 about required number of event.")
			io.new_line
			print("Program will ask preset number of events.")
			io.new_line
			--create q.set_queue
			from
				i:=1
			until
				i>q.queue.count
			loop
				print(q.queue[i].name)
				print(" ")
				print(q.queue[i].time_tag)
				io.new_line
				i:=i+1
			end
		end

	test_case_4
		do
			print("Test case 4 about events with the same time tag.")
			io.new_line
			print("Program will merg them.")
			io.new_line
			--create q.set_queue
			from
				i:=1
			until
				i>q.queue.count
			loop
				print(q.queue[i].name)
				print(" ")
				print(q.queue[i].time_tag)
				io.new_line
				i:=i+1
			end
		end

feature
	q: QUEUE_OF_EVENTS
	i: INTEGER

end
