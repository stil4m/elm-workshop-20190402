module FizzBuzz exposing (many, single)

{-| [Wiki](https://en.wikipedia.org/wiki/Fizz_buzz)
-}


{-| Compute the string representation for a single numeric values following the 'Fizz Buzz' rules.
-}
single : Int -> String
single number =
    if modBy 3 number == 0 && modBy 5 number == 0 then
        "FizzBuzz"

    else if modBy 3 number == 0 then
        "Fizz"

    else if modBy 5 number == 0 then
        "Buzz"

    else
        String.fromInt number


{-| Compute a sentence of following the 'Fizz Buzz' rules, starting and ending at a certain position.

Advice: use `if` and recursion to simulate a while-loop.

Example output `many 1 3 == "1, 2, Fizz"`

-}
many : Int -> Int -> String
many start end =
    if start > end then
        ""

    else if start == end then
        single start

    else
        single start ++ ", " ++ many (start + 1) end
