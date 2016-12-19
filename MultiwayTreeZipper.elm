module MultiwayTreeZipper exposing
    ( Context (Context)
    , Breadcrumbs
    , Zipper
    , goUp
    , goToChild
    , isRoot
    , children
    , datum
    )

import MultiwayTree


type Context a
    = Context a (List (MultiwayTree.Tree a)) (List (MultiwayTree.Tree a))


type alias Breadcrumbs a =
    List (Context a)


type alias Zipper a =
    { tree : MultiwayTree.Tree a
    , breadcrumbs : Breadcrumbs a
    }


(&>) : Maybe a -> (a -> Maybe b) -> Maybe b
(&>) = flip Maybe.andThen


goUp : Zipper a -> Maybe (Zipper a)
goUp zipper =
    case zipper.breadcrumbs of
        (Context datum before after) :: bs ->
            Just
                { zipper
                | tree = MultiwayTree.Tree datum (before ++ [ zipper.tree ] ++ after)
                , breadcrumbs = bs
                }

        [] ->
            Nothing


goToChild : a -> Zipper a -> Maybe (Zipper a)
goToChild child zipper =
    let
        (MultiwayTree.Tree datum children) = zipper.tree

        maybeSplit =
            datumIndex child children
                &> (flip splitOnIndex children)

    in
        case (maybeSplit) of
            Nothing ->
                Nothing

            Just ( before, focus, after ) ->
                Just
                    { zipper
                    | tree = focus
                    , breadcrumbs = (Context datum before after) :: zipper.breadcrumbs
                    }


findIndex : (a -> Bool) -> List a -> Maybe Int
findIndex p = List.head << findIndices p


findIndices : (a -> Bool) -> List a -> List Int
findIndices p = List.map Tuple.first << List.filter (\(i,x) -> p x) << List.indexedMap (,)


datumIndex : a -> List (MultiwayTree.Tree a) -> Maybe Int
datumIndex x = findIndex (compareWithDatum x)


compareWithDatum : a -> MultiwayTree.Tree a -> Bool
compareWithDatum elem (MultiwayTree.Tree datum children) =
    datum == elem


splitOnIndex : Int -> List (MultiwayTree.Tree a) -> Maybe ( List (MultiwayTree.Tree a), MultiwayTree.Tree a, List (MultiwayTree.Tree a) )
splitOnIndex n xs =
    let
        before =
            List.take n xs

        focus =
            List.drop n xs |> List.head

        after =
            List.drop (n + 1) xs
    in
        case focus of
            Nothing ->
                Nothing

            Just f ->
                Just ( before, f, after )


isRoot : Zipper a -> Bool
isRoot zipper =
    List.isEmpty zipper.breadcrumbs


children : Zipper a -> MultiwayTree.Forest a
children zipper =
    MultiwayTree.children zipper.tree

datum : Zipper a -> a
datum zipper =
    MultiwayTree.datum zipper.tree
