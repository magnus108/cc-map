module View exposing (view)

import Html exposing (Html)
import Html.Attributes

import Model exposing (Model)
import Msg exposing (Msg)

import Container exposing (container)
import MapView exposing (mapView)

view : Model -> Html Msg
view model =
    -- bad
    Html.div
         -- bad
        [ Html.Attributes.style [("background", "linear-gradient(to bottom,#20a8b2,#00a6de)")]
        ]
        [ --bad
          Html.node "link" [Html.Attributes.href "https://fonts.googleapis.com/css?family=Calligraffitti", Html.Attributes.rel "stylesheet"] []
        , container [mapView model]
        ]
