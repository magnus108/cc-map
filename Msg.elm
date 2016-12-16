module Msg exposing (Msg(..))

import Destination exposing (Destination)
import Time exposing (Time)

type Msg
    = NoOp
    | Click Destination
    | Animate Time
    | Back
   -- | Hover (Tree Node)
