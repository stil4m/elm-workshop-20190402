module Memory exposing (main)

import Browser
import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- Model


type alias Model =
    -- TODO add two properties to represent if the cards are open or closed
    {}


type
    Msg
    -- TODO Remove the `ToDo` and replace it with two different 'messages' representing the user's actions.
    = ToDo



-- Setup Functions / Startup


initialModel : Model
initialModel =
    -- TODO Setup the initial model: fill in the initial values for the properties you've specified in the first TODO
    {}



-- Update Functions / User Interaction


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToDo ->
            -- TODO Update the model based on your action. An example from the counter is listed below:
            -- { model | count = model.count + 1 }
            model



-- View Functions


view : Model -> Html Msg
view model =
    div []
        [ div
            [ style "display" "inline-block"

            -- TODO Event to trigger the first card to be closed or opened
            ]
            [ -- TODO Add logic to render the first card visible or hidden
              Card.viewCard (Card "#69F" "A")
            ]
        , div
            [ style "display" "inline-block"

            -- TODO Event to trigger the second card to be closed or opened
            ]
            [ -- TODO Add logic to render the second card visible or hidden
              Card.viewCard (Card "#3fa" "B")
            ]
        ]



-- Entrypoint


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
