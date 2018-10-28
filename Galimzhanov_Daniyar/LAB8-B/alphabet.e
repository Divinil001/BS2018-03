class
	ALPHABET[G]

create
	make

feature
	root : detachable ALPHABET[G]
	left : detachable ALPHABET[G]
	right : detachable ALPHABET[G]
	value : INTEGER
	ch : STRING

	make(j : INTEGER new_ch : STRING)
		do
			value := j
			ch := new_ch
		end

	v_edit(j : INTEGER)
	do
		value := j
	end

	ch_edit(j : STRING)
	do
		ch := j
	end

	get_v : INTEGER
	do
	    Result := value
	end

	get_ch : STRING
	do
	    Result := ch
	end

	set_root(new_root : ALPHABET[G])
	do
	    root := new_root
    end

    set_left(new_left : ALPHABET[G])
	do
	    root := new_left
    end

    set_right(new_right : ALPHABET[G])
	do
	    root := new_right
    end

    full_make(j : INTEGER new_ch : STRING  new_left : ALPHABET[G] new_right : ALPHABET[G])
    do
        value := j
        ch := new_ch
        left := new_left
        right := new_right
    end
end
