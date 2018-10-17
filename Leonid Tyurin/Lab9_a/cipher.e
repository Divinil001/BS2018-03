note
	description: "Summary description for {CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CIPHER

feature

	encrypt(text, key : STRING) : STRING
		deferred
		end

	decrypt(text, key : STRING) : STRING
		deferred
		end

end
