module Colors exposing (Colors(..), color)

import Css exposing (Color, rgba)

type Colors
    = Primary
    | Secondary
    | Accent
    | Shadow1
    | Shadow2

color : Colors -> Color
color x =
    case x of
        Primary -> primary
        Secondary -> secondary
        Accent -> accent
        Shadow1 -> shadow1
        Shadow2 -> shadow2

primary : Color
primary = rgba 18 130 168 1

secondary : Color
secondary = rgba 32 168 178 1

accent : Color
accent = rgba 198 218 224 1

shadow1 : Color
shadow1 = rgba 74 7 7 1

shadow2 : Color
shadow2 = rgba 243 156 18 1
