module Hedwig.Svg where

import Prelude

import Hedwig.Foreign (Html, Trait, element, attribute)

type Element msg = Array (Trait msg) -> Array (Html msg) -> Html msg

--- DO NOT EDIT BELOW ---

-- Elements --

a :: forall msg. Element msg
a = element "a"

animate :: forall msg. Element msg
animate = element "animate"

animateColor :: forall msg. Element msg
animateColor = element "animateColor"

animateMotion :: forall msg. Element msg
animateMotion = element "animateMotion"

animateTransform :: forall msg. Element msg
animateTransform = element "animateTransform"

circle :: forall msg. Element msg
circle = element "circle"

clipPath :: forall msg. Element msg
clipPath = element "clipPath"

colorProfile :: forall msg. Element msg
colorProfile = element "color-profile"

cursor :: forall msg. Element msg
cursor = element "cursor"

defs :: forall msg. Element msg
defs = element "defs"

desc :: forall msg. Element msg
desc = element "desc"

discard :: forall msg. Element msg
discard = element "discard"

ellipse :: forall msg. Element msg
ellipse = element "ellipse"

feBlend :: forall msg. Element msg
feBlend = element "feBlend"

feColorMatrix :: forall msg. Element msg
feColorMatrix = element "feColorMatrix"

feComponentTransfer :: forall msg. Element msg
feComponentTransfer = element "feComponentTransfer"

feComposite :: forall msg. Element msg
feComposite = element "feComposite"

feConvolveMatrix :: forall msg. Element msg
feConvolveMatrix = element "feConvolveMatrix"

feDiffuseLighting :: forall msg. Element msg
feDiffuseLighting = element "feDiffuseLighting"

feDisplacementMap :: forall msg. Element msg
feDisplacementMap = element "feDisplacementMap"

feDistantLight :: forall msg. Element msg
feDistantLight = element "feDistantLight"

feDropShadow :: forall msg. Element msg
feDropShadow = element "feDropShadow"

feFlood :: forall msg. Element msg
feFlood = element "feFlood"

feFuncA :: forall msg. Element msg
feFuncA = element "feFuncA"

feFuncB :: forall msg. Element msg
feFuncB = element "feFuncB"

feFuncG :: forall msg. Element msg
feFuncG = element "feFuncG"

feFuncR :: forall msg. Element msg
feFuncR = element "feFuncR"

feGaussianBlur :: forall msg. Element msg
feGaussianBlur = element "feGaussianBlur"

feImage :: forall msg. Element msg
feImage = element "feImage"

feMerge :: forall msg. Element msg
feMerge = element "feMerge"

feMergeNode :: forall msg. Element msg
feMergeNode = element "feMergeNode"

feMorphology :: forall msg. Element msg
feMorphology = element "feMorphology"

feOffset :: forall msg. Element msg
feOffset = element "feOffset"

fePointLight :: forall msg. Element msg
fePointLight = element "fePointLight"

feSpecularLighting :: forall msg. Element msg
feSpecularLighting = element "feSpecularLighting"

feSpotLight :: forall msg. Element msg
feSpotLight = element "feSpotLight"

feTile :: forall msg. Element msg
feTile = element "feTile"

feTurbulence :: forall msg. Element msg
feTurbulence = element "feTurbulence"

filter :: forall msg. Element msg
filter = element "filter"

font :: forall msg. Element msg
font = element "font"

fontFace :: forall msg. Element msg
fontFace = element "font-face"

fontFaceFormat :: forall msg. Element msg
fontFaceFormat = element "font-face-format"

fontFaceName :: forall msg. Element msg
fontFaceName = element "font-face-name"

fontFaceSrc :: forall msg. Element msg
fontFaceSrc = element "font-face-src"

fontFaceUri :: forall msg. Element msg
fontFaceUri = element "font-face-uri"

foreignObject :: forall msg. Element msg
foreignObject = element "foreignObject"

g :: forall msg. Element msg
g = element "g"

glyph :: forall msg. Element msg
glyph = element "glyph"

glyphRef :: forall msg. Element msg
glyphRef = element "glyphRef"

hatch :: forall msg. Element msg
hatch = element "hatch"

hatchpath :: forall msg. Element msg
hatchpath = element "hatchpath"

hkern :: forall msg. Element msg
hkern = element "hkern"

image :: forall msg. Element msg
image = element "image"

line :: forall msg. Element msg
line = element "line"

linearGradient :: forall msg. Element msg
linearGradient = element "linearGradient"

