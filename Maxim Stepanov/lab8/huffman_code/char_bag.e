note
	description: "Summary description for {CHAR_BAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CHAR_BAG

create
	make

feature
	chars: ARRAYED_LIST[BAG_PAIR[CHARACTER]]
	empty_pair: BAG_PAIR[CHARACTER]

	make
	do
		create chars.make (0)
		create empty_pair.make('\')
	end

	has(c: CHARACTER): BOOLEAN
	do
		Result := False

		across chars as char loop
			if char.item.val = c then
				Result := true
			end
		end
	end

	get(c: CHARACTER): BAG_PAIR[CHARACTER]
	do
		Result := empty_pair

		across chars as char loop
			if char.item.val = c then
				Result := char.item
			end
		end
	ensure
		found: Result /= empty_pair
	end

	add(c: CHARACTER)
	local
		tmp: BAG_PAIR[CHARACTER]
	do
		if has(c) then
			get(c).inc
		else
			create tmp.make (c)
			tmp.inc
			chars.extend(tmp)
		end
	end

	consume(s: STRING)
	do
		across s as str loop
			add(str.item)
		end
	end

	print_bag
	do
		print(">>> Current bag state <<<%N")

		across chars as char loop
			print(char.item.val)
			print(" ")
			print(char.item.count)
			print("%N")
		end

		print("^^^ end of bag state ^^^%N")
	end

	sort
	local
		i, j: INTEGER
		value: BAG_PAIR[CHARACTER]
	do
		from
			i := 2
		until
			i > chars.count
		loop
			value := chars[i]
			j := i - 1

			from until not(j >= 1 and chars[j].count > value.count)
			loop
				chars[j + 1] := chars[j]
				j := j - 1
			end

			chars[j + 1] := value
			i := i + 1
		end
	end

end
