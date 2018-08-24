module Examples.AnimatedList where

import Prelude

import Data.Array as Array
import Data.Maybe as Maybe
import Data.Tuple (Tuple(..))
import Data.Unfoldable (replicateA)
import Effect (Effect)
import Effect.Random as Random
import Hedwig ((:>))
import Hedwig as H

type Model = {
  next :: Int,
  values :: Array Int
}

init :: H.Init Model Msg
init = { next: 1, values: [] } :> []

data Msg = Add | Remove Int | Shuffle | Update (Array Int)

update :: H.Update Model Msg
update model = case _ of
  Add ->
    model { values = Array.snoc model.values model.next, next = model.next + 1 } :> []
  Remove index ->
    model { values = Array.deleteAt index model.values # Maybe.fromMaybe model.values } :> []
  Shuffle ->
    model :> [do
      H.sync $ Update <$> shuffle model.values
    ]
  Update values ->
    model { values = values } :> []

shuffle :: Array Int -> Effect (Array Int)
shuffle array = do
  let length = Array.length array
  randoms <- replicateA length $ Random.randomInt 0 (length - 1)
  pure $ array # Array.zip randoms # Array.sortWith (\(Tuple a _) -> a) # map (\(Tuple _ b) -> b)

view :: Model -> H.Html Msg
view model = H.main [H.id "main"] [
  H.button [H.onClick Add] [H.text "Add"],
  H.button [H.onClick Shuffle] [H.text "Shuffle"],
  H.div [H.transitionGroup "bounce", H.class' "list"] $ Array.mapWithIndex f model.values
]
  where
    f index value = H.div [H.key $ show value, H.onClick (Remove index)] [
      H.text $ show value
    ]

main :: Effect Unit
main = do
  H.mount "main" { init, update, view }
