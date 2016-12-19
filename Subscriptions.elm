module Subscriptions exposing (subscriptions)

import Model
import Msg
import AnimationFrame

subscriptions : Model.Model -> Sub Msg.Msg
subscriptions model =
    AnimationFrame.diffs Msg.Animate
