module Memory exposing (main)

import Browser
import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- Model


type alias Model =
    -- TODO We are going to refactor the model.
    -- You can remove the existing model, uncomment the code below and work from there.
    -- Maybe the first step would be is to think about what a `Spot` is?
    --
    -- { spot1 : Spot
    -- , spot2 : Spot
    -- }
    { firstCard : Bool
    , secondCard : Bool
    }


type Msg
    = ToggleFirst
    | ToggleSecond



-- Setup Functions / Startup


initialModel : Model
initialModel =
    { firstCard = True, secondCard = False }



-- Update Functions / User Interaction
-- TODO You will probably need this function
-- toggleSpot : Spot -> Spot
-- toggleSpot spot =
--     Debug.todo "Implement me"


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
