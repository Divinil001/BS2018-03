class
    SPIRAL_CIPHER

inherit
    CIPHER
        redefine
            encrypt, decrypt
        end

feature{COMBINED_CIPHER, APPLICATION}
    encrypt(word_encrypt:STRING; key:STRING):STRING
        local
            matr:ARRAY2[CHARACTER]
            encrypted_word:STRING
            index1, index2, index3, len:INTEGER
        do
            --matrix creation{optimized}
            matr:=make_matrix(word_encrypt)
            --end of matrix creation
            len:=matr.width

            create encrypted_word.make_filled(' ', matr.width*matr.width)
            from index1:=1 index2:=1 until index2 > matr.width*matr.width loop

                from index3:=index1 until index3 >= len loop
                   encrypted_word[index2]:=matr[index3, len]
                   index2:=index2+1
                   index3:=index3+1
                end

                from index3:=len until index3 < index1 loop
                    encrypted_word[index2]:=matr[len, index3]
                    index2:=index2+1
                    index3:=index3-1
                end

                from index3:=len-1 until index3 <= index1 loop
                    encrypted_word[index2]:=matr[index3, index1]
                    index2:=index2+1
                    index3:=index3-1
                end

                from index3:=index1 until index3 >= len loop
                    encrypted_word[index2]:=matr[index1, index3]
                    index2:=index2+1
                    index3:=index3+1
                end

                index1:=index1 + 1
                len:=len - 1

            end
            Result:=encrypted_word
        end

    decrypt(word_decr:STRING):STRING
        local
            matrix_decrypt:ARRAY2[CHARACTER]
            word_decrypted:STRING
            index1, index2, index3, len:INTEGER
        do
            matrix_decrypt:=make_matrix_decr(word_decr)
            len:=matrix_decrypt.width
            create word_decrypted.make_filled(' ', len*len)
            from index1 := 1 index3:=1 until index1 > len loop
                from index2:=len until index2 < 1 loop
                    word_decrypted[index3] := matrix_decrypt[index2, index1]
                    index2:=index2-1
                    index3:=index3+1
                end
                index1:=index1+1
            end
            Result:=word_decrypted
        end

feature
    sqrt(num:INTEGER):DOUBLE
        local
            exp:DOUBLE
            index:INTEGER
        do

            if num = 0 then
                Result:=0.0
            end

            from exp:=1 until exp*exp>num loop
                exp := exp * 10
            end

            from index:=0 until index>10 loop
                exp:=(exp + num/exp) / 2
                index:=index+1
            end
            Result:=exp

        end

        make_matrix(word_encr:STRING):ARRAY2[CHARACTER]
            local
                matrix:ARRAY2[CHARACTER]
                word_array:ARRAY[CHARACTER]
                index1, index2, numb: INTEGER
            do
                numb := sqrt(word_encr.count).ceiling
                create matrix.make_filled(' ', numb, numb)
                create word_array.make_filled('a', 0, word_encr.count - 1)

                from index1:=1 index2:=0 until index1>word_encr.count loop
                    word_array[index2] := word_encr[index1]
                    index1:=index1+1
                    index2:=index2+1
                end

                from index1 := 0  until index1 = numb loop
                    from index2 := 0 until index2 = numb loop
                        if numb*index1+index2  < word_array.count then
                            matrix.force(word_array[numb*index1+index2], index1+1, index2+1)
                        else
                            matrix.force(' ', index1+1, index2+1)
                        end
                        index2:=index2+1
                    end
                    index1:=index1+1
                end

                Result:=matrix
            end

            make_matrix_decr(word_decry:STRING):ARRAY2[CHARACTER]
                local
                    matrix_decr:ARRAY2[CHARACTER]
                    index1, index2, index3, len, a:INTEGER
                do

                    len := sqrt(word_decry.count).ceiling
                    create matrix_decr.make_filled(' ', len, len)
                    a:=len

                    from index1:=1 index2:=1 until index2 > a*a loop

                        from index3:=index1 until index3 >= len loop
                            matrix_decr[index1, index3]:=word_decry[index2]
                            index2:=index2+1
                            index3:=index3+1
                        end

                        from index3:=index1 until index3 > len loop
                            matrix_decr[index3, len]:=word_decry[index2]
                            index2:=index2+1
                            index3:=index3+1
                        end

                        from index3:=len-1 until index3 <= index1 loop
                            matrix_decr[len, index3]:=word_decry[index2]
                            index2:=index2+1
                            index3:=index3-1
                        end

                        from index3:=len until index3 <= index1 loop
                            matrix_decr[index3, index1]:=word_decry[index2]
                            index2:=index2+1
                            index3:=index3-1
                        end

                        index1:=index1 + 1
                        len:=len - 1

                    end
                    Result:=matrix_decr
                end

end
