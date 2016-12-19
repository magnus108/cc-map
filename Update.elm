module Update exposing (update)

import Model
import Msg

import Destination
import Tween
import MultiwayTree
import MultiwayTreeZipper


startTimer : Model.Model -> Model.Model
startTimer model =
    { model | t1 = model.t }


updateDomain : (MultiwayTreeZipper.Zipper Destination.Destination -> Maybe (MultiwayTreeZipper.Zipper Destination.Destination)) -> Model.Model -> Model.Model
updateDomain fn model =
    { model
    | zipper = Maybe.withDefault model.zipper (fn model.zipper)
    }


updatePosition : Model.Model -> Model.Model
updatePosition model =
    let
        {x, y, z} = MultiwayTree.datum model.zipper.tree
    in
        { model
        | x2 = z*(50-x)
        , y2 = z*(50-y)
        , z2 = z
        }


update : Msg.Msg -> Model.Model -> (Model.Model, Cmd Msg.Msg)
update msg model =

    case msg of

        Msg.NoOp ->
            model ! []

        Msg.Back ->
            (model
                |> updateDomain MultiwayTreeZipper.goUp
                |> updatePosition
                |> startTimer
                , Cmd.none)

        Msg.Click destination ->

            (model
                |> updateDomain (MultiwayTreeZipper.goToChild destination)
                |> updatePosition
                |> startTimer
                , Cmd.none)

        Msg.Animate _ ->
            let
                updatePosition model =
                    let
                        {t
                        ,t1
                        ,t2
                        ,x1
                        ,x2
                        ,y1
                        ,y2
                        ,z1
                        ,z2
                        } = model

                        dt = t-t1

                        dx = x2-x1

                        dy = y2-y1

                        dz = z2-z1

                        cx = Tween.linearTween dt x1 dx t2
                        cy = Tween.linearTween dt y1 dy t2
                        cz = Tween.linearTween dt z1 dz t2
                    in
                        { model
                        | x1 = cx
                        , y1 = cy
                        , z1 = cz
                        }

                updateTime model =
                    { model | t = model.t + 1 }

                model_ =
                    model
                        |> updatePosition
                        |> updateTime

            in
                model_ ! []
