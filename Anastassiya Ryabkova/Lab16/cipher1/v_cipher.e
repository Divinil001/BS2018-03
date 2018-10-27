note
	description: "Summary description for {V_CIPHER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	V_CIPHER
	inherit
			CIPHER
	feature

		encrypt(str:STRING):STRING
		require else

		text_not_void: str /= Void
		local
			key:STRING

			char:INTEGER
			alphabet_numbers:INTEGER
			i,j:INTEGER
			do

				key:=" "
				key:= read_key
				char:=-1
				Result:= ""
				from
					i:=0
				until
					i= str.count
				loop
					alphabet_numbers:=str.item (i+1).code

					if alphabet_numbers > 64 and alphabet_numbers < 91 then

					char := char + 1
					j := char \\ key.count + 1

					alphabet_numbers := alphabet_numbers + key.item_code (j)
					alphabet_numbers := alphabet_numbers \\ 26 + 65

					Result.extend(alphabet_numbers.to_character_8)

				else
					Result.extend(str.item (i+1))

				end

				i := i + 1
				end

			end


		decrypt (str: STRING): STRING

		require else
			text_not_void: str /= Void

		local
			i, j: INTEGER
			char: INTEGER

			alhabet_numbers: INTEGER
			sentence:STRING

		do

			sentence:=read_sentence
			char := -1
			Result := ""

			from
			i := 0
			until
			i = str.count
			loop

				alhabet_numbers :=str.item_code (i + 1)

				if alhabet_numbers > 64 and alhabet_numbers < 91 then

					char := char + 1
					j := char \\ sentence.count + 1
					alhabet_numbers := alhabet_numbers - sentence.item_code (j)

					if alhabet_numbers < 0 then
						alhabet_numbers := 91 + alhabet_numbers
					else alhabet_numbers := 65 + alhabet_numbers
					end

					Result.extend (alhabet_numbers.to_character_8)

				else

					Result.extend (str.item (i + 1))
				end
				i := i + 1

			end

		end

	feature -- additional

		read_sentence:STRING
			do
				print("sentence:")
				io.read_line
				Result :=io.last_string

			end

		read_key:STRING
			do
				print("key:")
				io.read_line
				Result :=io.last_string
			end



			end

