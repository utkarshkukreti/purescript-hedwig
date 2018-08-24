module Examples.Counters where

import Prelude

import Data.Array as Array
import Data.Maybe as Maybe
import Effect (Effect)
import Examples.Counter as Counter
import Hedwig ((:>))
import Hedwig as H
import Hedwig.Devtools as Devtools

type Model = Array (Counter.Model)

init :: Model
init = []

data Msg = Add | Remove Int | CounterMsg Int Counter.Msg

update :: Model -> Msg -> Model
update model = case _ of
  Add ->
    Array.snoc model Counter.init
  Remove index ->
    Array.deleteAt index model # Maybe.fromMaybe model
  CounterMsg index msg ->
    Array.modifyAt index (\model' -> Counter.update model' msg) model # Maybe.fromMaybe model

view :: Model -> H.Html Msg
view model = H.main [H.id "main"] [
  H.button [H.onClick Add] [H.text "Add"],
  H.div [] $ Array.mapWithIndex viewCounter model
]
  where
    viewCounter index model' = H.div [H.style "display" "flex"] [
      (CounterMsg index) <$> Counter.view model',
      H.button [H.onClick (Remove index)] [H.text "Remove"]
    ]

main :: Effect Unit
main = do
  Devtools.init
  H.mount "main" {
    init: init :> [],
    update: \msg model -> update msg model :> [],
    view
  }
