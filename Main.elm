module Map exposing (..)

import Html

import Model
import View
import Update
import Subscriptions


main =
  Html.program
      { init = Model.init
      , view = View.view
      , update = Update.update
      , subscriptions = Subscriptions.subscriptions
      }
