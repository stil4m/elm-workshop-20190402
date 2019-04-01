module Memory exposing (main)

import Browser
import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- Model


type alias Model =
    { firstCard : Bool, secondCard : Bool }


type Msg
    = ToggleFirst
    | ToggleSecond



-- Setup Functions / Startup


initialModel : Model
initialModel =
    { firstCard = True, secondCard = False }



-- Update Functions / User Interaction


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleFirst ->
            { model | firstCard = not model.firstCard }

        ToggleSecond ->
            { model | secondCard = not model.secondCard }



-- View Functions


view : Model -> Html Msg
view model =
    div []
        [ div
            [ style "display" "inline-block"
            , onClick ToggleFirst
            ]
            [ if model.firstCard then
                Card.viewCard (Card "#69F" "A")

              else
                Card.hidden
            ]
        , div
            [ style "display" "inline-block"
            , onClick ToggleSecond
            ]
            [ if model.secondCard then
                Card.viewCard (Card "#3fa" "B")

              else
                Card.hidden
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
