note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

create
	create_calendar


feature
	days:ARRAY[DAY]

	create_calendar(num_of_days:INTEGER)
	local
		i:INTEGER
		day:DAY
		events_list_local:ARRAY[ENTRY]
	do
		create days.make_empty


		from
    		i := 1
		until
    		i >= num_of_days + 1
		loop
			create events_list_local.make_empty
			create day.create_day (i, events_list_local)
			days.force (day, days.count + 1)
    		i := i + 1
		end
	end

	create_entry(date:TIME; owner:PERSON; subject:STRING; place:detachable STRING):ENTRY
	local
		new_entry:ENTRY
	do
		create new_entry.create_entry(date, owner, subject, place)
		Result:=new_entry
	end

	add_entry(e:ENTRY; day:INTEGER)
	do
		days.at (day).events.force (e, days.at (day).events.count + 1)
	end

	edit_subject(e:ENTRY; new_subject:STRING)
	do
		e.set_subject (new_subject)
	end

	edit_date(e:ENTRY; new_date:TIME)
	do
		e.set_date (new_date)
	end

	get_owners_name(e:ENTRY):STRING
	do
		Result:=e.owner.name
	end

	in_coflict(day:INTEGER):ARRAY[ENTRY]
	local
		result_entry_list:ARRAY[ENTRY]
		i, j:INTEGER
	do
		create result_entry_list.make_empty

		from
    		i := 1
		until
    		i >= days.at(day).events.count
		loop

			from
    			j := i + 1
			until
    			j >= days.at(day).events.count + 1
			loop
				if days.at(day).events.at (i).date.out.is_equal(days.at(day).events.at (j).date.out) and attached{STRING} days.at(day).events.at(i).place as pl1 and attached{STRING} days.at(day).events.at(j).place as pl2 then
					if pl1.is_equal (pl2) then

						result_entry_list.force (days.at(day).events.at (i), result_entry_list.count + 1)
						result_entry_list.force (days.at(day).events.at (j), result_entry_list.count + 1)
					end
				end

    			j := j + 1
			end



    		i := i + 1
		end

		Result:=result_entry_list
	end

	printable_month:STRING
	local
		result_str:STRING
		i,j:INTEGER
		en:ENTRY
	do
		result_str:=""
		from
			i:=1
		until
			i >= days.count + 1
		loop

			result_str := result_str + "Day " + i.out + "%N"
			if days.at (i).events.count /= 0 then
				from
					j:=1
				until
					j >= days.at (i).events.count + 1
				loop
					en:=days.at (i).events.at (j)
					if attached{STRING} en.place as pl then
						result_str := result_str + "   " + "ENTRY: " + en.date.out + " " + pl + " " + en.subject + " " + en.owner.name+"%N"
					end
					j:= j + 1
				end
			else
				result_str := result_str + "   " + "FREE" + "%N"
			end
			i:= i + 1
		end
		Result:=result_str
	end

end
