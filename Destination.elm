module Destination exposing (Destination)

import Colors exposing (Colors(..))

type alias Destination =
    { x : Float
    , y : Float
    , z : Float
    , name : String
    , textShadow : Colors
    }

