module Update exposing (update)

import Model exposing (Model)
import Msg exposing (Msg(..))

import Tween exposing (linearTween)
import MultiwayTreeZipper exposing (Zipper, goUp, goToChild)




startTimer : Model -> Model
startTimer model =
    { model
    | t1 = model.t
    }



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            model ! []

        Back ->
            let

                updateDomain model =
                    let
                        {zipper} = model
                    in
                        { model
                        -- okay so maybe this should have an error.
                        | zipper = Maybe.withDefault zipper (goUp zipper)
                        }

                {-
                updatePosition model =
                    let
                        {t, zipper} = model

                        tree =
                            case zipper of
                                Nothing -> verden
                                Just (a, b) ->
                                    a

                        (MultiwayTree.Tree {x, y, z} b) = tree

                        x2 = z*(50-x)
                        y2 = z*(50-y)
                    in
                        { model
                        | x2 = x2
                        , y2 = y2
                        , z2 = z
                        , t1 = t
                        }
                        -}

                model_ =
                    model
                        |> updateDomain
                  --      |> updatePosition

            in
                model_ ! []

    --    Hover tree ->
      --      model ! []

        Click destination ->

            let

                {x, y, z} = destination

                -- måske -1 skal være - model.z2????

                -- THIS CAN BE MADE MUCH PRETTIER
                -- THIS CAN BE MADE MUCH PRETTIER
                -- THIS CAN BE MADE MUCH PRETTIER
                -- måske benyt som input ved model_
                x2 = z*(50-x)
                y2 = z*(50-y)

                updateDomain model =
                    { model
                    | zipper = Maybe.withDefault model.zipper (goToChild destination model.zipper)
                    }


                updatePosition model =
                    { model
                    | x2 = x2
                    , y2 = y2
                    , z2 = z
                    }


                model_ =
                    model
                        |> updateDomain
                        |> updatePosition
                        |> startTimer

            in
                model_ ! []

        Animate _ ->
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

                        cx = linearTween dt x1 dx t2
                        cy = linearTween dt y1 dy t2
                        cz = linearTween dt z1 dz t2
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
