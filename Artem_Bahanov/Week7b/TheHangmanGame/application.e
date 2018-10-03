class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			g: GAME
		do
			create g.make (current) -- starting game
		end
end
