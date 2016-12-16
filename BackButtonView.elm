module BackButtonView exposing (backButtonView)


import Html exposing (Html, text)
import Model exposing (Model)
import Msg exposing (Msg(..))

import Css exposing
    ( transforms
    , scale
    , textShadow4
    , px
    )

import Styles exposing (styles)

import MultiwayTreeZipper exposing (isRoot)

import Colors exposing (Colors(..), toColor)

import Svg exposing (svg, a, path)
import Svg.Attributes exposing
    ( x
    , y
    , xlinkHref
    , fill
    , stroke
    , strokeWidth
    , strokeOpacity
    , d
    )
import Svg.Events exposing (onClick)


backButtonView : Model -> Html Msg
backButtonView model =
    if (isRoot model.zipper) then
        text ""
    else
        svg
            [ styles
                [ textShadow4 (px 4) (px 4) (px 4) (toColor Shadow1)
                ]
                --- lav dette om til functioner at some point
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
                --- SPLIT ALT HER UD I CSS
            , x (toString ((-1*((model.x1/model.z1)-50))-((50*0.95)/model.z1)) ++ "%")
            , y (toString ((-1*((model.y1/model.z1)-50))-((50*0.95)/model.z1)) ++ "%")
            ]
            [ a
                [ xlinkHref ("#" ++ "Tilbage")
                , onClick Back
                , styles
                    [ transforms
                        [ scale (6/model.z1)
                        ]
                    ]
                ]
                [ path
                    [ fill "white"
                    , strokeOpacity "0.9"
                    , strokeWidth "0.8"
                    , stroke "#382c37"
                    -- den her skal nok ikke være der.
                    , d "M10,9V5L3,12L10,19V14.9C15,14.9 18.5,16.5 21,20C20,15 17,10 10,9Z"]
                    []
                ]
            ]
