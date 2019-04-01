module Util exposing (delay)

import Process
import Task


delay : Int -> a -> Cmd a
delay time msg =
    Process.sleep (toFloat time)
        |> Task.perform (always msg)
