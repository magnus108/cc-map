module Tween exposing (linearTween)

linearTween : Float -> Float -> Float -> Float -> Float
linearTween t b c d =
    c*t/d+b
