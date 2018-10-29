note
	description: "Summary description for {PSEUDO_BIN_TREE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PSEUDO_BIN_TREE

feature
	status: STRING assign set_status
	cipher: STRING assign set_cipher
	char: STRING assign set_char
	freq: INTEGER assign set_freq
	left: detachable  PSEUDO_BIN_TREE assign set_left
	right: detachable PSEUDO_BIN_TREE assign set_right
	parent: detachable PSEUDO_BIN_TREE assign set_parent

feature
	set_status(s: STRING)
		do
			status:=s
		end
	set_cipher(c: STRING)
		do
			cipher:=c
		end
	set_freq(f: INTEGER)
		do
			freq:=f
		end
	set_char(s: STRING)
		do
			char:= s
		end
	set_left(l: PSEUDO_BIN_TREE)
		do
			left:=l
		end
	set_right(r: PSEUDO_BIN_TREE)
		do
			right:=r
		end
	set_parent(p: PSEUDO_BIN_TREE)
		do
			parent:=p
		end
end