marker :: forall msg. Element msg
marker = element "marker"

mask :: forall msg. Element msg
mask = element "mask"

mesh :: forall msg. Element msg
mesh = element "mesh"

meshgradient :: forall msg. Element msg
meshgradient = element "meshgradient"

meshpatch :: forall msg. Element msg
meshpatch = element "meshpatch"

meshrow :: forall msg. Element msg
meshrow = element "meshrow"

metadata :: forall msg. Element msg
metadata = element "metadata"

missingGlyph :: forall msg. Element msg
missingGlyph = element "missing-glyph"

mpath :: forall msg. Element msg
mpath = element "mpath"

path :: forall msg. Element msg
path = element "path"

pattern :: forall msg. Element msg
pattern = element "pattern"

polygon :: forall msg. Element msg
polygon = element "polygon"

polyline :: forall msg. Element msg
polyline = element "polyline"

radialGradient :: forall msg. Element msg
radialGradient = element "radialGradient"

rect :: forall msg. Element msg
rect = element "rect"

script :: forall msg. Element msg
script = element "script"

set :: forall msg. Element msg
set = element "set"

solidcolor :: forall msg. Element msg
solidcolor = element "solidcolor"

stop :: forall msg. Element msg
stop = element "stop"

style :: forall msg. Element msg
style = element "style"

svg :: forall msg. Element msg
svg = element "svg"

switch :: forall msg. Element msg
switch = element "switch"

symbol :: forall msg. Element msg
symbol = element "symbol"

text :: forall msg. Element msg
text = element "text"

textPath :: forall msg. Element msg
textPath = element "textPath"

title :: forall msg. Element msg
title = element "title"

tref :: forall msg. Element msg
tref = element "tref"

tspan :: forall msg. Element msg
tspan = element "tspan"

unknown :: forall msg. Element msg
unknown = element "unknown"

use :: forall msg. Element msg
use = element "use"

view :: forall msg. Element msg
view = element "view"

vkern :: forall msg. Element msg
vkern = element "vkern"

-- /Elements --

-- Attributes --

externalResourcesRequired :: forall msg. Boolean -> Trait msg
externalResourcesRequired = attribute "externalResourcesRequired" <<< show

preserveAlpha :: forall msg. Boolean -> Trait msg
preserveAlpha = attribute "preserveAlpha" <<< show

numOctaves :: forall msg. Int -> Trait msg
numOctaves = attribute "numOctaves" <<< show

tabindex :: forall msg. Int -> Trait msg
tabindex = attribute "tabindex" <<< show

accentHeight :: forall msg. Number -> Trait msg
accentHeight = attribute "accent-height" <<< show

ascent :: forall msg. Number -> Trait msg
ascent = attribute "ascent" <<< show

azimuth :: forall msg. Number -> Trait msg
azimuth = attribute "azimuth" <<< show

bias :: forall msg. Number -> Trait msg
bias = attribute "bias" <<< show

diffuseConstant :: forall msg. Number -> Trait msg
diffuseConstant = attribute "diffuseConstant" <<< show

divisor :: forall msg. Number -> Trait msg
divisor = attribute "divisor" <<< show

elevation :: forall msg. Number -> Trait msg
elevation = attribute "elevation" <<< show

fr :: forall msg. Number -> Trait msg
fr = attribute "fr" <<< show

k1 :: forall msg. Number -> Trait msg
k1 = attribute "k1" <<< show

k2 :: forall msg. Number -> Trait msg
k2 = attribute "k2" <<< show

k3 :: forall msg. Number -> Trait msg
k3 = attribute "k3" <<< show

k4 :: forall msg. Number -> Trait msg
k4 = attribute "k4" <<< show

limitingConeAngle :: forall msg. Number -> Trait msg
limitingConeAngle = attribute "limitingConeAngle" <<< show

overlinePosition :: forall msg. Number -> Trait msg
overlinePosition = attribute "overline-position" <<< show

overlineThickness :: forall msg. Number -> Trait msg
overlineThickness = attribute "overline-thickness" <<< show

pathLength :: forall msg. Number -> Trait msg
pathLength = attribute "pathLength" <<< show

pointsAtX :: forall msg. Number -> Trait msg
pointsAtX = attribute "pointsAtX" <<< show

pointsAtY :: forall msg. Number -> Trait msg
pointsAtY = attribute "pointsAtY" <<< show

pointsAtZ :: forall msg. Number -> Trait msg
pointsAtZ = attribute "pointsAtZ" <<< show

