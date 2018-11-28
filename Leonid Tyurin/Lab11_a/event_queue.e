class
	EVENT_QUEUE

create
	make

feature

	queue : LINKED_PRIORITY_QUEUE[EVENT]

	make
		do
			create queue.make
		end

	is_empty: BOOLEAN
	do
		Result := queue.is_empty
	end

	clear
	do
		queue.wipe_out
	end

	add(e:EVENT)
	do
		if e.get_time > 0  then
			queue.extend (e)
		end
	end

	extract:EVENT
	do
		Result := queue.item
		queue.remove

		from
		until
			 queue.is_empty or else Result.get_time /= queue.item.get_time
		loop
			queue.remove
		end
	end

	next:EVENT
	do
		Result := queue.item
	end

end
