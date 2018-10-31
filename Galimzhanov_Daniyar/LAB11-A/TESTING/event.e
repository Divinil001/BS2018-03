note
	description: "Summary description for {EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EVENT

create
	create_event

feature
	time_event:INTEGER
	descpt_event:STRING

feature
	create_event(desription: STRING; time:INTEGER)
		require
			not_empty: desription.count>0
			positive: time>0 and time <= 24
		do
			descpt_event:=desription
			time_event:=time
		end

	set_description(new_descr:STRING)
		do
			descpt_event:= descpt_event + "%N" + new_descr
		end

	get_time:INTEGER
		do
			Result:=time_event
		end

	get_description:STRING
		do
			Result:=descpt_event
		end
end
