module MultiwayTree exposing
    ( Tree (..)
    , Forest
    , datum
    , children
    )

--coould be type Tree a b
type Tree a
    = Branch a (Forest a)
    | Leaf a


type alias Forest a =
    List (Tree a)

datum : Tree a -> a
datum tree =
    case tree of
        Branch datum branches
            -> datum

        Leaf datum
            -> datum

children : Tree a -> Forest a
children tree =
    case tree of
        Branch datum branches
            -> branches

        Leaf datum
            -> []
