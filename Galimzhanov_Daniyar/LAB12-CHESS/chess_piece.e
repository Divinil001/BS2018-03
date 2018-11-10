note
	description: "Summary description for {CHESS_PIECE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CHESS_PIECE

feature
	array:ARRAY[CHARACTER]
	figure:CHARACTER
	x, y:INTEGER  -- coordinates
	fig_color:INTEGER

feature
	can_move(a_x, a_y:INTEGER):BOOLEAN
		do
			Result:=False
		end

	assign_coordinates(a_x, a_y:INTEGER)
		do
			x:=a_x
			y:=a_y
		end

	get_x:INTEGER
		do
			Result:= x
		ensure
			Result=x
		end

	get_y:INTEGER
		do
			Result:= y
		ensure
			Result=y
		end

	set_x(a_x:INTEGER)
		do
			x := a_x
		end

	set_y(a_y:INTEGER)
		do
			y := a_y
		end

	set_figure(fig:CHARACTER)
		do
			figure:=fig
		end

	not_same(fig:CHESS_PIECE):BOOLEAN
		do
			if fig_color = fig.fig_color then
				Result:=False
			else
				Result:=True
			end
		end

	colour:STRING
		do

			if fig_color = 1 then
				Result:="White%N"
			elseif fig_color = 2 then
				Result:="Black%N"
			else
				Result:="Empty%N"
			end
		end

	position:STRING
		do
			Result:="Current coordinates are: " + "%NColumn: " + x.out + "%NRow: " + y.out + "%N"
		end

	not_empty:BOOLEAN
		do
			Result:= figure /= '.'
		end

	is_empty:BOOLEAN
		do
			Result:= figure = '.'
		end

	is_black:BOOLEAN
		do
			Result:=fig_color=2
		end

	is_white:BOOLEAN
		do
			Result:=fig_color=1
		end

end
