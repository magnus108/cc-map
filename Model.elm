module Model exposing (Model, init)

import Msg exposing (Msg(..))
import MultiwayTreeZipper exposing (Zipper)
import Destination exposing (Destination)

import Places exposing (verden)


type alias Model =
    { t : Float
    , t1 : Float
    , t2 : Float
    , x1 : Float
    , x2 : Float
    , y1 : Float
    , y2 : Float
    , z1 : Float
    , z2 : Float
    , zipper : Zipper Destination
    }


initialModel : Model
initialModel =
    { t = 0
    , t1 = 0
    , t2 = 150
    , x1 = 150
    , x2 = 0
    , y1 = -150
    , y2 = 0
    , z1 = 3
    , z2 = 1
    , zipper = (verden, [])
    }


init : (Model, Cmd Msg)
init =
    initialModel ! []