refX :: forall msg. Number -> Trait msg
refX = attribute "refX" <<< show

refY :: forall msg. Number -> Trait msg
refY = attribute "refY" <<< show

scale :: forall msg. Number -> Trait msg
scale = attribute "scale" <<< show

seed :: forall msg. Number -> Trait msg
seed = attribute "seed" <<< show

specularConstant :: forall msg. Number -> Trait msg
specularConstant = attribute "specularConstant" <<< show

specularExponent :: forall msg. Number -> Trait msg
specularExponent = attribute "specularExponent" <<< show

strikethroughPosition :: forall msg. Number -> Trait msg
strikethroughPosition = attribute "strikethrough-position" <<< show

strikethroughThickness :: forall msg. Number -> Trait msg
strikethroughThickness = attribute "strikethrough-thickness" <<< show

strokeMiterlimit :: forall msg. Number -> Trait msg
strokeMiterlimit = attribute "stroke-miterlimit" <<< show

surfaceScale :: forall msg. Number -> Trait msg
surfaceScale = attribute "surfaceScale" <<< show

targetX :: forall msg. Number -> Trait msg
targetX = attribute "targetX" <<< show

targetY :: forall msg. Number -> Trait msg
targetY = attribute "targetY" <<< show

underlinePosition :: forall msg. Number -> Trait msg
underlinePosition = attribute "underline-position" <<< show

underlineThickness :: forall msg. Number -> Trait msg
underlineThickness = attribute "underline-thickness" <<< show

version :: forall msg. Number -> Trait msg
version = attribute "version" <<< show

cx :: forall msg. String -> Trait msg
cx = attribute "cx"

cy :: forall msg. String -> Trait msg
cy = attribute "cy"

fillOpacity :: forall msg. String -> Trait msg
fillOpacity = attribute "fill-opacity"

fx :: forall msg. String -> Trait msg
fx = attribute "fx"

fy :: forall msg. String -> Trait msg
fy = attribute "fy"

height :: forall msg. String -> Trait msg
height = attribute "height"

markerHeight :: forall msg. String -> Trait msg
markerHeight = attribute "markerHeight"

markerWidth :: forall msg. String -> Trait msg
markerWidth = attribute "markerWidth"

r :: forall msg. String -> Trait msg
r = attribute "r"

strokeDashoffset :: forall msg. String -> Trait msg
strokeDashoffset = attribute "stroke-dashoffset"

strokeOpacity :: forall msg. String -> Trait msg
strokeOpacity = attribute "stroke-opacity"

strokeWidth :: forall msg. String -> Trait msg
strokeWidth = attribute "stroke-width"

textLength :: forall msg. String -> Trait msg
textLength = attribute "textLength"

width :: forall msg. String -> Trait msg
width = attribute "width"

x :: forall msg. String -> Trait msg
x = attribute "x"

x1 :: forall msg. String -> Trait msg
x1 = attribute "x1"

x2 :: forall msg. String -> Trait msg
x2 = attribute "x2"

y :: forall msg. String -> Trait msg
y = attribute "y"

y1 :: forall msg. String -> Trait msg
y1 = attribute "y1"

y2 :: forall msg. String -> Trait msg
y2 = attribute "y2"

accumulate :: forall msg. String -> Trait msg
accumulate = attribute "accumulate"

additive :: forall msg. String -> Trait msg
additive = attribute "additive"

alignmentBaseline :: forall msg. String -> Trait msg
alignmentBaseline = attribute "alignment-baseline"

attributeName :: forall msg. String -> Trait msg
attributeName = attribute "attributeName"

attributeType :: forall msg. String -> Trait msg
attributeType = attribute "attributeType"

baseFrequency :: forall msg. String -> Trait msg
baseFrequency = attribute "baseFrequency"

baselineShift :: forall msg. String -> Trait msg
baselineShift = attribute "baseline-shift"

baseProfile :: forall msg. String -> Trait msg
baseProfile = attribute "baseProfile"

begin :: forall msg. String -> Trait msg
begin = attribute "begin"

calcMode :: forall msg. String -> Trait msg
calcMode = attribute "calcMode"

class' :: forall msg. String -> Trait msg
class' = attribute "class"

clipPathUnits :: forall msg. String -> Trait msg
clipPathUnits = attribute "clipPathUnits"

clipPathAttr :: forall msg. String -> Trait msg
clipPathAttr = attribute "clip-path"

clipRule :: forall msg. String -> Trait msg
clipRule = attribute "clip-rule"

color :: forall msg. String -> Trait msg
color = attribute "color"

