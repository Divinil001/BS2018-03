note
	description: "Summary description for {CLENDAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALENDAR
create
	fill_in

feature
	create_entry(a_date: DT_TIME; a_owner: PERSON; a_subject: STRING; a_place: STRING): ENTRY
	local
		entry: ENTRY
	do
		create entry.fill_in (a_date, a_owner, a_subject, a_place)
		Result := entry
	end

	edit_subject(e: ENTRY; new_subject: STRING)
	do
		e.set_subject (new_subject)
	end

	edit_date(e: ENTRY; new_date: DT_TIME)
	do
		e.set_date (new_date)
	end

	get_owner_name(e: ENTRY): STRING
	do
		Result := e.owner.name
	end

	in_conflict(e1: ENTRY; e2: ENTRY): BOOLEAN
	do
		Result := (e1.date.is_equal(e2.date) or e1.place.is_equal(e2.place))
	end

	add_entry(e: ENTRY; index: INTEGER)
	do
		current.days.at (index).events.extend (e)
	end

	add_day(date: INTEGER)
	local
		day: DAY
	do
		create day.fill_in (date)
		days.extend (day)
	end
	printable_month: STRING
	local
		ans: STRING
		cur: INTEGER
	do
		if current.days.is_empty then
			Result := " "
		else
			ans := ""
			across days as day loop
				ans := ans + cur.to_hex_string + ":"
				across day.item.events as event loop
					ans := ans + event.item.to_string + ";"
				end
				ans := ans + "|"
				cur := cur + 1;
			end
			Result := ans
		end
	end

feature
	days: ARRAYED_LIST [DAY]


feature {NONE} -- Initialization

	fill_in()
	local
	do
		create days.make(30)
	end
end
