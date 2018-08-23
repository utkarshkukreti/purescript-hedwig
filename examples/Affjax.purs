module Examples.Affjax where

import Prelude

import Affjax as Affjax
import Affjax.ResponseFormat as ResponseFormat
import Data.Either (Either(..))
import Effect (Effect)
import Hedwig ((:>))
import Hedwig as H

type Model = {
  url :: String,
  result :: Result
}

data Result = NotFetched | Fetching | Ok String | Error String

derive instance eqResult :: Eq Result

init :: H.Init Model Msg
init = {
  url: "https://httpbin.org/get",
  result: NotFetched
} :> []

data Msg = UpdateUrl String | Fetch | Fetched Result

update :: H.Update Model Msg
update model = case _ of
  UpdateUrl url ->
    model { url = url, result = NotFetched } :> []
  Fetch ->
    model { result = Fetching } :> [ do
      response <- Affjax.get ResponseFormat.string model.url
      pure $ case response.body of
        Left error -> Fetched $ Error $ Affjax.printResponseFormatError error
        Right ok -> Fetched $ Ok ok
    ]
  Fetched result ->
    model { result = result } :> []

view :: Model -> H.Html Msg
view model = H.main [H.id "main"] [
  H.input [H.onInput UpdateUrl, H.value model.url] [],
  H.button [H.onClick Fetch, H.disabled $ model.result == Fetching] [H.text "Fetch"],
  case model.result of
    NotFetched ->
      H.div [] [H.text "Not Fetched..."]
    Fetching ->
      H.div [] [H.text "Fetching..."]
    Ok ok ->
      H.div [] [H.text $ "Ok: " <> ok]
    Error error ->
      H.div [] [H.text $ "Error: " <> error]
]

main :: Effect Unit
main = do
  H.mount "main" { init, update, view }
