note
	description: "Summary description for {P_QUEUE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	P_QUEUE

create
	make

feature

	pq: ARRAY[EVENT]
	size: INTEGER
	ev: EVENT

	make
	do
		create ev.make ("Nothing", 0, 0)
		create pq.make_filled (ev, 1, 10000)
		size := 0
	end

	add_element (e: EVENT)
	local
		i, j: INTEGER
		set, flag: BOOLEAN
	do
		flag := False
		set := False

		if size = 0 then
			pq.put (e, 1)
			size := size + 1
		else
			from i := 1
			until i > size or flag = True
			loop
				if e.get_time = pq.item (i).get_time then
					io.put_string ("It's impossible to add this event! %N")
					flag := True

				elseif e.get_time < pq.item (i).get_time then

					from j := size
					until j < i
					loop
						pq.put (pq.item (j), j + 1)
						j := j - 1
					end
					pq.put (e, i)

					flag := True
					set := True
					size := size + 1
				end
				i := i + 1
			end

			if set = False then
				pq.put (e, size + 1)
				size := size + 1
			end
		end
	end

	get_element: EVENT
	do
		Result := pq.item (1)
	end

end
