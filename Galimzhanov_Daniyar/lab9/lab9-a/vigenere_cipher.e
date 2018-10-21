class
    VIGENERE_CIPHER

inherit
    CIPHER
        redefine
            encrypt, decrypt
        end

create create_vig_cipher


feature{VIGENERE_CIPHER}
    key_word:STRING
    alphabet:STRING
    cipher:STRING


feature{COMBINED_CIPHER, APPLICATION}

    create_vig_cipher
        do
            key_word:=""
            alphabet:="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            cipher:=""
        end



    encrypt(word:STRING; key:STRING):STRING
        local
            index1:INTEGER
            index2:INTEGER
            index3:INTEGER
            index4:INTEGER
            array_list1:ARRAYED_LIST[CHARACTER] --key_word
            array_list2:ARRAYED_LIST[INTEGER]   --array that consists the indexs of word
            array_list3:ARRAYED_LIST[CHARACTER] --array that consists alphabet
            array_list4:ARRAYED_LIST[INTEGER]   --array that consists indexs of key word
        do
            key_word:=key
            create array_list1.make(0)
            create array_list2.make(0)
            create array_list3.make(0)
            create array_list4.make(0)

            --REWRITE THE ALPHABET IN ARRAY
            from
                index3:=1
            until
                index3>alphabet.count
            loop
                array_list3.force(alphabet[index3])
                index3:=index3 + 1
            end


            --REWRITE INDEX OF CHARS IN WORD IN ARRAY
            from
                index1:=1
            until
                index1>word.count
            loop
                from
                    index2:=1
                until
                    index2>array_list3.count
                loop
                    if word.at(index1) ~ array_list3.at(index2) then
                        array_list2.force(index2)
                    end
                    index2:=index2+1
                end
                index1:=index1+1
            end

            from
                index1:=1
            until
                index1>key_word.count
            loop
                array_list1.force(key_word[index1])
                index1:=index1+1
            end


            from
                index1:=1
                index4:=1
            until
                index1>word.count
            loop

                if index4 >= key_word.count then
                        index4:=1
                end

                from
                    index2:=1
                until
                    index2>array_list3.count
                loop



                    if key_word[index4] = array_list3[index2] then
                        array_list4.force(index2)
                    end


                    index2:=index2+1
                end
                index1:=index1+1
                index4:=index4+1
            end


            from
                index1:=1
                index2:=1
            until
                index1>word.count and index2>word.count
            loop
                cipher:=cipher+array_list3[(array_list2[index1] + array_list4[index2])\\26].out
                index1:=index1+1
                index2:=index2+1
            end


            Result:=cipher


        end

    decrypt(word_decr:STRING):STRING
        local
            index1:INTEGER
            index2:INTEGER
            index4:INTEGER
            array1:ARRAYED_LIST[INTEGER]
            array2:ARRAYED_LIST[INTEGER]
        do
            create array1.make(0)
            create array2.make(0)
            Result:=""

            --word_decr
            from
                index1:=1
            until
                index1>word_decr.count
            loop
                from
                    index2:=1
                until
                    index2>alphabet.count
                loop
                    if word_decr[index1] = alphabet[index2] then
                        array1.force(index2)
                    end
                    index2:=index2+1
                end
                index1:=index1+1
            end

            --key
            from
                index1:=1
                index4:=1
            until
                index1>word_decr.count
            loop

                if index4 >= key_word.count then
                        index4:=1
                end

                from
                    index2:=1
                until
                    index2>alphabet.count
                loop



                    if key_word[index4] = alphabet[index2] then
                        array2.force(index2)
                    end


                    index2:=index2+1
                end
                index1:=index1+1
                index4:=index4+1
            end

            from
                index1:=1
                index2:=1
            until
                index1>word_decr.count and index2>word_decr.count
            loop
                Result:=Result + alphabet[(array1[index1] - array2[index2] + 26) \\ 26].out
                index1:=index1+1
                index2:=index2+1
            end


        end

end
