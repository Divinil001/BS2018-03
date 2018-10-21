class
    COMBINED_CIPHER
inherit
    CIPHER
        redefine
            encrypt, decrypt
        end

feature
    encrypt(word_encr:STRING;key:STRING):STRING
        local
            vig_cip:VIGENERE_CIPHER
            spiral:SPIRAL_CIPHER
            s:STRING
        do
            create vig_cip.create_vig_cipher
            s:=vig_cip.encrypt(word_encr,key)
            create spiral
            s:=spiral.encrypt(s, "")
            Result:=s
        end

feature
    decrypt(word_decr:STRING):STRING
        local
            vig_cip:VIGENERE_CIPHER
            spiral:SPIRAL_CIPHER
            s:STRING
        do
            create vig_cip.create_vig_cipher
            s:=vig_cip.decrypt(word_decr)
            create spiral
            s:=spiral.decrypt(s)
            Result:=s
        end

end
