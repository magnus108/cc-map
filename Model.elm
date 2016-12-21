module Model exposing (Model, init)

import Msg
import MultiwayTree
import MultiwayTreeZipper
import Destination

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
    , zipper : MultiwayTreeZipper.Zipper Destination.Destination
    }


initialZipper : MultiwayTreeZipper.Zipper Destination.Destination
initialZipper =
    { tree = verden
    , breadcrumbs = []
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
    , zipper = initialZipper
    }


init : (Model, Cmd Msg.Msg)
init =
    initialModel ! []


verden : MultiwayTree.Tree Destination.Destination
verden =
    MultiwayTree.Tree { x = 50, y = 50, z = 1, name = "Verden"}
        [ MultiwayTree.Tree { x = 53, y = 53, z = 2, name = "Afrika"}
            [ MultiwayTree.Tree { x = 63, y = 58, z = 2, name = "Seychellerne"} []
            ]
        , MultiwayTree.Tree { x = 25, y = 35, z = 2, name = "Nordamerika"}
            [ MultiwayTree.Tree { x = 25, y = 27, z = 3, name = "Canda"} []
            , MultiwayTree.Tree { x = 21, y = 35, z = 5, name = "USA"}
                [ MultiwayTree.Tree { x = 21, y = 35, z = 5, name = "New York"} []
                ]
            , MultiwayTree.Tree { x = 27, y = 45, z = 3, name = "Cuba"} []
            , MultiwayTree.Tree { x = 30, y = 50, z = 3, name = "Dansk Vestindien"} []
            , MultiwayTree.Tree { x = 20, y = 43, z = 3, name = "Mexico"} []
            ]
        , MultiwayTree.Tree { x = 32, y = 65, z = 2, name = "Sydamerika"}
            [ MultiwayTree.Tree { x = 32, y = 81, z = 3.5, name = "Argentina"} []
            , MultiwayTree.Tree { x = 36, y = 59, z = 3.5, name = "Brasilien"} []
            , MultiwayTree.Tree { x = 30, y = 75, z = 3.5, name = "Chile"} []
            , MultiwayTree.Tree { x = 28, y = 58, z = 3.5, name = "Colombia"} []
            , MultiwayTree.Tree { x = 26, y = 50, z = 3.5, name = "Costa Rica"} []
            , MultiwayTree.Tree { x = 30, y = 62, z = 3.5, name = "Ecuador (Galapagos)"} []
            , MultiwayTree.Tree { x = 27, y = 54, z = 3, name = "Panama"} []
            , MultiwayTree.Tree { x = 28, y = 69, z = 3, name = "Peru"} []
            ]
        , MultiwayTree.Tree { x = 51, y = 25, z = 5.0, name = "Europa"}
            [ MultiwayTree.Tree { x = 53, y = 33, z = 3, name = "Italien"} []
            ]
        , MultiwayTree.Tree { x = 75, y = 45, z = 2.5, name = "Asien"}
            [ MultiwayTree.Tree { x = 75, y = 47, z = 2, name = "Burma"} []
            , MultiwayTree.Tree { x = 78, y = 50, z = 2, name = "Cambodia"} []
            , MultiwayTree.Tree { x = 64, y = 43, z = 2, name = "Dubai"} []
            , MultiwayTree.Tree { x = 87, y = 54, z = 2, name = "Filippinerne"} []
            , MultiwayTree.Tree { x = 70, y = 50, z = 2, name = "Indien"} []
            , MultiwayTree.Tree { x = 87, y = 62, z = 2, name = "Indonesien (Bali)"} []
            , MultiwayTree.Tree { x = 86, y = 35, z = 2, name = "Japan"} []
            , MultiwayTree.Tree { x = 76, y = 44, z = 2, name = "Laos"} []
            , MultiwayTree.Tree { x = 81, y = 58, z = 2, name = "Malaysia (Borneo)"} []
            , MultiwayTree.Tree { x = 69, y = 57, z = 2, name = "Maldiverne"} []
            , MultiwayTree.Tree { x = 70, y = 53, z = 2, name = "Sri Lanka"} []
            , MultiwayTree.Tree { x = 81, y = 47, z = 2, name = "Vietnam"} []
            , MultiwayTree.Tree { x = 78, y = 54, z = 2, name = "Thailand"} []
            ]
        ]
