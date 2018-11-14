note
	description: "Summary description for {BIO_INFORMATIC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIO_INFORMATIC
inherit
	BIOLOGIST
	rename
		make as make_bio
	export
		{NONE}
		make_bio
	undefine
		discipline, introduce
	end
	COMPUTER_SCIENTIST
	rename
		make as make_comp
	export
		{NONE}
		make_comp
	undefine
		discipline, introduce
	select
		make_comp
	end

create
	make

feature
	short_biography: STRING

feature
	discipline: STRING
	once
		Result:="Bio-informatician"
	end

	introduce: STRING
		do
			Result:="Name: " + name.out + " ID: " + id.out + " Pet's name: " + pet.name.out + " Biography: " + short_biography.out
		end

	make(id_n: INTEGER name_n: STRING pet_n: PET bio: STRING)
	do
		name := name_n
		id := id_n
		pet := pet_n
		short_biography := bio
	end
end
