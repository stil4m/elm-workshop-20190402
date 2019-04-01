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
    = -- TODO Add an additional case to handle the result (`HandleResults`) when a user has picked two spots
      -- We will trigger this after an interval once he/she made all required actions
      Toggle Spot



-- Setup Functions / Startup


initialModel : ( Model, Cmd Msg )
initialModel =
    ( { grid = generateGrid
      , attempt = NoPick
      }
    , Cmd.none
    )



-- Update Functions / User Interaction


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        {- TODO Imlement logic for the `HandleResult` variant.
           We only want to do things if we are actually in the `SecondPick` attempt.
           - If the cards from both spots are the same, we should set the spots on the `Removed` state (`removeFromGrid`).
           - If the cards from both spots are the same, we should toggle the spots (`toggleInGrid`).
           - We should always reset the attempt.
        -}
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
                    , -- TODO The user has picked the second spot.
                      -- We want to schedule the new action we have just created after .7 seconds
                      -- You can use the `delay` function that was added in the `Util.elm` file.
                      Cmd.none
                    )

                SecondPick first second ->
                    -- TODO It turns out that we do not want to do anything here.
                    -- Should be easy right?
                    Debug.todo "Implement me"


removeFromGrid : Spot -> Grid -> Grid
removeFromGrid spot grid =
    -- TODO Implement this Function
    -- Take a look at `toggleInGrid` and change it accordingly.
    Debug.todo "Impelment me"


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
    Browser.element
        { init = always initialModel
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
