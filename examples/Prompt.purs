module Examples.Prompt where

import Prelude

import Effect.Aff (Aff)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Hedwig as H
import Hedwig ((:>))
import Web.HTML as HTML
import Web.HTML.Window as Window

type Model = { name :: Maybe String }

prompt :: Aff Msg
prompt = do
  window <- H.sync HTML.window
  name <- H.sync $ Window.prompt "What's your name?" window
  pure $ Update name

init :: H.Init Model Msg
init = {name: Nothing} :> [prompt]

data Msg = Prompt | Update (Maybe String)

update :: H.Update Model Msg
update model = case _ of
  Prompt ->
    model :> [prompt]
  Update name ->
    model { name = name } :> []

view :: H.View Model Msg
view model = H.main [] [
  H.button [H.onClick Prompt] [H.text "Hello"],
  H.div [] [H.text $ "Hello, " <> show model.name <> "!"]
]

main :: Effect Unit
main = H.mount "main" { init, update, view }
