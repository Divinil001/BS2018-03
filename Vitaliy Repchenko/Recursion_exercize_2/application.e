note
  description: "LCS application root class"
  date: "$Date$"
  revision: "$Revision$"

class
  APPLICATION

inherit
  ARGUMENTS

create
  make

feature {NONE} -- Initialization
	make
    do
      a := "qwertyuio"
      b := "bqweqwertyuiop"
      print("%N")
      print(lcs(a , b))
      print("%N")
    end

feature

  longest(s_1, s_2: STRING): STRING
    do
      if s_1.count >= s_2.count
      then
        result := s_1.out
      else
        result := s_2.out
      end
   end

  recursion(s_1, s_2: STRING; i, j: INTEGER): STRING
    do
      if i = 0 or j = 0
      then
        Result := ""
      elseif
        s_1[i] = s_2[j]
      then
        Result := recursion(s_1, s_2, i - 1, j - 1).out + s_1[i].out
      else
        Result := longest(recursion(s_1, s_2, i - 1, j), recursion(s_1, s_2, i, j - 1)).out
      end
    end

  lcs(s_1, s_2: STRING): STRING
    do
      Result := recursion(s_1, s_2, s_1.count, s_2.count).out
    end


feature

	a, b: STRING


end
