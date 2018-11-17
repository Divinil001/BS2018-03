class
	NEW_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	tests
		local
			app: APPLICATION
			tmp : LINKED_LIST[STRING]
			str, test1 : STRING
			i : INTEGER
		do
			create app.make
			test1 := "abc%Nacb%Nbac%Nbca%Ncab%Ncba%N"
			tmp := app.anagram("abc")
			from
				i := 1
				str := ""
			until
				i > tmp.count
			loop
				str := str + tmp[i] + "%N"
				i := i + 1
			end
			assert ("test1", str ~ test1 )
		end

end


