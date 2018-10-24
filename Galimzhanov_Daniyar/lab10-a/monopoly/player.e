note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    PLAYER

create
    create_player


feature{PLAYER, MONOPOLY}
    name:STRING
    budget:INTEGER
    random_sequence:RANDOM
    number_of_steps:INTEGER
    position:STRING
    in_jail:BOOLEAN
    ownership:ARRAY[STRING]
    year:INTEGER
    not_active:BOOLEAN
    buy_index:INTEGER

feature{PLAYER, MONOPOLY}
    create_player(a_name:STRING)
        --creation of player
        require
            name_not_empty:a_name.count>0
        do
            name:=a_name
            budget:=1500
            number_of_steps:=1
            position:="Start"
            in_jail:=false
            not_active:=false
            year:=0
            buy_index:=1
            create random_sequence.set_seed(100)
            create ownership.make_empty
        ensure
            budget_is_right:budget=1500
        end


feature{PLAYER, MONOPOLY}

    get_salary
        --get salary
        do
            budget:=budget+200
        end

    get_rent(money:INTEGER)
        --get money for rent
        do
            budget:=budget+money
        end

    rent(rent_money:INTEGER)
        --pay for rent
        do
            budget:=budget-rent_money
        end


    chance_money
        --random chance to get money
        local
            new_rand:INTEGER
            time:TIME
        do
        	create time.make_now
            random_sequence.forth
            new_rand:=(((time.fine_second*1000).floor) * 9287 \\ 51) * 10 - 30
            budget:=budget + new_rand
            print(new_rand)
        ensure
            budget_change: old budget /= budget
        end

    income_tax
        --pay taxes
        do
            budget:=budget - (budget*0.1).ceiling
        ensure
            budget_change: old budget /= budget
        end

    next_step
        do
            number_of_steps:=number_of_steps+1
        end

    action
        local

            ind:INTEGER
            --num_dice:INTEGER
        do
            from until number_of_steps>100 or ind=1 loop
                print("Turn of " + name +"%N")
                print("To throw dice write 'play' %N")
                print("%N")
                io.read_line
                if io.last_string.twin ~ "play" then
                    print("Dice number: " + dice.out + "%N")
                    number_of_steps:=number_of_steps+dice
                    ind:=1
                end

            end
        end


    check_budget
        --check the budget
        do
            if budget <= 0 then
                not_active:=true
            end
        end

    check_activity:BOOLEAN
        --check if player in the game
        do
            Result:=not_active
        end

    check_jail:BOOLEAN
        --checking in prison or not
        do
            Result:=in_jail
        end

    go_to_jail
        --go to jail
        do
            in_jail:=true
        end

    set_free
        --set free if player sit in prison during 3 steps
        do
            year:=year+1
            if year = 3 then
                in_jail:=false
            end
        end

    pay_fine
        --pay to avoid prison
        do
            budget:=budget-50
        end

    set_position(place:STRING)
        --set place
        do
            position:=place
        end

    buy(price:INTEGER; place:STRING)
        --buy place
        do
            budget:=budget - price
            ownership.force(place, buy_index)
            buy_index:=buy_index+1
        end

    check_ownership(place:STRING):BOOLEAN
        local
            i:INTEGER
        do
            from i:=1 until i>ownership.count loop
                if ownership[i] ~ place then
                    Result:=true
                end
                i:=i+1
            end
        end

    feature{MONOPOLY, PLAYER}
        dice:INTEGER
            --throw dice
            local
                random:RANDOM
                time:TIME
            do
                create random.set_seed(1)
                create time.make_now
                Result:= (((time.fine_second*1000).floor) * 9287) \\ 6 + 1
            end


end
