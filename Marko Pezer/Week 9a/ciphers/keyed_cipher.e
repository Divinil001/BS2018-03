deferred class
	KEYED_CIPHER

inherit
	CIPHER

feature

	decrypt (t: STRING; k: STRING): STRING
	deferred
	end

	encrypt (t: STRING; k: STRING): STRING
	deferred
	end

end
