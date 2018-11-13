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
	introduce: STRING
	do
		Result := "---%NScientist #" + id.out + "%NName: " + name.out + "%NPet's name: " + pet.name + "%NBio: " + short_biography + "%N"
	end

	discipline: STRING
	once
		Result := "Bio-informatician"
	end

	make(id_n: INTEGER name_n: STRING pet_n: PET bio: STRING)
	do
		name := name_n
		id := id_n
		pet := pet_n
		short_biography := bio
	end
end
