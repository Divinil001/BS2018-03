class 
    BNF

create
    init
   
feature
    init
        do
            io.readline
			print (parse_expression (io.last_string).out)
        end
        
	parse_expression (input: STRING): BOOLEAN
		local
			i: INTEGER
			expression: BOOLEAN
		do
			print (input + "%N")
			expression := false
			from
				i := 1
			until
				i > input.count
			loop
				if input.at (i) ~ 'i' then
					result := parse_expression (input.substring (1, i - 2).out) and parse_expression (input.substring (i + 8, input.count).out)
					expression := true
				elseif input.at (i) ~ 'o' then
					result := parse_expression (input.substring (1, i - 2).out) and parse_expression (input.substring (i + 3, input.count).out)
					expression := true
				elseif input.at (i) ~ 'a' then
					result := parse_expression (input.substring (1, i - 2).out) and parse_expression (input.substring (i + 4, input.count).out)
					expression := true
				elseif input.at (i) ~ 'n' then
					result := parse_expression (input.substring (i + 4, input.count).out)
					expression := true
				end
				i := i + 1
			end
			if not expression then
				expression := parse_identifier (input)
			end
		end

	parse_identifier (input: STRING): BOOLEAN
		do
			print (input + "%N")
			result := input ~ "x" or input ~ "y" or input ~ "z"
		end
    
end
