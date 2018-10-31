note
	description: "Summary description for {MY_QUEUE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_QUEUE

create
	create_queue

feature
	array:ARRAYED_LIST[EVENT]

feature
	create_queue
		do
			create array.make(0)
		end

	add_event(descr:STRING; time:INTEGER)
		local
			event:EVENT
			index:INTEGER
			flag:BOOLEAN
		do

			if time <= 0 then
				print("Time can not be negative%N")
			else
				create event.create_event (descr, time)
				from
					index:=1
				until
					index>array.count
				loop
					if array.at (index).get_time = event.get_time  then
						event.set_description (array.at (index).get_description)
						array.go_i_th (index)
						array.remove
					end
					index:=index+1
				end

				array.force (event)
			end

		end


	get_info(i:INTEGER):STRING
		do
			Result:= "%N" + "Events: %N" + array.at (i).get_description + "%N" + "Time: %N" + array.at (i).get_time.out
		end

	count:INTEGER
		do
			Result:=array.count
		end

	remove_event
		local
			set:TWO_WAY_SORTED_SET[INTEGER]
			index:INTEGER
			index2:INTEGER
			flag:BOOLEAN
		do
			--sort
			create set.make

			from index:=1 until index>array.count loop
				set.force (array.at (index).get_time)
				index:=index+1
			end
			set.sort

			from index:=1 until flag=true loop
				from index2:=1 until index2>set.count loop
					if array.at (index).get_time = set.at (index2) then
						array.go_i_th (index2)
						array.remove
						set.go_i_th (index2)
						set.remove
						flag:=true
					end
					index2:=index2+1
				end
				index:=index+1
			end


		end

end
