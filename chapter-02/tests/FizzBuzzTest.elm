module FizzBuzzTest exposing (suite)

import Expect exposing (Expectation)
import FizzBuzz
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "FizzBuzz"
        [ describe "single"
            [ skip <|
                test "should return '1' for 1" <|
                    \() ->
                        FizzBuzz.single 1
                            |> Expect.equal "1"
            , skip <|
                test "should return 'Fizz' for 3" <|
                    \() ->
                        FizzBuzz.single 3
                            |> Expect.equal "Fizz"
            , skip <|
                test "should return 'Buzz' for 5" <|
                    \() ->
                        FizzBuzz.single 5
                            |> Expect.equal "Buzz"
            , skip <|
                test "should return 'FizzBuzz' for 15" <|
                    \() ->
                        FizzBuzz.single 15
                            |> Expect.equal "FizzBuzz"
            , skip <|
                fuzz int "multiplicants of 3 should always contain Fizz" <|
                    \n ->
                        n
                            * 3
                            |> FizzBuzz.single
                            |> String.contains "Fizz"
                            |> Expect.true "To be true"
            , skip <|
                fuzz int "multiplicants of 5 should always contain Buzz" <|
                    \n ->
                        n
                            * 5
                            |> FizzBuzz.single
                            |> String.contains "Buzz"
                            |> Expect.true "To be true"
            ]
        , describe "many"
            [ skip <|
                test "should return an empty string for wrong input" <|
                    \() ->
                        FizzBuzz.many 100 1
                            |> Expect.equal ""
            , skip <|
                test "should compute first 15 correctly" <|
                    \() ->
                        FizzBuzz.many 1 15
                            |> Expect.equal "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"
            ]
        ]
