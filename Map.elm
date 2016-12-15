module Map exposing (..)

import Html exposing (program)
import Html.Attributes

import AnimationFrame
import Time exposing (Time)
import Task

import Css exposing (..)

import Svg exposing (..)
import Svg.Attributes
import Svg.Events

import WorldMap
import MultiwayTree
import MultiwayTreeZipper exposing (Zipper, goUp, goToChild)
import Colors -- fix so only exposes certain colors
import Utils exposing ((&>))
import Tween exposing (linearTween)
import Places exposing (verden)
import Destination exposing (Destination)



styles =
    Css.asPairs >> Html.Attributes.style

main =
  program
      { init = init
      , view = view
      , update = update
      , subscriptions = subscriptions
      }


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
    , zipper : Maybe (Zipper Destination)
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
    , zipper = Just (verden, [])
    }

init : (Model, Cmd Msg)
init =
    initialModel ! []


view : Model -> Html.Html Msg
view model =
    let

        {x1, y1, z1, zipper} = model

        children =
            case zipper of
                Nothing -> []
                Just (a, b) ->
                    MultiwayTree.children a
        --remove
        hasDaddy =
            case zipper of
                Nothing -> False
                Just (a, b) ->
                    case b of
                        [] -> False
                        _ -> True
    in
        Html.div
            [ styles
                [ width (pct 100)
                --,backgroundColor secondary
                , overflow hidden
                ]
            -- bad
            , Html.Attributes.style [("background", "linear-gradient(to bottom,#20a8b2,#00a6de)")]
            ]
            -- bad
            [ Html.node "link" [Html.Attributes.href "https://fonts.googleapis.com/css?family=Calligraffitti", Html.Attributes.rel "stylesheet"] []
            , Svg.svg
                [ Svg.Attributes.version "1.1"
                , Svg.Attributes.viewBox "0 0 2000 1001"
                --bad
                , Html.Attributes.style
                ---USE SVG GAUSSIAN FILTER PLEASE
                    [ ("webkit-filter", "drop-shadow( 0px 4px 0px #2e6c7d)")
                    , ("filter", "drop-shadow( 0px 4px 0px #2e6c7d)")
                    ]
                , styles
                    [ position relative
                    , transforms
                        [ translate2 (pct x1) (pct y1)
                        , scale z1
                        ]
                    , marginLeft auto
                    , marginRight auto
                    , display block
                    , height (px 500)
                    , width (px 1000)
                    ]
                ]
                [ Svg.g
                    [ Svg.Attributes.fill "currentColor"
                    , styles
                        [ color (Colors.color Colors.Primary)
                        ]
                    ]
                    WorldMap.worldMap
                , Svg.g
                    [ styles
                        [ fontSize (px 72)
                        , fontFamilies ["Calligraffitti", "cursive"]
                        , fontWeight bold
                        , textShadow4 (px 4) (px 4) (px 4) (Colors.color Colors.Shadow1)
                        ]
                    ] (List.map svgify children)
                ,
                if hasDaddy then
                Svg.svg
                    [ styles
                        [ textShadow4 (px 4) (px 4) (px 4) (Colors.color Colors.Shadow1)
                        ]
                    , Svg.Attributes.x (toString ((-1*((x1/z1)-50))-((50*0.95)/z1)) ++ "%")
                    , Svg.Attributes.y (toString ((-1*((y1/z1)-50))-((50*0.95)/z1)) ++ "%")
                    ]
                    [ Svg.a
                        [ Svg.Attributes.xlinkHref ("#" ++ "Tilbage")
                        , Svg.Events.onClick Back
                        , styles
                            [ transforms
                                [ scale (6/z1)
                                ]
                            ]
                        ]
                        [ Svg.path
                            [ Svg.Attributes.fill "white"
                            , Svg.Attributes.strokeOpacity "0.9"
                            , Svg.Attributes.strokeWidth "0.8"
                            , Svg.Attributes.stroke "#382c37"
                            -- den her skal nok ikke være der.
                            , Svg.Attributes.d "M10,9V5L3,12L10,19V14.9C15,14.9 18.5,16.5 21,20C20,15 17,10 10,9Z"]
                            []
                        ]
                    ]
                else
                    Html.text ""
                ]
            ]





--svgify : Node -> Svg Msg
svgify tree =
    let
        (MultiwayTree.Tree {x, y, name, textShadow} b) = tree
    in
        case b of
            [] ->
                Svg.text_
                    [ Svg.Attributes.x (toString x ++ "%")
                    , Svg.Attributes.y (toString y ++ "%")
                    , Svg.Attributes.fill "white"
                    , Svg.Attributes.textAnchor "middle"
                    , styles
                        [ fontSize (px 42)
                        ]
                    ] [Svg.text name]
            _ ->
                Svg.a
                    [ Svg.Attributes.xlinkHref ("#" ++ name)
                    , Svg.Events.onClick (Click tree)
                    --, Svg.Events.onMouseOver (Hover tree)
                    , styles
                        [ textShadow4 (px 4) (px 4) (px 4) (Colors.color textShadow)
                        ]
                    ]
                    [ Svg.text_
                        [ Svg.Attributes.x (toString x ++ "%")
                        , Svg.Attributes.y (toString y ++ "%")
                        , Svg.Attributes.fill "white"
                        , Svg.Attributes.textAnchor "middle"
                        ] [Svg.text name]
                    ]


type Msg
    = NoOp
    | Click (MultiwayTree.Tree Destination)
    | Animate Time
    | Back
   -- | Hover (Tree Node)

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
                        | zipper = zipper &> goUp
                        }

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

                model_ =
                    model
                        |> updateDomain
                        |> updatePosition

            in
                model_ ! []

    --    Hover tree ->
      --      model ! []

        Click tree ->
            let

                {t} = model



                --(Tree {x, y, z} b) = tree
                (MultiwayTree.Tree {x, y, z} b) = tree

                -- måske -1 skal være - model.z2????

                x2 = z*(50-x)
                y2 = z*(50-y)

                updateDomain model =
                    let
                        {zipper} = model
                    in
                        { model
                        | zipper = zipper &> goToChild tree
                        }


                updatePosition model =
                    { model
                    | x2 = x2
                    , y2 = y2
                    , z2 = z
                    , t1 = t
                    }

                model_ =
                    model
                        |> updateDomain
                        |> updatePosition

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


subscriptions : Model -> Sub Msg
subscriptions model =
    AnimationFrame.diffs Animate
