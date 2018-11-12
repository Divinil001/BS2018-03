note
	description: "Summary description for {COMPUTER_SCIENTIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPUTER_SCIENTIST
inherit
	SCIENTIST
create
	make
feature
	make(a_name, a_id, a_discipline, a_bio: STRING; a_pet: PET)
	do
		set_name(a_name)
		set_id(a_id)
		set_discipline(a_discipline)
		set_bio(a_bio)
	end

end
