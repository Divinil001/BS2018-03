note
	description: "Summary description for {VECTOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VECTOR
inherit
	DOUBLE_MATH
create
	fill_in
feature {NONE}
	fill_in(a_x: DOUBLE; a_y: DOUBLE)
	do
		set_x(x)
		set_y(y)
	end

	cross_product(v1: VECTOR; v2: VECTOR): VECTOR
	local
		val: DOUBLE
		res: VECTOR
	do
		val := (v1.x * v2.y - v1.y * v2.x) / v1.length / v2.length
		create res.fill_in (v1.x * val, v1.y * val)
		Result := res
	end

	dot_product(v1: VECTOR; v2: VECTOR): DOUBLE
	do
		Result := v1.x * v2.x + v1.y * v2.y
	end

	triangle_area(v1: VECTOR; v2: VECTOR): DOUBLE
	do
		Result := cross_product(v1, v2).length / 2
	end
feature
	x: DOUBLE
	y: DOUBLE
feature
	set_x(a_x: DOUBLE)
	do
		x := a_x
	end
	set_y(a_y: DOUBLE)
	do
		y := a_y
	end
	length: DOUBLE
	local
		len: DOUBLE
	do
		len := x * x + y * y
		Result := sqrt(len)
	end
end
