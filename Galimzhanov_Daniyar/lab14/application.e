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
    bnf:BNF

feature {NONE} -- Initialization

    make
            -- Run application.
        do
          
            			-- The grammar is as follows:
			-- <expression> := <term> and <term> | <term> or <term> | not <term> | <term> implies <term>;
			-- <term> := <expression> | <identifier>;
			-- <identifier> := x | y | z;
			grammar
            create bnf.init
        end
        
    grammar
        do
            print("The grammar is as follows:%N")
            print("expression := term and term | term or term | not term | term implies term;%N")
            print("term := expression | identifier;%N")
            print("identifier := x | y | z;%N")
            print("Write your boolean expression: %N")
            print("%N")
        end

end

