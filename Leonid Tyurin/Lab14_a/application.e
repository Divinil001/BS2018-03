class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	rem: STRING

	make
		do
			io.readline
			rem := io.last_string.twin
			print(parse_I and parse_dont and parse_verb and parse_names and parse_quant and rem.count = 0)
		end

	parse_I: BOOLEAN
		do
			if rem.starts_with ("I") then
				result := true
				rem := rem.substring (2, rem.count)
			else
				result := false
			end
		end

	parse_dont: BOOLEAN
		do
			result := true
			if rem.starts_with (" do not") then
				rem := rem.substring (8, rem.count)
			end
		end

	parse_verb: BOOLEAN
		do
			if rem.starts_with (" like") or rem.starts_with (" hate") then
				result := true
				rem := rem.substring (6, rem.count)
			else
				result := false
			end
		end

	parse_names: BOOLEAN
		do
			result := parse_name
			from until not (rem.starts_with (" and") or rem.starts_with (",")) loop
				if rem.starts_with (" and") then
					rem := rem.substring (5, rem.count)
				else
					rem := rem.substring (2, rem.count)
				end
				result := result and parse_name
			end
		end

	parse_name: BOOLEAN
		do
			if rem.starts_with (" books") or rem.starts_with (" shoes") then
				result := true
				rem := rem.substring (7, rem.count)
			elseif rem.starts_with (" programming") then
				result := true
				rem := rem.substring (13, rem.count)
			elseif rem.starts_with (" football") then
				result := true
				rem := rem.substring (10, rem.count)
			else
				result := false
			end
		end

	parse_quant: BOOLEAN
		do
			result := true
			if rem.starts_with (" a lot") then
				rem := rem.substring (7, rem.count)
			elseif rem.starts_with (" a little") then
				rem := rem.substring (10, rem.count)
			end
		end

end
