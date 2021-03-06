module Card exposing (Card, deck, hidden, main, placeholder, viewCard)

import Html exposing (..)
import Html.Attributes exposing (..)


main : Html msg
main =
    div []
        [ h1 [] [ text "A single card" ]
        , viewCard (Card "#ff89de" "A")
        , h1 [] [ text "Multiple cards beside each other" ]
        , div []
            [ viewCard (Card "#69f" "B")
            , viewCard (Card "#5fd" "C")
            ]
        , h1 [] [ text "A hidden card" ]
        , hidden
        , h1 [] [ text "The placeholder" ]
        , placeholder
        , h1 [] [ text "Deck" ]
        , div [] (List.map viewCard deck)
        ]


deck : List Card
deck =
    let
        letters =
            [ "A", "B", "C", "D", "1", "2", "3" ]

        colours =
            [ "#ff89de", "#69f", "#5fd" ]

        makeCard c l =
            { colour = c, text = l }
    in
    List.map2 makeCard
        (colours |> List.repeat (List.length letters) |> List.concat)
        (letters |> List.repeat (List.length colours) |> List.concat)


type alias Card =
    { colour : String, text : String }


viewCard : Card -> Html msg
viewCard card =
    div (cardStyling "solid" card.colour)
        [ text card.text ]


hidden : Html msg
hidden =
    div (cardStyling "solid" "#ccc")
        []


placeholder : Html msg
placeholder =
    div (cardStyling "dotted" "#fff")
        []


{-| The generic styles for a card. You can adjust the type of border ("solid"/"dotted"), and configure the background colour.
-}
cardStyling : String -> String -> List (Attribute msg)
cardStyling borderStyle backgroundColour =
    [ style "border" ("2px " ++ borderStyle ++ " black")
    , style "border-radius" "4px"
    , style "display" "inline-block"
    , style "width" "80px"
    , style "height" "80px"
    , style "text-align" "center"
    , style "line-height" "80px"
    , style "font-size" "80px"
    , style "vertical-align" "middle"
    , style "font-family" "Arial, Helvetica, sans-serif"
    , style "background" backgroundColour
    , style "margin" "2px"
    ]
