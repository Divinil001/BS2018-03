note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    BOARD

create
    create_board

feature{BOARD, MONOPOLY}
    array:ARRAY[STRING]
    array2:ARRAY[INTEGER]--rent
    array3:ARRAY[INTEGER]

feature{BOARD, MONOPOLY}
    create_board
        do
            create array.make_filled("a", 1, 20)
            array[1]:="START"
            array[2]:="Christ the Redeemer"
            array[3]:="Luang Pho To"
            array[4]:="INCOME TAX"
            array[5]:="Alyosha monument"
            array[6]:="IN JAIL"
            array[7]:="Tokyo Wan Kannon"
            array[8]:="Luangpho Yai"
            array[9]:="CHANCE"
            array[10]:="The Motherland"
            array[11]:="FREE PARKING"
            array[12]:="Awaji Kannon"
            array[13]:="CHANCE"
            array[14]:="Rodina-Mat Zovyot!"
            array[15]:="Great Buddha of Thailand"
            array[16]:="GO TO JAIL"
            array[17]:="Laykyun Setkyar"
            array[18]:="Spring Temple Buddha"
            array[19]:="CHANCE"
            array[20]:="Statue of Unity"


            create array2.make_filled(1, 1, 20)
            array2[2]:= 60
            array2[3]:= 60
            array2[5]:=80
            array2[7]:=100
            array2[8]:=120
            array2[10]:=160
            array2[12]:=220
            array2[14]:=260
            array2[15]:=280
            array2[17]:=320
            array2[18]:=360
            array2[20]:=400

            create array3.make_filled(1, 1, 20)
            array3[2]:=2
            array3[3]:=4
            array3[5]:=4
            array3[7]:=6
            array3[8]:=8
            array3[10]:=12
            array3[12]:=18
            array3[14]:=22
            array3[15]:=22
            array3[17]:=28
            array3[18]:=35
            array3[20]:=50

        end

    at(index:INTEGER):STRING
        --get the element by index in board
        do
            Result:=array[index]
        end

    rent(index:INTEGER):INTEGER
        --get rent price of place
        do
            Result:=array3[index]
        end

    price(index:INTEGER):INTEGER
        --get price of place
        do
            Result:=array2[index]
        end

    change(num:INTEGER;new_place:STRING)
        do
            array[num] := new_place
        end


end
