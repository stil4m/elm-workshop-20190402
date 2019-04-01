module Card exposing (hidden, main, placeholder, viewCard)

import Html exposing (..)
import Html.Attributes exposing (..)


main : Html msg
main =
    div []
        [ h1 [] [ text "A single card" ]
        , viewCard "#ff89de" "A"
        , h1 [] [ text "Multiple cards beside each other" ]
        , div []
            [ viewCard "#69f" "B"
            , viewCard "#5fd" "C"
            ]
        , h1 [] [ text "A hidden card" ]
        , hidden
        , h1 [] [ text "The placeholder" ]
        , placeholder
        ]


viewCard : String -> String -> Html msg
viewCard colour textValue =
    -- TODO Create a div with the correct styling (use `cardStyling`) and text.
    text "todo"


hidden : Html msg
hidden =
    -- TODO Create a div with the correct styling (use `cardStyling`) and *no* text.
    text "todo"


placeholder : Html msg
placeholder =
    -- TODO Create a div with the correct styling (use `cardStyling`) and *no* text.
    text "todo"


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
