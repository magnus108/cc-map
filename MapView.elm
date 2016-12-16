module MapView exposing (mapView)

import Css exposing
    ( width
    , height
    , position
    , transforms
    , relative
    , scale
    , px
    , pct
    , auto
    , display
    , block
    , marginLeft
    , marginRight
    , translate2
    )
import Styles exposing (styles)

import Html exposing (Html, Attribute)
import Html.Attributes exposing (style)
import Svg exposing (svg, g, path)
import Svg.Attributes exposing (version, viewBox)

import Model exposing (Model)
import Msg exposing (Msg)

import WorldMap exposing (worldMap)

import DestinationView exposing (destinationsView)
import BackButtonView exposing (backButtonView)


mapViewStyles : Model -> Attribute msg
mapViewStyles model =
    styles
        [ position relative
        , transforms
            [ translate2 (pct model.x1) (pct model.y1)
            , scale model.z1
            ]
        , marginLeft auto
        , marginRight auto
        , display block
        , height (px 500)
        , width (px 1000)
        ]


mapView : Model -> Html Msg
mapView model =
    svg
        [ version "1.1"
        , viewBox "0 0 2000 1001"
        , mapViewStyles model
        , style
            ---USE SVG GAUSSIAN FILTER PLEASE
            --- bad
            [ ("webkit-filter", "drop-shadow( 0px 4px 0px #2e6c7d)")
            , ("filter", "drop-shadow( 0px 4px 0px #2e6c7d)")
            ]
        ]
        [ worldMap
        , destinationsView model
        , backButtonView model
        ]
