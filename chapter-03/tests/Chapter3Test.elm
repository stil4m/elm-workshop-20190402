module Chapter3Test exposing (suite)

import Chapter3
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, float, int, intRange, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Chapter3"
        [ describe "tax"
            [ skip <|
                test "should compute nothing for invalid amount" <|
                    \() ->
                        Chapter3.tax "invalid" "21"
                            |> Expect.equal Nothing
            , skip <|
                test "should compute nothing for invalid rate" <|
                    \() ->
                        Chapter3.tax "2.00" "invalid"
                            |> Expect.equal Nothing
            , skip <|
                test "should compute nothing for non-round rate" <|
                    \() ->
                        Chapter3.tax "1.00" "22.5"
                            |> Expect.equal Nothing
            , skip <|
                test "should compute valid value for simple example" <|
                    \() ->
                        Chapter3.tax "2.00" "21"
                            |> Expect.equal (Just 2.42)
            ]
        , describe "productOfLowestOdds"
            [ skip <|
                test "should return nothing for empty list" <|
                    \() ->
                        Chapter3.productOfLowestOdds []
                            |> Expect.equal Nothing
            , skip <|
                fuzz (list int) "should return nothing for a list that includes no odd numbers" <|
                    \numbers ->
                        numbers
                            |> List.map ((*) 2)
                            |> Chapter3.productOfLowestOdds
                            |> Expect.equal Nothing
            , skip <|
                test "should return the product for the lowest two odd numbers" <|
                    \() ->
                        [ 3, 7, 5 ]
                            |> Chapter3.productOfLowestOdds
                            |> Expect.equal (Just 15)
            , skip <|
                fuzz (list (intRange 1 10000)) "outcome should be nothing or an odd number for a generated list" <|
                    \numbers ->
                        numbers
                            |> Chapter3.productOfLowestOdds
                            |> Maybe.withDefault 1
                            |> modBy 2
                            |> Expect.equal 1
            ]
        ]