colorInterpolation :: forall msg. String -> Trait msg
colorInterpolation = attribute "color-interpolation"

colorInterpolationFilters :: forall msg. String -> Trait msg
colorInterpolationFilters = attribute "color-interpolation-filters"

colorProfileAttr :: forall msg. String -> Trait msg
colorProfileAttr = attribute "color-profile"

colorRendering :: forall msg. String -> Trait msg
colorRendering = attribute "color-rendering"

contentScriptType :: forall msg. String -> Trait msg
contentScriptType = attribute "contentScriptType"

contentStyleType :: forall msg. String -> Trait msg
contentStyleType = attribute "contentStyleType"

cursorAttr :: forall msg. String -> Trait msg
cursorAttr = attribute "cursor"

d :: forall msg. String -> Trait msg
d = attribute "d"

direction :: forall msg. String -> Trait msg
direction = attribute "direction"

display :: forall msg. String -> Trait msg
display = attribute "display"

dominantBaseline :: forall msg. String -> Trait msg
dominantBaseline = attribute "dominant-baseline"

dur :: forall msg. String -> Trait msg
dur = attribute "dur"

dx :: forall msg. String -> Trait msg
dx = attribute "dx"

dy :: forall msg. String -> Trait msg
dy = attribute "dy"

edgeMode :: forall msg. String -> Trait msg
edgeMode = attribute "edgeMode"

end :: forall msg. String -> Trait msg
end = attribute "end"

fill :: forall msg. String -> Trait msg
fill = attribute "fill"

fillRule :: forall msg. String -> Trait msg
fillRule = attribute "fill-rule"

filterAttr :: forall msg. String -> Trait msg
filterAttr = attribute "filter"

filterUnits :: forall msg. String -> Trait msg
filterUnits = attribute "filterUnits"

floodColor :: forall msg. String -> Trait msg
floodColor = attribute "flood-color"

floodOpacity :: forall msg. String -> Trait msg
floodOpacity = attribute "flood-opacity"

fontFamily :: forall msg. String -> Trait msg
fontFamily = attribute "font-family"

fontSize :: forall msg. String -> Trait msg
fontSize = attribute "font-size"

fontSizeAdjust :: forall msg. String -> Trait msg
fontSizeAdjust = attribute "font-size-adjust"

fontStretch :: forall msg. String -> Trait msg
fontStretch = attribute "font-stretch"

fontStyle :: forall msg. String -> Trait msg
fontStyle = attribute "font-style"

fontVariant :: forall msg. String -> Trait msg
fontVariant = attribute "font-variant"

fontWeight :: forall msg. String -> Trait msg
fontWeight = attribute "font-weight"

from :: forall msg. String -> Trait msg
from = attribute "from"

gradientTransform :: forall msg. String -> Trait msg
gradientTransform = attribute "gradientTransform"

gradientUnits :: forall msg. String -> Trait msg
gradientUnits = attribute "gradientUnits"

href :: forall msg. String -> Trait msg
href = attribute "href"

imageRendering :: forall msg. String -> Trait msg
imageRendering = attribute "image-rendering"

in' :: forall msg. String -> Trait msg
in' = attribute "in"

in2 :: forall msg. String -> Trait msg
in2 = attribute "in2"

kernelMatrix :: forall msg. String -> Trait msg
kernelMatrix = attribute "kernelMatrix"

kernelUnitLength :: forall msg. String -> Trait msg
kernelUnitLength = attribute "kernelUnitLength"

kerning :: forall msg. String -> Trait msg
kerning = attribute "kerning"

keySplines :: forall msg. String -> Trait msg
keySplines = attribute "keySplines"

keyTimes :: forall msg. String -> Trait msg
keyTimes = attribute "keyTimes"

lengthAdjust :: forall msg. String -> Trait msg
lengthAdjust = attribute "lengthAdjust"

letterSpacing :: forall msg. String -> Trait msg
letterSpacing = attribute "letter-spacing"

lightingColor :: forall msg. String -> Trait msg
lightingColor = attribute "lighting-color"

local :: forall msg. String -> Trait msg
local = attribute "local"

markerEnd :: forall msg. String -> Trait msg
markerEnd = attribute "marker-end"

markerMid :: forall msg. String -> Trait msg
markerMid = attribute "marker-mid"

markerStart :: forall msg. String -> Trait msg
markerStart = attribute "marker-start"

markerUnits :: forall msg. String -> Trait msg
markerUnits = attribute "markerUnits"

