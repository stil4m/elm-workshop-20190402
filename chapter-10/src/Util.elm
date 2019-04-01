module Util exposing (delay, diffInMillisToSeconds)

import Process
import Task


delay : Int -> a -> Cmd a
delay time msg =
    Process.sleep (toFloat time)
        |> Task.perform (always msg)


{-| Compute the difference between two timestamps and convert it to an amount in seconds:

    diffInMillisToSeconds 51600 60700 == 9

-}
diffInMillisToSeconds : Int -> Int -> Int
diffInMillisToSeconds left right =
    abs (left - right) // 1000
