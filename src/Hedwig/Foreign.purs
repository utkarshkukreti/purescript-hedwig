module Hedwig.Foreign where

import Prelude

import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4, runFn1, runFn2, runFn3, runFn4)
import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn3, runEffectFn1, runEffectFn3)
import Web.DOM (Element)
import Web.Event.Event (Event)

foreign import data Html :: Type -> Type

foreign import data Trait :: Type -> Type

foreign import element_ :: forall msg. Fn3 String (Array (Trait msg)) (Array (Html msg)) (Html msg)
foreign import text_ :: forall msg. Fn1 String (Html msg)
foreign import mapHtml_ :: forall a b. Fn2 (a -> b) (Html a) (Html b)
foreign import lazy_ :: forall msg a. Fn4 String String (a -> Html msg) a (Html msg)

instance functorHtml :: Functor Html where
  map = runFn2 mapHtml_

foreign import attribute_ :: forall msg. Fn2 String String (Trait msg)
foreign import property_ :: forall msg a. Fn2 String a (Trait msg)
foreign import on_ :: forall msg. Fn2 String (Event -> Effect msg) (Trait msg)
foreign import on__ :: forall msg. Fn2 String msg (Trait msg)
foreign import key_ :: forall msg. Fn1 String (Trait msg)
foreign import style_ :: forall msg. Fn1 (Array {name :: String, value :: String}) (Trait msg)
foreign import transition_ :: forall msg. Fn1 String (Trait msg)
foreign import transition__ :: forall msg. Fn1 TransitionOptions (Trait msg)
foreign import transitionGroup_ :: forall msg. Fn1 String (Trait msg)
foreign import transitionGroup__ :: forall msg. Fn1 TransitionOptions (Trait msg)

foreign import data VirtualNode :: Type -> Type

foreign import patch0_ :: forall msg. EffectFn3 Element (Html msg) (msg -> Effect Unit) (VirtualNode msg)
foreign import patch_ :: forall msg. EffectFn3 (VirtualNode msg) (Html msg) (msg -> Effect Unit) (VirtualNode msg)

type Devtools model msg = {
  send :: model -> msg -> Effect Unit,
  subscribe :: (model -> Effect Unit) -> Effect Unit
}

foreign import devtools :: forall model msg. Devtools model msg

foreign import log_ :: forall a. EffectFn1 a Unit
foreign import querySelector_ :: EffectFn1 String (Nullable Element)

element :: forall msg. String -> Array (Trait msg) -> Array (Html msg) -> Html msg
element = runFn3 element_

text :: forall msg. String -> Html msg
text = runFn1 text_

lazy :: forall a b. String -> String -> (a -> Html b) -> a -> Html b
lazy = runFn4 lazy_

attribute :: forall msg. String -> String -> Trait msg
attribute = runFn2 attribute_

property :: forall msg a. String -> a -> Trait msg
property = runFn2 property_

on :: forall msg. String -> (Event -> Effect msg) -> Trait msg
on = runFn2 on_

on' :: forall msg. String -> msg -> Trait msg
on' = runFn2 on__

key :: forall msg. String -> Trait msg
key = runFn1 key_

type TransitionOptions = {
  enter :: String,
  enterTo :: String,
  enterActive :: String,
  leave :: String,
  leaveTo :: String,
  leaveActive :: String,
  move :: String
}

transition :: forall msg. String -> Trait msg
transition = runFn1 transition_

transition' :: forall msg. TransitionOptions -> Trait msg
transition' = runFn1 transition__

transitionGroup :: forall msg. String -> Trait msg
transitionGroup = runFn1 transitionGroup_

transitionGroup' :: forall msg. TransitionOptions -> Trait msg
transitionGroup' = runFn1 transitionGroup__

patch0 :: forall msg. Element -> Html msg -> (msg -> Effect Unit) -> Effect (VirtualNode msg)
patch0 = runEffectFn3 patch0_

patch :: forall msg. VirtualNode msg -> Html msg -> (msg -> Effect Unit) -> Effect (VirtualNode msg)
patch = runEffectFn3 patch_

log :: forall a. a -> Effect Unit
log = runEffectFn1 log_

querySelector :: String -> Effect (Nullable Element)
querySelector = runEffectFn1 querySelector_
