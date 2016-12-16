module Container exposing (container)

import Html exposing (Html, Attribute, div)
import Css exposing
    ( width
    , hidden
    , pct
    , overflow
    )
import Styles exposing (styles)
import Msg exposing (Msg(..))


containerStyle : Attribute msg
containerStyle =
    styles
        [ width (pct 100)
        , overflow hidden
        ]

container : List (Html Msg) -> Html Msg
container =
    div [ containerStyle ]
   --container : List (Html.attiribut msg) -> List (Html msg) -> Html msg
   -- divi
   -- would it make sence though?
