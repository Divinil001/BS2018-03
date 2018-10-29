deferred class
	UNKEYED_CIPHER

inherit
	CIPHER

feature

	encrypt (t: STRING): STRING
	deferred
	end

	decrypt(t: STRING): STRING
	deferred
	end

end
