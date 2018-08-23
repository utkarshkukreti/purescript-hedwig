module Hedwig.Property where

import Prelude

import Data.Array as Array
import Data.String as String
import Data.Tuple (Tuple(..))
import Hedwig.Foreign (Trait, attribute, property)
import Hedwig.Foreign as Foreign

classList :: forall msg. Array (Tuple String Boolean) -> Trait msg
classList array = class' $
  array
    # Array.filter (\(Tuple _ b) -> b)
    # map (\(Tuple s _) -> s)
    # String.joinWith " "

style :: forall msg. String -> String -> Trait msg
style name' value' = Foreign.style_ [{name: name', value: value'}]

styles :: forall msg. Array (Tuple String String) -> Trait msg
styles array = array # map (\(Tuple name' value') -> {name: name', value: value'}) # Foreign.style_

--- DO NOT EDIT BELOW ---

autocomplete :: forall msg. Boolean -> Trait msg
autocomplete = property "autocomplete"

autofocus :: forall msg. Boolean -> Trait msg
autofocus = property "autofocus"

autoplay :: forall msg. Boolean -> Trait msg
autoplay = property "autoplay"

checked :: forall msg. Boolean -> Trait msg
checked = property "checked"

contentEditable :: forall msg. Boolean -> Trait msg
contentEditable = property "contentEditable"

controls :: forall msg. Boolean -> Trait msg
controls = property "controls"

default :: forall msg. Boolean -> Trait msg
default = property "default"

disabled :: forall msg. Boolean -> Trait msg
disabled = property "disabled"

hidden :: forall msg. Boolean -> Trait msg
hidden = property "hidden"

isMap :: forall msg. Boolean -> Trait msg
isMap = property "isMap"

loop :: forall msg. Boolean -> Trait msg
loop = property "loop"

multiple :: forall msg. Boolean -> Trait msg
multiple = property "multiple"

noValidate :: forall msg. Boolean -> Trait msg
noValidate = property "noValidate"

readOnly :: forall msg. Boolean -> Trait msg
readOnly = property "readOnly"

required :: forall msg. Boolean -> Trait msg
required = property "required"

reversed :: forall msg. Boolean -> Trait msg
reversed = property "reversed"

selected :: forall msg. Boolean -> Trait msg
selected = property "selected"

spellcheck :: forall msg. Boolean -> Trait msg
spellcheck = property "spellcheck"

accept :: forall msg. String -> Trait msg
accept = property "accept"

acceptCharset :: forall msg. String -> Trait msg
acceptCharset = property "acceptCharset"

accessKey :: forall msg. String -> Trait msg
accessKey = property "accessKey"

action :: forall msg. String -> Trait msg
action = property "action"

align :: forall msg. String -> Trait msg
align = property "align"

alt :: forall msg. String -> Trait msg
alt = property "alt"

class' :: forall msg. String -> Trait msg
class' = property "className"

coords :: forall msg. String -> Trait msg
coords = property "coords"

dir :: forall msg. String -> Trait msg
dir = property "dir"

download :: forall msg. String -> Trait msg
download = property "download"

downloadAs :: forall msg. String -> Trait msg
downloadAs = property "downloadAs"

dropzone :: forall msg. String -> Trait msg
dropzone = property "dropzone"

enctype :: forall msg. String -> Trait msg
enctype = property "enctype"

for :: forall msg. String -> Trait msg
for = property "htmlFor"

headers :: forall msg. String -> Trait msg
headers = property "headers"

href :: forall msg. String -> Trait msg
href = property "href"

hreflang :: forall msg. String -> Trait msg
hreflang = property "hreflang"

id :: forall msg. String -> Trait msg
id = property "id"

kind :: forall msg. String -> Trait msg
kind = property "kind"

lang :: forall msg. String -> Trait msg
lang = property "lang"

max :: forall msg. String -> Trait msg
max = property "max"

method :: forall msg. String -> Trait msg
method = property "method"

min :: forall msg. String -> Trait msg
min = property "min"

name :: forall msg. String -> Trait msg
name = property "name"

pattern :: forall msg. String -> Trait msg
pattern = property "pattern"

ping :: forall msg. String -> Trait msg
ping = property "ping"

placeholder :: forall msg. String -> Trait msg
placeholder = property "placeholder"

poster :: forall msg. String -> Trait msg
poster = property "poster"

preload :: forall msg. String -> Trait msg
preload = property "preload"

sandbox :: forall msg. String -> Trait msg
sandbox = property "sandbox"

scope :: forall msg. String -> Trait msg
scope = property "scope"

shape :: forall msg. String -> Trait msg
shape = property "shape"

src :: forall msg. String -> Trait msg
src = property "src"

srcdoc :: forall msg. String -> Trait msg
srcdoc = property "srcdoc"

srclang :: forall msg. String -> Trait msg
srclang = property "srclang"

step :: forall msg. String -> Trait msg
step = property "step"

target :: forall msg. String -> Trait msg
target = property "target"

title :: forall msg. String -> Trait msg
title = property "title"

type' :: forall msg. String -> Trait msg
type' = property "type"

useMap :: forall msg. String -> Trait msg
useMap = property "useMap"

value :: forall msg. String -> Trait msg
value = property "value"

wrap :: forall msg. String -> Trait msg
wrap = property "wrap"

cols :: forall msg. Int -> Trait msg
cols = attribute "cols" <<< show

colspan :: forall msg. Int -> Trait msg
colspan = attribute "colspan" <<< show

height :: forall msg. Int -> Trait msg
height = attribute "height" <<< show

maxlength :: forall msg. Int -> Trait msg
maxlength = attribute "maxlength" <<< show

minlength :: forall msg. Int -> Trait msg
minlength = attribute "minlength" <<< show

rows :: forall msg. Int -> Trait msg
rows = attribute "rows" <<< show

rowspan :: forall msg. Int -> Trait msg
rowspan = attribute "rowspan" <<< show

size :: forall msg. Int -> Trait msg
size = attribute "size" <<< show

start :: forall msg. Int -> Trait msg
start = attribute "start" <<< show

tabindex :: forall msg. Int -> Trait msg
tabindex = attribute "tabindex" <<< show

width :: forall msg. Int -> Trait msg
width = attribute "width" <<< show

contextmenu :: forall msg. String -> Trait msg
contextmenu = attribute "contextmenu"

datetime :: forall msg. String -> Trait msg
datetime = attribute "datetime"

draggable :: forall msg. String -> Trait msg
draggable = attribute "draggable"

itemprop :: forall msg. String -> Trait msg
itemprop = attribute "itemprop"

list :: forall msg. String -> Trait msg
list = attribute "list"

manifest :: forall msg. String -> Trait msg
manifest = attribute "manifest"

media :: forall msg. String -> Trait msg
media = attribute "media"

pubdate :: forall msg. String -> Trait msg
pubdate = attribute "pubdate"

rel :: forall msg. String -> Trait msg
rel = attribute "rel"
