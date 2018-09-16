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

			Zurich.add_station ("Station", 800, 800)
			Zurich.connect_station (9, "Station")
			Zurich_map.update
			Zurich_map.animate

			Station := Zurich_map.station_view (Zurich.station ("Station"))

			from
			until False
			loop
				Station.highlight
				wait(1)
				Station.unhighlight
				wait(1)
			end

			Zurich_map.update
			Zurich_map.animate

		end
		Station: STATION_VIEW
feature

	addTransport(num: INTEGER)

		do
			Zurich.add_public_transport(num)
		end

end
