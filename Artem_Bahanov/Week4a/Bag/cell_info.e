class
	CELL_INFO
	create make

	feature
		value: CHARACTER assign set_value
		number_copies: INTEGER

	feature
		make(value_n: CHARACTER)
		do
			set_value(value_n)
			number_copies := 0
			ensure
				equal_to_one: number_copies = 0
		end

	feature
		set_value(value_n: CHARACTER)
		do
			value := value_n
		end
	feature
		add_number_copies(n: INTEGER)
		do
			number_copies := max(number_copies + n, 0)
			ensure
				k: number_copies >= 0
		end


	feature
		max(a, b: INTEGER): INTEGER
		do
			if a > b then
				Result := a
			else
				Result := b
			end
		end
end
