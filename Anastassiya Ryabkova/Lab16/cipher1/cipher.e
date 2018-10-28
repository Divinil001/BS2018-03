note
	description: "Summary description for {CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CIPHER

	feature

		encrypt(str:STRING): STRING
		deferred
		end

		decrypt(str:STRING): STRING
		deferred
		end

end
