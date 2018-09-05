note
	description: "Summary description for {CALENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR

create
	init

feature
	days:ARRAYED_LIST[DAY]

feature

	init(num_of_days:INTEGER)
		local
			i:INTEGER
			day:DAY
		do
			create days.make (num_of_days)
			from
				i := 1
			until
				i > num_of_days
			loop
				create day.create_day (i)
				days.extend (day)
				i := i + 1
			end
		end

	add_entry(e:ENTRY; day:INTEGER)
		do
			days[day].events.extend(e)
		end

	edit_subject(e:ENTRY; new_subject:STRING)
		do
			e.set_subject (new_subject)
		end

	edit_date(e:ENTRY; new_date:TIME)
		do
			e.set_date (new_date)
		end

	get_owner_name(e:ENTRY):STRING
		do
			result := e.owner.name
		end

	in_conflict(day:INTEGER):ARRAYED_LIST[ENTRY]
		local
			output:ARRAYED_LIST[ENTRY]
			day_events:LIST[ENTRY]
		do
			create output.make (0)

			day_events := days[day].events

			across day_events as day_event_1
				loop
					across day_events as day_event_2
						loop
							if day_event_1.item /= day_event_2.item then
								if day_event_1.item.date.is_equal (day_event_2.item.date) then
									if not output.has (day_event_1.item) then
										output.extend (day_event_1.item)
									end
								end

								if day_event_1.item.place.is_equal (day_event_2.item.place)   then
									if not output.has (day_event_1.item) then
										output.extend (day_event_1.item)
									end
								end
							end
						end
				end
			result := output
		end

	printable_month:STRING
		local
			output:STRING
		do
			output := ""

			across days as day_it
				loop
					output.append ("day " + day_it.item.date.out + "%N")
					across day_it.item.events as event_it
						loop
							output.append ("%N    Time : " + event_it.item.date.out
										 + "%N    Event : " + event_it.item.subject
										 + "%N    Place : " + event_it.item.place + "%N%N")
						end
				end

			result := output
		end

end
