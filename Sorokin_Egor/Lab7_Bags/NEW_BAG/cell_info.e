class
	CELL_INFO

create
	init

feature
	value: CHARACTER
	number_copies: INTEGER

feature

	init(value_: CHARACTER; number_: INTEGER)
		do
			value := value_
			number_copies := number_
		end

	increase(number_: INTEGER)
		do
			number_copies := number_copies + number_
		end

	decrease(number_:INTEGER)
		do
			if
				number_copies - number_ <= 0
			then
				number_copies := 0
			else
				number_copies := number_copies - number_
			end
		end

end
