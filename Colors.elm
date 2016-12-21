module Colors exposing (Palette, palette)

import Css exposing (Color, hex)


type alias Palette =
    { primaryDark : String
    , primaryLight : String
    , primary : String
    , accent : String
    , primaryText : String
    , secondaryText : String
    , divider : String
    , text : String
    }


palette : Palette
palette =
    { primaryDark = primaryDark
    , primaryLight = primaryLight
    , primary = primary
    , accent = accent
    , primaryText = primaryText
    , secondaryText = secondaryText
    , divider = divider
    , text = text
    }



primaryDark : String
primaryDark = "#512da8"

primaryLight : String
primaryLight = "#d1c4e9"

primary : String
primary = "#673ab7"

accent : String
accent = "#ff3081"

primaryText : String
primaryText = "#212121"

secondaryText : String
secondaryText = "#757575"

divider : String
divider = "#bdbdbd"

text : String
text = "#ffffff"