maskAttr :: forall msg. String -> Trait msg
maskAttr = attribute "mask"

maskContentUnits :: forall msg. String -> Trait msg
maskContentUnits = attribute "maskContentUnits"

maskUnits :: forall msg. String -> Trait msg
maskUnits = attribute "maskUnits"

max :: forall msg. String -> Trait msg
max = attribute "max"

min :: forall msg. String -> Trait msg
min = attribute "min"

mode :: forall msg. String -> Trait msg
mode = attribute "mode"

opacity :: forall msg. String -> Trait msg
opacity = attribute "opacity"

operator :: forall msg. String -> Trait msg
operator = attribute "operator"

order :: forall msg. String -> Trait msg
order = attribute "order"

overflow :: forall msg. String -> Trait msg
overflow = attribute "overflow"

paintOrder :: forall msg. String -> Trait msg
paintOrder = attribute "paint-order"

patternContentUnits :: forall msg. String -> Trait msg
patternContentUnits = attribute "patternContentUnits"

patternTransform :: forall msg. String -> Trait msg
patternTransform = attribute "patternTransform"

patternUnits :: forall msg. String -> Trait msg
patternUnits = attribute "patternUnits"

pointerEvents :: forall msg. String -> Trait msg
pointerEvents = attribute "pointer-events"

points :: forall msg. String -> Trait msg
points = attribute "points"

preserveAspectRatio :: forall msg. String -> Trait msg
preserveAspectRatio = attribute "preserveAspectRatio"

primitiveUnits :: forall msg. String -> Trait msg
primitiveUnits = attribute "primitiveUnits"

radius :: forall msg. String -> Trait msg
radius = attribute "radius"

repeatCount :: forall msg. String -> Trait msg
repeatCount = attribute "repeatCount"

repeatDur :: forall msg. String -> Trait msg
repeatDur = attribute "repeatDur"

requiredFeatures :: forall msg. String -> Trait msg
requiredFeatures = attribute "requiredFeatures"

restart :: forall msg. String -> Trait msg
restart = attribute "restart"

result :: forall msg. String -> Trait msg
result = attribute "result"

rx :: forall msg. String -> Trait msg
rx = attribute "rx"

ry :: forall msg. String -> Trait msg
ry = attribute "ry"

shapeRendering :: forall msg. String -> Trait msg
shapeRendering = attribute "shape-rendering"

stdDeviation :: forall msg. String -> Trait msg
stdDeviation = attribute "stdDeviation"

stitchTiles :: forall msg. String -> Trait msg
stitchTiles = attribute "stitchTiles"

stopColor :: forall msg. String -> Trait msg
stopColor = attribute "stop-color"

stopOpacity :: forall msg. String -> Trait msg
stopOpacity = attribute "stop-opacity"

stroke :: forall msg. String -> Trait msg
stroke = attribute "stroke"

strokeDasharray :: forall msg. String -> Trait msg
strokeDasharray = attribute "stroke-dasharray"

strokeLinecap :: forall msg. String -> Trait msg
strokeLinecap = attribute "stroke-linecap"

strokeLinejoin :: forall msg. String -> Trait msg
strokeLinejoin = attribute "stroke-linejoin"

styleAttr :: forall msg. String -> Trait msg
styleAttr = attribute "style"

textAnchor :: forall msg. String -> Trait msg
textAnchor = attribute "text-anchor"

textDecoration :: forall msg. String -> Trait msg
textDecoration = attribute "text-decoration"

textRendering :: forall msg. String -> Trait msg
textRendering = attribute "text-rendering"

to :: forall msg. String -> Trait msg
to = attribute "to"

transform :: forall msg. String -> Trait msg
transform = attribute "transform"

type' :: forall msg. String -> Trait msg
type' = attribute "type"

values :: forall msg. String -> Trait msg
values = attribute "values"

vectorEffect :: forall msg. String -> Trait msg
vectorEffect = attribute "vector-effect"

viewBox :: forall msg. String -> Trait msg
viewBox = attribute "viewBox"

visibility :: forall msg. String -> Trait msg
visibility = attribute "visibility"

wordSpacing :: forall msg. String -> Trait msg
wordSpacing = attribute "word-spacing"

writingMode :: forall msg. String -> Trait msg
writingMode = attribute "writing-mode"

xChannelSelector :: forall msg. String -> Trait msg
xChannelSelector = attribute "xChannelSelector"

yChannelSelector :: forall msg. String -> Trait msg
yChannelSelector = attribute "yChannelSelector"

-- /Attributes --
