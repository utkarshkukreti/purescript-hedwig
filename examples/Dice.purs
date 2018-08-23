module Examples.Dice where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Random as Random
import Hedwig ((:>))
import Hedwig as H

type Model = Maybe Int

init :: Model
init = Nothing

data Msg = Roll | Update Int

update :: H.Update Model Msg
update model = case _ of
  Roll -> model :> [
    Update <$> H.sync (Random.randomInt 1 6)
  ]
  Update int -> Just int :> []

view :: Model -> H.Html Msg
view model = H.main [H.id "main"] [
  H.text (show model),
  H.button [H.onClick Roll] [H.text "Roll"]
]

main :: Effect Unit
main =
  H.mount "main" {
    init: init :> [],
    update: update,
    view
  }
