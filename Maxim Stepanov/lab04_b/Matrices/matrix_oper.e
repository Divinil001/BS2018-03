note
	description: "Summary description for {MATRIX_OPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MATRIX_OPER

feature

	add(m1, m2: MATRIX): MATRIX
	do
		Result := m1.add (m2)
	end


	minus(m1, m2: MATRIX): MATRIX
	do
		Result := m1.sub (m2)
	end


	prod(m1, m2: MATRIX): MATRIX
	do
		Result := m1.mul (m2)
	end

	det(m: MATRIX): REAL
	do
		Result := m.det
	end

end
