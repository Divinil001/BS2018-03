note
	description: "Summary description for {CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CIPHER

feature
	encrypt (in : STRING; pas : STRING) : STRING
		deferred
		end
	decrypt (in : STRING; pas : STRING) : STRING
		deferred
		end
end
