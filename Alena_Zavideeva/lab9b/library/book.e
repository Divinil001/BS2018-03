class
	BOOK
create make

feature
	name: STRING
	id: INTEGER
	age_restrict: INTEGER
	avaliability: BOOLEAN
	day: DATE
	best_seller: BOOLEAN

	make(name_: STRING; age_restrict_: INTEGER; best_seller_: BOOLEAN; id_: INTEGER)
		do
			name := name_
			age_restrict := age_restrict_
			best_seller := best_seller_
			avaliability := True
			create day.make(2018, 1, 1)
			id := id_
		end

feature -- Query

	get_name : STRING
		do
			Result := name
		end

	is_avaliable: BOOLEAN
		do
			Result := avaliability
		end

	get_day_rent: DATE
		require
			someone_has_rent: avaliability = False
		do
			Result := day
		end

	is_best_seller : BOOLEAN
		do
			Result := best_seller
		end

	get_age_restrict : INTEGER
		do
			Result := age_restrict
		end

feature -- Command

	change_avaliability(b : BOOLEAN)
		do
			avaliability := b
		end

	change_day_rent(data : DATE)
		do
			day := data
		end
end
