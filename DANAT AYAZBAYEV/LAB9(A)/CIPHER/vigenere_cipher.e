note
	description: "Summary description for {VIGENERE_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VIGENERE_CIPHER

inherit
	CIPHER

feature
	encrypt (in : STRING; pas : STRING) : STRING
		local
			i : INTEGER
			ind : INTEGER
			x : INTEGER
		do
			Result := ""
			from i := 1 until i > in.count loop
				if in[i].is_upper then
					ind := ind + 1
					if ind > pas.count then
						ind := 1
					end
					x := (in[i].code + pas[ind].code - 130) \\ 26 + 65
					Result := Result + x.to_character_8.out
				else
					Result := Result + in[i].out
				end
				i := i + 1
			end
		end
	decrypt (in : STRING; pas : STRING) : STRING
		local
			i : INTEGER
			ind : INTEGER
			x : INTEGER
		do
			Result := ""
			from i := 1 until i > in.count loop
				if in[i].is_upper then
					ind := ind + 1
					if ind > pas.count then
						ind := 1
					end
					if in[i].code - pas[ind].code < 0 then
						x := in[i].code + 91 - pas[ind].code
						Result := Result + x.to_character_8.out
					else
						x := in[i].code - pas[ind].code + 65
						Result := Result + x.to_character_8.out
					end
				else
					Result := Result + in[i].out
				end
				i := i + 1
			end
		end

end
