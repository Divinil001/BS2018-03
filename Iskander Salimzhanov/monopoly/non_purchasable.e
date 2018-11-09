note
	description: "Summary description for {NON_PURCHASABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WITHOUT_FILIALS
inherit
	INDUSTRY
create
	make

feature
	make
	local
		a_fields: ARRAYED_LIST [PRODUCTION]
		a_name: STRING
	do
		create a_fields.make (0)
		a_name := "Without filials"
		set_fields(a_fields)
		set_name(a_name)
	end
end
