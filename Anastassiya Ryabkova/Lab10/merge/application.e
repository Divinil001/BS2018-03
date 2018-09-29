note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
		l: ARRAYED_LIST [INTEGER]

	make
			-- Run application.
		do

			create l.make (0)

			l.extend (5)

			l.extend (15)

			l.extend (87)

			l.extend (9)

			l.extend (0)
			print(merge_sort (l))
			end
			--| Add your code here
		merge_sort (a: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [INTEGER]

		local

		    list, list2: ARRAYED_LIST [INTEGER]

		    i: INTEGER

		do

		    create Result.make (0)

			create list.make (0)

			create list2.make (0)

			if a.count = 1 then Result.extend (a[1])

			else

			    from i := 1

			    until i > a.count //2

			    loop

			        list.extend (a[i])

			        i := i + 1

			    end

			    from i := a.count // 2 + 1

			    until i > a.count

			    loop

			    	list2.extend (a[i])

			    	i := i + 1

			    end

			    list := merge_sort (list)

			    list2 := merge_sort (list2)

			    Result := merge (list, list2)

			end

		end



	merge (a: ARRAYED_LIST [INTEGER]; b: ARRAYED_LIST [INTEGER]): ARRAYED_LIST [INTEGER]

		local

			i, j, k: INTEGER

		do

			create Result.make (0)

			if a.count > 0 and b.count > 0 then

				from

					i := 1

					j := 1

				until

					i > a.count or j > b.count

				loop

					if a[i] > b[j] then

						Result.extend (b[j])

						j := j + 1

					else

						Result.extend (a[i])

						i := i + 1

					end

				end

				if i <= a.count then

					from k := i

					until k > a.count

					loop

						Result.extend (a[k])

						k := k + 1

					end

				end

				if j <= b.count then

					from k:= j

					until k > b.count

					loop

						Result.extend (b[k])

						k := k + 1

					end

				end

			end



		end
		end


