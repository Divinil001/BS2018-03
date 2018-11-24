note
	description: "Summary description for {QUEUE1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUEUE1
	create

	make



feature



	make

		do

			create queue.make (0)

		end



	queue: ARRAYED_LIST [EVENT]



	add (n: STRING; t: INTEGER)

		local

			e: EVENT

			exist: BOOLEAN

			i: INTEGER

		do

			if t > 0 then

				create e.make (n, t)

				exist := False

				from i := 1

				until i > queue.count or exist = True

				loop

					if queue [i].time_tag = t then

						exist := True

					end

					i := i + 1

				end

				if exist = False then

					create e.make (n, t)

					queue.extend (e)

				end

			end

		end



	extract: EVENT

		local

			e: EVENT

			i: INTEGER

		do

			create e.make ("Queue is empty", 0)

			Result := e

			if queue.count > 0 then

				Result := queue [1]

				from i := 2

				until i > queue.count

				loop

					if queue [i].time_tag < Result.time_tag then

						Result := queue [i]

					end

					i := i + 1

				end

			end

		end



end
