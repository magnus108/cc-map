module DestinationView exposing (destinationView, destinationsView)

import Svg exposing (Svg, a, text_, text, g)
import Svg.Attributes exposing (xlinkHref, x, y, fill, textAnchor)
import Svg.Events exposing (onClick)

import Css exposing
    ( fontSize
    , fontFamilies
    , fontWeight
    , bold
    , textShadow4
    , px
    )

import Model exposing (Model)
import Html exposing (Html, Attribute)

import MultiwayTree exposing (Tree(..))
import Destination exposing (Destination)

import Msg exposing (Msg(..))

import Styles exposing (styles)
import Colors exposing (Colors(..), toColor)
import MultiwayTreeZipper exposing (children)
import List as L

--isted for child skriv destination
destinationView : Tree Destination -> Svg Msg
destinationView child =
    case child of
        (Branch destination branches) ->
            a
                [ xlinkHref ("#" ++ destination.name)
                , onClick (Click destination)
                ]
                [ text_
                    [ x (toString destination.x ++ "%")
                    , y (toString destination.y ++ "%")
                    , fill "white"
                    , textAnchor "middle"
                    ]
                    [ text destination.name
                    ]
                ]

        (Leaf destination) ->
            text_
                [ x (toString destination.x ++ "%")
                , y (toString destination.y ++ "%")
                , fill "white"
                , textAnchor "middle"
                ]
                [ text destination.name
                ]


destinationViewStyle : Attribute msg
destinationViewStyle =
    styles
        [ fontSize (px 72)
        , fontFamilies ["Calligraffitti", "cursive"]
        , fontWeight bold
        , textShadow4 (px 4) (px 4) (px 4) (toColor Shadow1)
        ]


destinationsView : Model -> Html Msg
destinationsView model =
    g [ destinationViewStyle ] (L.map destinationView (children model.zipper))
