module MultiwayTreeZipper exposing
    ( Context (..)
    , Breadcrumbs
    , Zipper
    , goUp
    , goToChild
    , isRoot
    , children
    )


import MultiwayTree exposing (Tree(..), Forest)


type Context a
    = Context a (List (Tree a)) (List (Tree a))


type alias Breadcrumbs a =
    List (Context a)


type alias Zipper a =
    (Tree a, Breadcrumbs a)


(&>) : Maybe a -> (a -> Maybe b) -> Maybe b
(&>) = flip Maybe.andThen


goUp : Zipper a -> Maybe (Zipper a)
goUp ( tree, breadcrumbs ) =
    case breadcrumbs of
        (Context datum before after) :: bs ->
            Just ( Branch datum (before ++ [ tree ] ++ after), bs )

        [] ->
            Nothing


goToChild : a -> Zipper a -> Maybe (Zipper a)
goToChild child zipper =
    case zipper of
        (Branch datum children, breadcrumbs) ->
            let
                maybeSplit =
                    datumIndex child children
                        &> (flip splitOnIndex children)

            in
                case (maybeSplit) of
                    Nothing ->
                        Nothing

                    Just ( before, focus, after ) ->
                        Just ( focus, (Context datum before after) :: breadcrumbs )

        (Leaf datum, breadcrumbs) ->
            Nothing

--maybe move list functions out of here
findIndex : (a -> Bool) -> List a -> Maybe Int
findIndex p = List.head << findIndices p


findIndices : (a -> Bool) -> List a -> List Int
findIndices p = List.map Tuple.first << List.filter (\(i,x) -> p x) << List.indexedMap (,)


datumIndex : a -> List (Tree a) -> Maybe Int
datumIndex x = findIndex (compareWithDatum x)


compareWithDatum : a -> Tree a -> Bool
compareWithDatum elem tree =
    MultiwayTree.datum tree == elem


splitOnIndex : Int -> List (Tree a) -> Maybe ( List (Tree a), Tree a, List (Tree a) )
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


datum : Zipper a -> a
datum ( tree, breadcrumbs ) =
    MultiwayTree.datum tree


children : Zipper a -> Forest a
children ( tree, breadcrumbs ) =
    MultiwayTree.children tree


isRoot : Zipper a -> Bool
isRoot ( tree, breadcrumbs ) =
    case breadcrumbs of
        [] ->
            True
        otherwise ->
            False
