module MultiwayTree exposing
    ( Tree (..)
    , Forest
    , datum
    , children
    )

type Tree a
    = Tree a (Forest a)


type alias Forest a =
    List (Tree a)

datum : Tree a -> a
datum (Tree datum children) =
    datum

children : Tree a -> Forest a
children (Tree datum children) =
    children
