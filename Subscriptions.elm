module Subscriptions exposing (subscriptions)

import Model exposing (Model)
import Msg exposing (Msg(..))
import AnimationFrame exposing (diffs)

subscriptions : Model -> Sub Msg
subscriptions model =
    diffs Animate
