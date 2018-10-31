note
	description: "testing application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	queue:MY_QUEUE
	i:INTEGER
	j:INTEGER


feature {NONE}

	make

		do
			create queue.create_queue
			queue.add_event ("work", 4)
			queue.add_event ("coffee", 3)
			--remove command will remove events with lower time tag
			queue.add_event ("relax", 5)
			queue.add_event ("work2", 6)
			queue.add_event ("coffee2", 6)
			--work2 and coffe2 events will be merged
			queue.add_event ("SOMETHING EXTRA WEIRD", -2 ) -- it will print that it is impossible

			queue.remove_event
			queue.remove_event
			io.new_line
			print(queue.get_info (1))
			io.new_line
			print(queue.get_info (2))
			io.new_line



		end

end
