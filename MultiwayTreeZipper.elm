module MultiwayTreeZipper exposing
    ( Context (..)
    , Breadcrumbs
    , Zipper
    , goUp
    , goToChild
    )

import Utils exposing ((&>))
import MultiwayTree exposing (Tree(..))

type Context a
    = Context a (List (Tree a)) (List (Tree a))


type alias Breadcrumbs a =
    List (Context a)


type alias Zipper a =
    (Tree a, Breadcrumbs a)


goUp : Zipper a -> Maybe (Zipper a)
goUp ( tree, breadcrumbs ) =
    case breadcrumbs of
        (Context datum before after) :: bs ->
            Just ( Tree datum (before ++ [ tree ] ++ after), bs )

        [] ->
            Nothing


goToChild : Tree a -> Zipper a -> Maybe (Zipper a)
goToChild tree ( Tree datum children, breadcrumbs ) =
    let

        maybeSplit =
            elemIndex tree children
                &> (flip splitOnIndex children)

    in
        case (maybeSplit) of
            Nothing ->
                Nothing

            Just ( before, focus, after ) ->
                Just ( focus, (Context datum before after) :: breadcrumbs )


findIndex : (a -> Bool) -> List a -> Maybe Int
findIndex p = List.head << findIndices p


findIndices : (a -> Bool) -> List a -> List Int
findIndices p = List.map Tuple.first << List.filter (\(i,x) -> p x) << List.indexedMap (,)


elemIndex : a -> List a -> Maybe Int
elemIndex x = findIndex ((==)x)


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
