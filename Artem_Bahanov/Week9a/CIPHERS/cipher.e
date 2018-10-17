deferred class
	CIPHER

feature{CIPHER}
	start: INTEGER -- the number of 'A'
	once
		Result := 65
	end

	size: INTEGER -- size of alphabet - 1
	once
		Result := 26
	end
end
