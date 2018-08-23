module Examples.Counter where

import Prelude

import Effect (Effect)
import Hedwig as H
import Hedwig ((:>))

type Model = Int

init :: Model
init = 0

data Msg = Increment | Decrement

update :: Model -> Msg -> Model
update model = case _ of
  Increment -> model + 1
  Decrement -> model - 1

view :: Model -> H.Html Msg
view model = H.main [H.id "main"] [
  H.button [H.onClick Decrement] [H.text "-"],
  H.text (show model),
  H.button [H.onClick Increment] [H.text "+"]
]

main :: Effect Unit
main = do
  H.mount "main" {
    init: init :> [],
    update: \msg model -> update msg model :> [],
    view
  }
