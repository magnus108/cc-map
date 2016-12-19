module Msg exposing (Msg(NoOp, Click, Animate, Back))

import Time

import Destination

type Msg
    = NoOp
    | Click Destination.Destination
    | Animate Time.Time
    | Back
