note
    description : "root class of the application"
    date        : "$Date$"
    revision    : "$Revision$"

class
    APPLICATION

inherit
    ARGUMENTS

create
    make

feature
    vig:VIGENERE_CIPHER
    word:STRING
    sp:SPIRAL_CIPHER
    comb_cip:COMBINED_CIPHER

feature {NONE} -- Initialization

    make
            -- Run application.
        do
            -- Add your code here
            --print ("Hello Eiffel World!%N")
            create vig.create_vig_cipher
            word:=vig.encrypt("STUDENTSAWARE","TIGER")
            print(word+"%N")
            print(vig.decrypt(word)+"%N")
            create sp
            print(sp.encrypt(word," ") + "%N")
            print(sp.encrypt("LBAHVGBY, WFEDK XYX IYWZZVSIEM EKPC TVJ JRLB!"," ") + "%N")
            create comb_cip
            print(comb_cip.encrypt("STUDENTSAWARE", "TIGER"))

        end

end
