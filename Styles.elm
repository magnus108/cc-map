module Styles exposing (styles)

import Css exposing (Mixin, asPairs)
import Html exposing (Attribute)
import Html.Attributes exposing (style)

styles : List Mixin -> Attribute msg
styles =
    asPairs >> style
