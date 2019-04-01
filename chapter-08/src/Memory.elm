module Memory exposing (main)

import Browser
import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import List.Extra



-- Model


type alias Model =
    { grid : Grid
    , attempt : Attempt
    }


type Attempt
    = NoPick
    | FirstPick Spot
    | SecondPick Spot Spot


type alias Spot =
    { state : State
    , card : Card
    , location : Location
    }


type State
    = Opened
    | Closed
    | Removed


type Msg
    = Toggle Spot



-- Setup Functions / Startup


initialModel : Model
initialModel =
    { grid = generateGrid
    , attempt = NoPick
    }



-- Update Functions / User Interaction


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle spot ->
            case model.attempt of
                NoPick ->
                    { model
                        | grid = toggleInGrid spot model.grid
                        , attempt = FirstPick spot
                    }

                FirstPick first ->
                    { model
                        | grid = toggleInGrid spot model.grid
                        , attempt = SecondPick first spot
                    }

                SecondPick first second ->
                    Debug.todo "Implement me"


toggleInGrid : Spot -> Grid -> Grid
toggleInGrid spot grid =
    List.Extra.updateAt spot.location.y
        (List.Extra.updateAt spot.location.x toggleSpot)
        grid


toggleSpot : Spot -> Spot
toggleSpot s =
    case s.state of
        Opened ->
            { s | state = Closed }

        Closed ->
            { s | state = Opened }

        Removed ->
            { s | state = Removed }



-- View Functions


view : Model -> Html Msg
view model =
    div []
        [ viewGrid model.grid
        ]


viewGrid : Grid -> Html Msg
viewGrid grid =
    div []
        (List.map viewRow grid)


viewRow : List Spot -> Html Msg
viewRow row =
    div []
        (List.map viewCard row)


viewCard : Spot -> Html Msg
viewCard spot =
    div
        [ style "display" "inline-block"
        ]
        [ case spot.state of
            Opened ->
                Card.viewCard spot.card

            Closed ->
                div
                    [ style "display" "inline-block"
                    , onClick (Toggle spot)
                    ]
                    [ Card.hidden ]

            Removed ->
                Card.placeholder
        ]



--- Grid


type alias Location =
    { x : Int, y : Int }


gridWidth : Int
gridWidth =
    7


locationFromInt : Int -> Location
locationFromInt n =
    let
        x =
            modBy gridWidth n

        y =
            n // gridWidth
    in
    Location x y


type alias Grid =
    List (List Spot)


generateGrid : Grid
generateGrid =
    Card.deck
        |> List.concatMap (List.repeat 2)
        |> List.indexedMap closedSpotFromCard
        |> List.Extra.groupsOf gridWidth


closedSpotFromCard : Int -> Card -> Spot
closedSpotFromCard index card =
    { card = card
    , state = Closed
    , location = locationFromInt index
    }



-- Entrypoint


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
