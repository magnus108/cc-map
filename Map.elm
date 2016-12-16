module Map exposing (..)

import Html exposing (program)

import Model exposing (init)
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)


main =
  program
      { init = init
      , view = view
      , update = update
      , subscriptions = subscriptions
      }
