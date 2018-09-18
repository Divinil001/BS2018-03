note
	description: "calendar application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature
	days: LIST[DAY]

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			--| Add your code here

		end

feature
	set_days(d: DAY)
		do
			days.extend(d)
		end

	add_entry(e: ENTRY; day: INTEGER)
		do
			days.go_i_th (day)
			days.item.set_event(e)
		end

	edit_subject(e: ENTRY; new_subject: STRING)
	 	do
	 		e.set(e.data, e.owner, new_subject, e.place)
	 	end

	 edit_data(e: ENTRY; new_data: TIME)
	 	do
	 		e.set(new_data, e.owner, e.subject, e.place)
	 	end

	get_owner_name(e: ENTRY):STRING
		 do
	 		Result:=e.owner.name
	 	end

	in_conflict(day: INTEGER): LIST[ENTRY]
		local
			i,j,n: INTEGER
			d1,d2: TIME
			p1,p2: STRING
		do
			days.go_i_th (day)
			n:=days.item.events.count
			from
				i:=1
			until
				i>=n
			loop
				from
					j:=1
				until
					j>=n
				loop
					days.go_i_th (day)
						days.item.events.go_i_th (i)
						d1:=days.item.events.item.data
						p1:=days.item.events.item.place

						days.item.events.go_i_th (j)
						d2:=days.item.events.item.data
						p2:=days.item.events.item.place
					if
						d1=d2 or p1=p2
					then
						days.go_i_th (day)
						Result:=days.item.events --  <--empty
					end
				end
			end
		end

	printable_month: LIST[ENTRY]
	 local
	 	i: INTEGER
	 do
	 	from
	 		i:=1
	 	until
	 		i>=31
	 	loop
	 		days.go_i_th (i)
	 		print(days.item.events)
	 	end
	 end

end
