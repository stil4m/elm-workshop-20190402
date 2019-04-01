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
    -- Solution 1
    -- case String.toFloat amount of
    --     Just amount_ ->
    --         case String.toInt rate of
    --             Just rate_ ->
    --                 Just (amount_ * (toFloat rate_ / 100 + 1.0))
    --
    --             Nothing ->
    --                 Nothing
    --
    --     Nothing ->
    --         Nothing
    -- Solution 2
    -- case ( String.toFloat amount, String.toInt rate ) of
    --     ( Just amount_, Just rate_ ) ->
    --         Just (amount_ * (toFloat rate_ / 100 + 1.0))
    --
    --     _ ->
    --         Nothing
    -- Solution 3
    -- case Maybe.map2 Tuple.pair (String.toFloat amount) (String.toInt rate) of
    --     Just ( amount_, rate_ ) ->
    --         Just (amount_ * (toFloat rate_ / 100 + 1.0))
    --
    --     _ ->
    --         Nothing
    -- Solution 4
    Maybe.map2 (*)
        (String.toFloat amount)
        (String.toInt rate
            |> Maybe.map toFloat
            |> Maybe.map (\f -> f / 100 + 1.0)
        )


{-| Compute the product of the first two odd values.
Examples:

    productOfLowestOdds [] == Nothing

    productOfLowestOdds [ 1, 2 ] == Nothing

    productOfLowestOdds [ 4, 6, 2 ] == Nothing

    productOfLowestOdds [ 3, 7, 5 ] == Just 15

-}
productOfLowestOdds : List Int -> Maybe Int
productOfLowestOdds input =
    input
        |> List.filter isOdd
        |> List.sort
        |> List.take 2
        |> (\list ->
                if List.length list /= 2 then
                    Nothing

                else
                    Just (List.product list)
           )


isOdd : Int -> Bool
isOdd n =
    modBy 2 n == 1
