note
	description: "Summary description for {SPIRAL_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPIRAL_CIPHER

inherit
	CIPHER
	SINGLE_MATH

feature

	encrypt (text:STRING): STRING
		require else
			text_no_void: not text.is_empty
		local
			matrix: ARRAY2 [CHARACTER]
			n, max, space, i, j, k: INTEGER
			dir, upper, lower, left, right: INTEGER
		do
			Result := ""

			-- Create matrix then filled
			max := text.count
			n := sqrt (max).ceiling
			space := n * n - max
			create matrix.make_filled (' ', n, n)
			k := 1
			from i := 1
			until i > n
			loop
				from
					j := 1
				until j > n or k > max
				loop
					matrix [i, j] := text.item (k)
					k := k + 1
					j := j + 1
				end
				i := i + 1
			end

			-- Encrypt
			from
				upper := 1
				lower := n
				left := 1
				right := n
				dir := 6 -- Down
			until
				left > right or lower < upper
			loop
				if dir = 6 then
					-- Down
					from i := upper
					until i > lower
					loop
						if i < n or space = 0 then
							Result.extend (matrix [i, right])
						end
						i := i + 1
					end
					dir := 2
					right := right - 1
				elseif dir = 2 then
					-- Left
					from
						if lower = n and space > 0 then
							j := n - space
						else j := right
						end
					until
						j < left
					loop
						Result.extend (matrix [lower, j])
						j := j - 1
					end
					dir := 4
					lower := lower - 1
				elseif dir = 4 then
					-- Up
					from i := lower
					until i < upper
					loop
						Result.extend (matrix [i, left])
						i := i - 1
					end
					dir := 8
					left := left + 1
				elseif dir = 8 then
					-- Right
					from j := left
					until j > right
					loop
						Result.extend (matrix [upper, j])
						j := j + 1
					end
					dir := 6
					upper := upper + 1
				end
			end
		ensure then
			length_equal: Result.count = text.count
		end

	decrypt (text: STRING): STRING
		require else
			text_not_void: not text.is_empty
		local
			matrix: ARRAY2 [CHARACTER]
			n, max, space, i, j, k: INTEGER
			dir, upper, lower, left, right: INTEGER
		do
			Result := ""

			-- Create matrix and fill
			max := text.count
			n := sqrt (max).ceiling
			space := n * n - max
			create matrix.make_filled (' ', n, n)
			from
				k := 1
				dir := 6
				upper := 1
				right := n
				lower := n
				left := 1
			until k > max
			loop
				if dir = 6 then
					from i := upper
					until
						if lower = n and space > 0 then
							i = lower
						else i > lower
						end
					loop
						matrix.put (text.item (k), i, right)
						k := k + 1
						i := i + 1
					end
					right := right - 1
					dir := 2
				elseif dir = 2 then
					from
						if lower = n and space > 0 then
							j := n - space
						else j := right
						end
					until j < left
					loop
						matrix.put (text.item (k), lower, j)
						j := j - 1
						k := k + 1
					end
					lower := lower - 1
					dir := 4
				elseif dir = 4 then
					from i := lower
					until i < upper
					loop
						matrix.put (text.item (k), i, left)
						i := i - 1
						k := k + 1
					end
					dir := 8
					left := left + 1
				elseif dir = 8 then
					from j := left
					until j > right
					loop
						matrix.put (text.item (k), upper, j)
						j := j + 1
						k := k + 1
					end
					dir := 6
					upper := upper + 1
				end
			end

			-- Decrypt
			from
				i := 1
				k := 1
			until i > n
			loop
				from j := 1
				until j > n or k > max
				loop
					Result.extend (matrix.item (i, j))
					k := k + 1
					j := j + 1
				end
				i := i + 1
			end
		ensure then
			length_equal: Result.count = text.count
		end

end
