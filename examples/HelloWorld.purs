module Examples.HelloWorld where

import Prelude

import Effect (Effect)
import Hedwig as H
import Hedwig ((:>))

main :: Effect Unit
main = do
  let
    html = H.main [] [
      H.text "Hello, world!"
    ]
    app = {
      init: unit :> [],
      update: \_ _ -> unit :> [],
      view: const html
    }
  H.mount "main" app
