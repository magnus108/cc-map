module MultiwayTree exposing
    ( Tree (..)
    , Forest
    , datum
    , children
    , isLeaf
    , foldr
    , flatten
    , tuplesOfDatumAndFlatChildren
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


isLeaf : Tree a -> Bool
isLeaf tree =
    List.isEmpty (children tree)


foldr : (a -> b -> b) -> b -> Tree a -> b
foldr f accu (Tree datum children) =
    let
        treeUnwrap (Tree datum_ children_) accu_ =
            f datum_ (List.foldr treeUnwrap accu_ children_)
    in
        f datum (List.foldr treeUnwrap accu children)


flatten : Tree a -> List a
flatten tree =
    foldr (::) [] tree


tuplesOfDatumAndFlatChildren : Tree a -> List ( a, List a )
tuplesOfDatumAndFlatChildren (Tree datum children) =
    [ ( datum, List.concatMap flatten children ) ] ++ (List.concatMap tuplesOfDatumAndFlatChildren children)
