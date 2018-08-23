module Hedwig.Event where

import Prelude

import Data.Maybe (Maybe(..))
import Hedwig.Foreign (Trait, on, on')
import Web.DOM.Node as Node
import Web.Event.Event as Event
import Web.HTML.HTMLInputElement as HTMLInputElement

-- MOUSE --

onClick :: forall msg. msg -> Trait msg
onClick = on' "click"

onDoubleClick :: forall msg. msg -> Trait msg
onDoubleClick = on' "dblclick"

onMouseDown :: forall msg. msg -> Trait msg
onMouseDown = on' "mousedown"

onMouseUp :: forall msg. msg -> Trait msg
onMouseUp = on' "mouseup"

onMouseEnter :: forall msg. msg -> Trait msg
onMouseEnter = on' "mouseenter"

onMouseLeave :: forall msg. msg -> Trait msg
onMouseLeave = on' "mouseleave"

onMouseOver :: forall msg. msg -> Trait msg
onMouseOver = on' "mouseover"

onMouseOut :: forall msg. msg -> Trait msg
onMouseOut = on' "mouseout"

-- FORMS --

onInput :: forall msg. (String -> msg) -> Trait msg
onInput f = on "input" $ \event -> do
  let maybeInputElement = event # Event.target >>= Node.fromEventTarget >>= HTMLInputElement.fromNode
  value <- case maybeInputElement of
    Just inputElement -> HTMLInputElement.value inputElement
    Nothing -> pure ""
  pure $ f value

onCheck :: forall msg. (Boolean -> msg) -> Trait msg
onCheck f = on "change" $ \event -> do
  let maybeInputElement = event # Event.target >>= Node.fromEventTarget >>= HTMLInputElement.fromNode
  value <- case maybeInputElement of
    Just inputElement -> HTMLInputElement.checked inputElement
    Nothing -> pure false
  pure $ f value

onSubmit :: forall msg. msg -> Trait msg
onSubmit msg = on "submit" $ \event -> do
  Event.preventDefault event
  pure msg

-- FOCUS --

onBlur :: forall msg. msg -> Trait msg
onBlur = on' "blur"

onFocus :: forall msg. msg -> Trait msg
onFocus = on' "focus"
