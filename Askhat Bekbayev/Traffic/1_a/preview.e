note
	description: "Introduction to Traffic."

class
	PREVIEW

inherit
	ZURICH_OBJECTS

feature -- Explore Zurich

	a_x: INTEGER
	a_y: INTEGER

	explore
			-- Modify the map.
		local
			i: INTEGER
		do
			a_x:=500
			a_y:=-350
			Zurich.add_station ("LapisLions_station", a_x, a_y)
			Zurich.connect_station (24, "LapisLions_station")

			Zurich_map.update
			from
				i:=0
			until
				i > 0
			loop
				Zurich_map.station_view (Zurich.station ("LapisLions_station")).highlight
				wait(1)
				Zurich_map.station_view (Zurich.station ("LapisLions_station")).unhighlight
				wait(1)
				Zurich_map.update
			end
		end

end
