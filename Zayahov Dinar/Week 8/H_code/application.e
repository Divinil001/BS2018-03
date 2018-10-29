note
	description: "huffman_code application root class"
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
			-- Run application.
		do
			create code.make (1)
			io.read_line					------- read line from user
			str:=io.last_string

			create A.make(0)				------- creating not-sorted arrays of characters and their frequencies
			create frequency.make(0)
			from
				i:=1
			until
				i>str.count
			loop
				if
					not A.has(str[i])
				then
					A.extend(str[i])
					frequency.extend(1)
				else
					A.search(str[i])
					frequency[A.index]:=frequency[A.index]+1
					A.go_i_th (1)
				end
				i:=i+1
			end

			from							------- parallel sorting of two arrays "A" and "frequency" (bubble sort: from the smallest to biggest)
				i:=1
			until
				i>A.count
			loop
				from
					j:=1
				until
					j>A.count
				loop
					if
						frequency[i]<frequency[j]
					then
						swap_f:=frequency[j]
						swap_s:=A[j]
						frequency[j]:=frequency[i]
						A[j]:=A[i]
						frequency[i]:=swap_f
						A[i]:=swap_s
					end
					j:=j+1
				end
				i:=i+1
			end

			create W.make(0)					------ creating a leaf of a PSEUDO_BIM_TREE for each element of A
			from
				i:=1
			until
				i>A.count
			loop
				create P
				P.char:=A[i].out
				P.freq:=frequency[i]
				W.extend(P)
				i:=i+1
			end

			from						------ creating parents and children. At the end in array W should be only one root node
			until
				W.count=1
			loop
				create P
				P.char:=W[1].char+W[2].char
				P.freq:=W[1].freq+W[2].freq
				P.left:=W[1]
				P.right:=W[2]
				W[1].parent:=P
				W[2].parent:=P
				W.go_i_th (1)
				W.remove
				W.go_i_th (1)
				W.remove
				W.extend (P)
			end

			create output_array1.make(0)
			create output_array2.make(0)
			from
				i:=1
			until
				i>A.count
			loop
				recursive(W[1])
				i:=i+1
			end							------ output with two arrays

			from
				i:=1
			until
				i>output_array2.count
			loop
				print(output_array1[i])
				print(": ")
				print(output_array2[i])
				io.new_line
				i:=i+1
			end
		end

feature
	recursive(n: PSEUDO_BIN_TREE)   		------- encode
		do
			if
				n.left/=Void and n.left.status= Void
			then
				code:=code+"0"
				recursive(n.left)
			elseif
				(n.left= Void or n.left.status /= void) and n.right/= Void and n.right.status= Void
			then
				code:=code+"1"
				recursive(n.right)
			elseif
				n.left= Void and n.right= Void
			then
				n.cipher:=code
				n.status:="close"
				output_array1.extend(n.char)
				output_array2.extend(n.cipher)
				code:=""
			end
			if not(n.left = void or n.right = void) then
			if(n.left.status /= void and n.right.status /= void) then n.status := "close" end
		end
		end

feature
	output_array1, output_array2: ARRAYED_LIST[STRING]
	P: PSEUDO_BIN_TREE
	W: ARRAYED_LIST[PSEUDO_BIN_TREE]
	A: ARRAYED_LIST[CHARACTER]
	frequency: ARRAYED_LIST[INTEGER]
	i,j,swap_f: INTEGER
	str,code: STRING
	swap_s:CHARACTER

end
