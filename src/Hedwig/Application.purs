module Hedwig.Application where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Maybe (Maybe(..))
import Data.Nullable as Nullable
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff as Aff
import Effect.Ref as Ref
import Hedwig.Foreign (Html)
import Hedwig.Foreign as Foreign
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM (Element)

type Init model msg = Tuple model (Array (Aff msg))

type Update model msg = model -> msg -> Tuple model (Array (Aff msg))

type View model msg = model -> Html msg

type Application model msg = {
  init :: Init model msg,
  update :: Update model msg,
  view :: View model msg
}

mount :: forall model msg. String -> Application model msg -> Effect Unit
mount selector app = do
  maybeEl <- find selector
  case maybeEl of
    Just el -> mount' el app
    Nothing -> Foreign.log $ "No element matching selector " <> show selector <> " found!"

mount' :: forall model msg. Element -> Application model msg -> Effect Unit
mount' el app = do
  -- These two references will be written to in `start`, before they're ever read.
  model <- Ref.new (unsafeCoerce "!")
  vnode <- Ref.new (unsafeCoerce "!")
  let
    start = do
      let Tuple model' affs = app.init
      Foreign.devtools.send model' (unsafeCoerce "!")
      Ref.write model' model
      let html = app.view model'
      newVnode <- Foreign.patch0 el html send
      Ref.write newVnode vnode
      dispatch affs
    send msg = do
      oldModel <- Ref.read model
      let Tuple newModel affs = app.update oldModel msg
      Foreign.devtools.send newModel msg
      Ref.write newModel model
      render
      dispatch affs
    render = do
      oldVnode <- Ref.read vnode
      html <- app.view <$> Ref.read model
      newVnode <- Foreign.patch oldVnode html send
      Ref.write newVnode vnode
    dispatch affs = do
      for_ affs $ \aff -> do
        Aff.runAff_ (case _ of
          Left error -> Foreign.log error
          Right msg' -> send msg') aff
    setModel newModel = do
      Ref.write newModel model
      render
  Foreign.devtools.subscribe setModel
  start

find :: String -> Effect (Maybe Element)
find selector = Nullable.toMaybe <$> Foreign.querySelector selector
