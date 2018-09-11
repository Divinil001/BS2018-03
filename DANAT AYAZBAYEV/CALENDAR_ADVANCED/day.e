note
	description: "Summary description for {DAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DAY

create
	day_init

feature
	date : INTEGER
	events : ARRAYED_LIST[ENTRY]
	num_of_events : INTEGER

feature
	day_init (it_is_date_of : INTEGER)
		do
			set_this_date(it_is_date_of)
			create events.make (0)
			set_events_num(0)
		end
	set_events_num (events_num : INTEGER)
		do
			num_of_events := events_num
		end
	set_this_date (this_is_the_date : INTEGER)
		do
			date := this_is_the_date
		end
	add_event (en : ENTRY)
		do
			events.extend(en)
			num_of_events := num_of_events + 1
		end
	get_day : INTEGER
		do
			Result := date
		end
	get_overlapped : ARRAYED_LIST[ENTRY]
		local
			ENDED : BOOLEAN
			overlapped_events : ARRAYED_LIST[ENTRY]
			i : INTEGER
			j : INTEGER
		do
			create overlapped_events.make (0)
			from
				i := 1
			until
				i > num_of_events
			loop
				ENDED := FALSE
				from
					j := 1
				until
					j > num_of_events or ENDED = TRUE
				loop
					if events[i].get_start_time >= events[j].get_start_time and events[i].get_start_time <= events[i].get_end_time
					or events[i].get_end_time >= events[j].get_start_time and events[i].get_end_time <= events[j].get_end_time
					or events[i].get_owner = events[j].get_owner or events[i].get_place = events[j].get_place then
						ENDED := TRUE
						overlapped_events.extend (events[i])
					end
					j := j + 1
				end
				i := i + 1
			end
			Result := overlapped_events
		end
	print_events : STRING
		local
			i : INTEGER
		do
			Result := ""
			from
				i := 1
			until
				i > num_of_events
			loop
				Result := Result + "EVENT " + i.out + ":%N"
				Result := Result + "FROM " + events[i].get_start_time.out + ":00 TO " + events[i].get_end_time.out + ":00%N"
				Result := Result + "WILL BE HELD AT " + events[i].get_place + "%N"
				Result := Result + "BY: " + events[i].get_owners_name + "%N"
				Result := Result + "ABOUT: " + events[i].get_subject + "%N%N"
				i := i + 1
			end
		end
end

