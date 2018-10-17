deferred class
	UNKEYED_CIPHER
inherit
	CIPHER
feature
	encrypt(text: STRING): STRING
	deferred
	end

	decrypt(text: STRING): STRING
	deferred
	end
end
