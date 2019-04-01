module Chapter3 exposing (tax, productOfLowestOdds)

{-| Chapter3

@docs tax, productOfLowestOdds

-}


{-| Compute tax of amount and a tax rate.
Examples:

    tax "2.00" "21" == Just 2.42

    tax "10.00" "5" == Just 10.5

    tax "a" "17" == Nothing

    tax "2.50" "false" == Nothing

    tax "1.0" "22.5" == Nothing -- Second argument should be an integer.

-}
tax : String -> String -> Maybe Float
tax amount rate =
    Debug.todo "Implement me"


{-| Compute the product of the first two odd values.
Examples:

    productOfLowestOdds [] == Nothing

    productOfLowestOdds [ 1, 2 ] == Nothing

    productOfLowestOdds [ 4, 6, 2 ] == Nothing

    productOfLowestOdds [ 3, 7, 5 ] == Just 15

-}
productOfLowestOdds : List Int -> Maybe Int
productOfLowestOdds input =
    Debug.todo "Implement me"
