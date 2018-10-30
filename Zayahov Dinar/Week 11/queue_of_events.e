note
	description: "Summary description for {QUEUE_OF_EVENTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUEUE_OF_EVENTS

create
	set_queue

feature
	queue: ARRAYED_LIST[EVENT]
	size: INTEGER

feature
	set_queue
		local
			name: STRING
			i,j,time: INTEGER
			e: EVENT
		do
			size:=3
			create name.make (0)
			create queue.make (0)
			from

			until
				queue.count>size
			loop
				print("Write name of your event: ")
				io.read_line
				name:=io.last_string.twin
				io.new_line
				print("Write time of your event: ")
				io.read_integer
				time:=io.last_integer
				if
					time>0
				then
					create e.set_event(time, name)
					queue.extend (e)
				else
					print("The event will not be added because of negative time.")
					io.new_line
				end


			end

			from
				i:=1
			until
				i>queue.count
			loop
				from
					j:=1
				until
					j>queue.count
				loop
					if
						i/=j
					then
						if
							queue[i].time_tag=queue[j].time_tag
						then
							if
								i>=j
							then
								queue.go_i_th (i)
								queue.remove
							else
								queue.go_i_th (j)
								queue.remove
							end
						end
					end
					j:=j+1
				end
				i:=i+1
			end
		end

	extract
		do
			sort
			io.new_line
			print(queue[1].name)
			print(" ")
			print(queue[1].time_tag)
		end

	sort
		local
			ev: EVENT
			i,j: INTEGER
		do
			from
				i:=1
			until
				i>queue.count
			loop
				from
					j:=1
				until
					j>queue.count
				loop
					if
						queue[i].time_tag<queue[j].time_tag
					then
						ev:=queue[j]
						queue[j]:=queue[i]
						queue[i]:=ev
					end
					j:=j+1
				end
				i:=i+1
			end
		end

end
