module Memory exposing (main)

import Browser
import Card exposing (Card)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import List.Extra
import Random
import Random.List
import Time
import Util



-- Model


type alias Model =
    { grid : Grid
    , attempt : Attempt
    , now : Int
    , started : Maybe Int
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
    | Start
    | Tick Time.Posix
    | HandleResult



-- Setup Functions / Startup


initialModel : ( Model, Cmd Msg )
initialModel =
    ( { grid = []
      , attempt = NoPick
      , now = 0
      , started = Nothing
      }
    , Cmd.none
    )



-- Update Functions / User Interaction


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start ->
            ( { model | started = Just model.now, grid = generateGrid model.now }
            , Cmd.none
            )

        Tick posix ->
            ( { model | now = Time.posixToMillis posix }
            , Cmd.none
            )

        HandleResult ->
            ( case model.attempt of
                SecondPick first second ->
                    { model
                        | attempt = NoPick
                        , grid =
                            if first.card == second.card then
                                model.grid
                                    |> removeFromGrid first
                                    |> removeFromGrid second

                            else
                                model.grid
                                    |> toggleInGrid first
                                    |> toggleInGrid second
                    }

                _ ->
                    model
            , Cmd.none
            )

        Toggle spot ->
            case model.attempt of
                NoPick ->
                    ( { model
                        | grid = toggleInGrid spot model.grid
                        , attempt = FirstPick spot
                      }
                    , Cmd.none
                    )

                FirstPick first ->
                    ( { model
                        | grid = toggleInGrid spot model.grid
                        , attempt = SecondPick first spot
                      }
                    , Util.delay 700 HandleResult
                    )

                SecondPick first second ->
                    ( model, Cmd.none )


removeFromGrid : Spot -> Grid -> Grid
removeFromGrid spot grid =
    List.Extra.updateAt spot.location.y
        (List.Extra.updateAt spot.location.x removeSpot)
        grid


removeSpot : Spot -> Spot
removeSpot s =
    { s | state = Removed }


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
    case model.started of
        Nothing ->
            startButton

        Just momentOfStart ->
            div []
                [ div []
                    [ text "Started "
                    , text (String.fromInt (Util.diffInMillisToSeconds model.now momentOfStart))
                    , text " second(s) ago."
                    ]
                , viewGrid model.grid
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


startButton : Html Msg
startButton =
    button [ onClick Start ]
        [ text "Start game" ]



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


generateGrid : Int -> Grid
generateGrid seed =
    Card.deck
        |> List.concatMap (List.repeat 2)
        |> shuffle seed
        |> List.indexedMap closedSpotFromCard
        |> List.Extra.groupsOf gridWidth


isGridEmpty : Grid -> Bool
isGridEmpty grid =
    grid
        |> List.concat
        |> List.map .state
        |> List.all ((==) Removed)


shuffle : Int -> List Card -> List Card
shuffle seed input =
    Random.step (Random.List.shuffle input) (Random.initialSeed seed)
        |> Tuple.first


closedSpotFromCard : Int -> Card -> Spot
closedSpotFromCard index card =
    { card = card
    , state = Closed
    , location = locationFromInt index
    }



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 100 (\posix -> Tick posix)



-- Entrypoint


main : Program () Model Msg
main =
    Browser.element
        { init = always initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
