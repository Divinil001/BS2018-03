note
	description: "Summary description for {CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CIPHER

feature -- Access

	decrypt (text: STRING): STRING
			-- `decrypt'
			deferred
			end

	encrypt (Text: STRING): STRING
			-- `encrypt'
			deferred
			end

end
