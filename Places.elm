module Places exposing (..)
-- this should be moved to json at some point


import MultiwayTree
import Colors
import Destination exposing (Destination)

verden : MultiwayTree.Tree Destination
verden =
    -- maybe a little stupid that i have this as tilbage as it is a litte  bad to have 50 50 0
    MultiwayTree.Tree { x = 50, y = 50, z = 1, name = "Verden", textShadow = Colors.Shadow1}
        [afrika, nordamerika, sydamerika, europa, asien]


afrika : MultiwayTree.Tree Destination
afrika =
    MultiwayTree.Tree { x = 53, y = 53, z = 2, name = "Afrika", textShadow = Colors.Shadow1}
        [seychellerne]

seychellerne : MultiwayTree.Tree Destination
seychellerne =
    MultiwayTree.Tree { x = 63, y = 58, z = 2, name = "Seychellerne", textShadow = Colors.Shadow1}
        []

nordamerika : MultiwayTree.Tree Destination
nordamerika =
    MultiwayTree.Tree { x = 25, y = 35, z = 2, name = "Nordamerika", textShadow = Colors.Shadow1}
        [canada, usa, cuba, danskVestindien, mexico]

usa : MultiwayTree.Tree Destination
usa =
    MultiwayTree.Tree { x = 21, y = 35, z = 5, name = "USA", textShadow = Colors.Shadow1}
        [canada]

canada : MultiwayTree.Tree Destination
canada =
    MultiwayTree.Tree { x = 25, y = 27, z = 3, name = "Canda", textShadow = Colors.Shadow1}
        []

cuba : MultiwayTree.Tree Destination
cuba =
    MultiwayTree.Tree { x = 27, y = 45, z = 3, name = "Cuba", textShadow = Colors.Shadow1}
        []

danskVestindien : MultiwayTree.Tree Destination
danskVestindien =
    MultiwayTree.Tree { x = 30, y = 50, z = 3, name = "Dansk Vestindien", textShadow = Colors.Shadow1}
        []

mexico : MultiwayTree.Tree Destination
mexico =
    MultiwayTree.Tree { x = 20, y = 43, z = 3, name = "Mexico", textShadow = Colors.Shadow1}
        []


sydamerika : MultiwayTree.Tree Destination
sydamerika =
    MultiwayTree.Tree { x = 32, y = 65, z = 2, name = "Sydamerika", textShadow = Colors.Shadow1}
        [argentina, brasilien, chile, colombia, costaRica, ecuador, panama, peru]


argentina : MultiwayTree.Tree Destination
argentina =
    MultiwayTree.Tree { x = 32, y = 81, z = 3.5, name = "Argentina", textShadow = Colors.Shadow1}
        []

brasilien : MultiwayTree.Tree Destination
brasilien =
    MultiwayTree.Tree { x = 36, y = 59, z = 3.5, name = "Brasilien", textShadow = Colors.Shadow1}
        []

chile : MultiwayTree.Tree Destination
chile =
    MultiwayTree.Tree { x = 30, y = 75, z = 3.5, name = "Chile", textShadow = Colors.Shadow1}
        []

colombia : MultiwayTree.Tree Destination
colombia =
    MultiwayTree.Tree { x = 28, y = 58, z = 3.5, name = "Colombia", textShadow = Colors.Shadow1}
        []

costaRica : MultiwayTree.Tree Destination
costaRica =
    MultiwayTree.Tree { x = 26, y = 50, z = 3.5, name = "Costa Rica", textShadow = Colors.Shadow1}
        []

ecuador : MultiwayTree.Tree Destination
ecuador =
    MultiwayTree.Tree { x = 30, y = 62, z = 3.5, name = "Ecuador (Galapagos)", textShadow = Colors.Shadow1}
        []

panama : MultiwayTree.Tree Destination
panama =
    MultiwayTree.Tree { x = 27, y = 54, z = 3, name = "Panama", textShadow = Colors.Shadow1}
        []

peru : MultiwayTree.Tree Destination
peru =
    MultiwayTree.Tree { x = 28, y = 69, z = 3, name = "Peru", textShadow = Colors.Shadow1}
        []

europa : MultiwayTree.Tree Destination
europa =
    MultiwayTree.Tree { x = 51, y = 25, z = 5.0, name = "Europa", textShadow = Colors.Shadow1}
        [italien]

italien : MultiwayTree.Tree Destination
italien =
    MultiwayTree.Tree { x = 53, y = 33, z = 3, name = "Italien", textShadow = Colors.Shadow1}
        []


asien : MultiwayTree.Tree Destination
asien =
    MultiwayTree.Tree { x = 75, y = 45, z = 2.5, name = "Asien", textShadow = Colors.Shadow1}
        [burma, cambodia, dubai, filippinerne, indien, indonesien, japan, laos, malaysia, maldiverne, sriLanka, thailand, vietnam]

burma : MultiwayTree.Tree Destination
burma =
    MultiwayTree.Tree { x = 75, y = 47, z = 2, name = "Burma", textShadow = Colors.Shadow1}
        []

cambodia : MultiwayTree.Tree Destination
cambodia =
    MultiwayTree.Tree { x = 78, y = 50, z = 2, name = "Cambodia", textShadow = Colors.Shadow1}
        []

dubai : MultiwayTree.Tree Destination
dubai =
    MultiwayTree.Tree { x = 64, y = 43, z = 2, name = "Dubai", textShadow = Colors.Shadow1}
        []

filippinerne : MultiwayTree.Tree Destination
filippinerne =
    MultiwayTree.Tree { x = 87, y = 54, z = 2, name = "Filippinerne", textShadow = Colors.Shadow1}
        []

indien : MultiwayTree.Tree Destination
indien =
    MultiwayTree.Tree { x = 70, y = 50, z = 2, name = "Indien", textShadow = Colors.Shadow1}
        []

indonesien : MultiwayTree.Tree Destination
indonesien =
    MultiwayTree.Tree { x = 87, y = 62, z = 2, name = "Indonesien (Bali)", textShadow = Colors.Shadow1}
        []

japan : MultiwayTree.Tree Destination
japan =
    MultiwayTree.Tree { x = 86, y = 35, z = 2, name = "Japan", textShadow = Colors.Shadow1}
        []

laos : MultiwayTree.Tree Destination
laos =
    MultiwayTree.Tree { x = 76, y = 44, z = 2, name = "Laos", textShadow = Colors.Shadow1}
        []

malaysia : MultiwayTree.Tree Destination
malaysia =
    MultiwayTree.Tree { x = 81, y = 58, z = 2, name = "Malaysia (Borneo)", textShadow = Colors.Shadow1}
        []

maldiverne : MultiwayTree.Tree Destination
maldiverne =
    MultiwayTree.Tree { x = 69, y = 57, z = 2, name = "Maldiverne", textShadow = Colors.Shadow1}
        []

sriLanka : MultiwayTree.Tree Destination
sriLanka =
    MultiwayTree.Tree { x = 70, y = 53, z = 2, name = "Sri Lanka", textShadow = Colors.Shadow1}
        []

vietnam : MultiwayTree.Tree Destination
vietnam =
    MultiwayTree.Tree { x = 81, y = 47, z = 2, name = "Vietnam", textShadow = Colors.Shadow1}
        []

thailand : MultiwayTree.Tree Destination
thailand =
    MultiwayTree.Tree { x = 78, y = 54, z = 2, name = "Thailand", textShadow = Colors.Shadow1}
        []
