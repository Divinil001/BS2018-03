class
    books

create
    make_book

feature
    name : STRING
    author : STRING
    age_limit : INTEGER
    bestseller : BOOLEAN
    price : INTEGER

    make_book(new_name : STRING new_author : STRING new_age_limit : INTEGER best : BOOLEAN new_price : INTEGER)
    do
        name := new_name
        author := new_author
        age_limit := new_age_limit
        bestseller := best
        price := new_price
    end
end
