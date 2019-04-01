module Memory exposing (main)

import Browser
import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- Model


type alias Model =
    { spot1 : Spot
    , spot2 : Spot
    }


type alias Spot =
    { card : Card
    , open : Bool
    }


type Msg
    = ToggleFirst
    | ToggleSecond



-- Setup Functions / Startup


initialModel : Model
initialModel =
    { spot1 =
        { card = Card "#69F" "A"
        , open = True
        }
    , spot2 =
        { card = Card "#3fa" "B"
        , open = False
        }
    }



-- Update Functions / User Interaction


toggleSpot : Spot -> Spot
toggleSpot spot =
    { spot | open = not spot.open }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleFirst ->
            { model | spot1 = toggleSpot model.spot1 }

        ToggleSecond ->
            { model | spot2 = toggleSpot model.spot2 }



-- View Functions


view : Model -> Html Msg
view model =
    div []
        [ div
            [ style "display" "inline-block"
            , onClick ToggleFirst
            ]
            [ if model.spot1.open then
                Card.viewCard model.spot1.card

              else
                Card.hidden
            ]
        , div
            [ style "display" "inline-block"
            , onClick ToggleSecond
            ]
            [ if model.spot2.open then
                Card.viewCard model.spot2.card

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
