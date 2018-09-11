note
	description: "Introduction to Traffic."

class
	PREVIEW

inherit
	ZURICH_OBJECTS

feature -- Explore Zurich

	explore
			-- Modify the map.
		do
			console.output (Zurich.line (24).west_terminal.is_exchange)
--			console.output (Zurich.station ("Central").position.distance (Zurich.station ("Polyterrasse").position))
		end

end
