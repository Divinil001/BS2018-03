class
	APPLICATION

create
	make

feature

	make
		local
			lab: LAB
		do
			create lab.make
			lab.add_member (create {BIO_INFORMATIC}.make ("Snoop Dogg",1,"Snoopy", "A strange guy with a weed degree"))
			lab.add_member (create {BIOLOGIST}.make ("Bertrand Meyer", 2, "Eiffel"))
			lab.introduce_all
			lab.remove_member (1)
			lab.introduce_all
		end

end
