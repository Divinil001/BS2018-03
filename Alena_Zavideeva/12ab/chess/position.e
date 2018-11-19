class
	POSITION
create make

feature
	x,y : INTEGER

	make(x_, y_: INTEGER)
		do
			x := x_
			y := y_
		end

	change(x_, y_: INTEGER)
		do
			x := x_
			y := y_
		end
	invariant pos_right: x <=8 and x >=1 and y<=8 and y >= 1
end
