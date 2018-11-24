note
	description: "bnf application root class"
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
		local
			number, h: INTEGER
			validity: STRING
		do
			--| Add your code here
			print("Write, how many expressions you want to check: ")
			io.read_integer
			number:=io.last_integer
			create exp.make (0)
			create words.make (0)
			create word.make (0)

			from
				h:=1
			until
				h>number
			loop
				create exp.make (0)
				create words.make (0)
				create word.make (0)
				io.read_line
				exp:=io.last_string.twin
				from
					i:=1
				until
					i>exp.count
				loop
					if
						exp[i]~' ' and word.count=0
					then
						word:=""
					elseif
						exp[i]~' ' or i=exp.count
					then
						if
							i=exp.count and exp[i]/~' '
						then
							word.extend (exp[i])
						end
						words.extend (word)
						word:=""
					else
						word.extend (exp[i])
					end
					i:=i+1
				end

				create validity.make (0)
				validity:="Expression is valid"
				from
					i:=1
				until
					i>words.count
				loop
					if
						expression(words[i])=False
					then
						validity:="Expression is invalid"
					end
					i:=i+1
				end
				print(validity)
				io.new_line

				h:=h+1
			end
			
		end

feature
	expression(s: STRING): BOOLEAN
		do
			if
				variable(s)=True
			then
				words.search (s)
				if
					words.index/=words.count
				then
					if
						operation(words[words.index+1])=True and words[words.index+1]/~"not"
					then
						Result:=True
					else
						Result:=False
					end
				else
					Result:=True
				end

			elseif
				operation(s)=True and s~"not"
			then
				words.search (s)
				if
					words.index/=words.count
				then
					if
						variable(words[words.index+1])=True or expression(words[words.index+1])=True
					then
						Result:=True
					else
						Result:=False
					end
				else
					Result:=False
				end
			elseif
				operation(s)=True and s/~"not"
			then
				words.search(s)
				if
					words.index/=words.count and words.index/=1
				then
					if
						( variable(words[words.index-1])=True or expression(words[words.index-1]) ) and ( variable(words[words.index+1])=True or expression(words[words.index+1]) )
					then
						Result:=True
					else
						Result:=False
					end
				else
					Result:=False
				end
			else
				Result:=False
			end
		end

	variable(s: STRING): BOOLEAN
		local
			word_without_p: STRING
		do
			create word_without_p.make(0)
			if
				check_parentheses=True
			then
				from
					j:=1
				until
					j>s.count
				loop
					if
						s[j]/='(' and s[j]/=')'
					then
						word_without_p.extend(s[j])
					end
					j:=j+1
				end

				if
					word_without_p~"x" or word_without_p~"y" or word_without_p~"z"
				then
					Result:=True
				else
					Result:=False
				end

			else
				Result:=False
			end
		end

	operation(s: STRING): BOOLEAN
		do
			if
				s~"or" or s~"and" or s~"not" or s~"implies"
			then
				Result:=True
			else
				Result:=False
			end
		end

	check_parentheses: BOOLEAN
		local
			left_p_count, right_p_count, l: INTEGER
		do
			from
				l:=1
			until
				l>exp.count
			loop
				if
					exp[l]='('
				then
					left_p_count:=left_p_count+1
				elseif
					exp[l]=')'
				then
					right_p_count:=right_p_count+1
				end
				l:=l+1
			end

			if
				left_p_count=right_p_count
			then
				Result:=True
			else
				Result:=False
			end
		end

feature
	exp: STRING
	words: ARRAYED_LIST[STRING]
	word: STRING
	i,j: INTEGER

end
