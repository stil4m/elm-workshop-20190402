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
    { -- TODO (part 2) Introduce a new type `State` to represent the state of a spot.
      -- This should be able to represent 3 different states (opened, closed, removed)
      open : Bool
    , card : Card
    , location : Location
    }


type Msg
    = Toggle Spot



-- Setup Functions / Startup


initialModel : Model
initialModel =
    { grid = generateGrid

    -- TODO (part 1) Set the initial value of the attempt
    , attempt = Debug.todo "Set initial value"
    }



-- Update Functions / User Interaction


update : Msg -> Model -> Model
update msg model =
    case msg of
        -- TODO (part 1) A spot is toggled, ensure the state of the attempt.
        Toggle spot ->
            { model | grid = toggleInGrid spot model.grid }


toggleInGrid : Spot -> Grid -> Grid
toggleInGrid spot grid =
    List.Extra.updateAt spot.location.y
        (List.Extra.updateAt spot.location.x toggleSpot)
        grid


toggleSpot : Spot -> Spot
toggleSpot s =
    -- TODO (part 2) Apply the following transistions:
    -- open -> closed
    -- closed -> open
    -- removed -> removed
    { s | open = not s.open }



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

        -- TODO (part 1) Ensure you can only open spots, not close them.
        -- The game will be responsible for closing them once you have finished your attempt.
        , onClick (Toggle spot)
        ]
        [ -- TODO (part 2) An `if` will not suffice anymore to render the correct state.
          -- Move to a more powerfull structure.
          if spot.open then
            Card.viewCard spot.card

          else
            Card.hidden
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

    -- TODO (part 2) Set the correct state here
    , open = False
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
