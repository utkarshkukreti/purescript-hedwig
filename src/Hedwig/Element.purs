module Hedwig.Element where

import Hedwig.Foreign (Html, Trait, element)

type Element msg = Array (Trait msg) -> Array (Html msg) -> Html msg

--- DO NOT EDIT BELOW ---

a :: forall msg. Element msg
a = element "a"

abbr :: forall msg. Element msg
abbr = element "abbr"

address :: forall msg. Element msg
address = element "address"

article :: forall msg. Element msg
article = element "article"

aside :: forall msg. Element msg
aside = element "aside"

audio :: forall msg. Element msg
audio = element "audio"

b :: forall msg. Element msg
b = element "b"

bdi :: forall msg. Element msg
bdi = element "bdi"

bdo :: forall msg. Element msg
bdo = element "bdo"

blockquote :: forall msg. Element msg
blockquote = element "blockquote"

br :: forall msg. Element msg
br = element "br"

button :: forall msg. Element msg
button = element "button"

canvas :: forall msg. Element msg
canvas = element "canvas"

caption :: forall msg. Element msg
caption = element "caption"

cite :: forall msg. Element msg
cite = element "cite"

code :: forall msg. Element msg
code = element "code"

col :: forall msg. Element msg
col = element "col"

colgroup :: forall msg. Element msg
colgroup = element "colgroup"

datalist :: forall msg. Element msg
datalist = element "datalist"

dd :: forall msg. Element msg
dd = element "dd"

del :: forall msg. Element msg
del = element "del"

details :: forall msg. Element msg
details = element "details"

dfn :: forall msg. Element msg
dfn = element "dfn"

div :: forall msg. Element msg
div = element "div"

dl :: forall msg. Element msg
dl = element "dl"

dt :: forall msg. Element msg
dt = element "dt"

em :: forall msg. Element msg
em = element "em"

embed :: forall msg. Element msg
embed = element "embed"

fieldset :: forall msg. Element msg
fieldset = element "fieldset"

figcaption :: forall msg. Element msg
figcaption = element "figcaption"

figure :: forall msg. Element msg
figure = element "figure"

footer :: forall msg. Element msg
footer = element "footer"

form :: forall msg. Element msg
form = element "form"

h1 :: forall msg. Element msg
h1 = element "h1"

h2 :: forall msg. Element msg
h2 = element "h2"

h3 :: forall msg. Element msg
h3 = element "h3"

h4 :: forall msg. Element msg
h4 = element "h4"

h5 :: forall msg. Element msg
h5 = element "h5"

h6 :: forall msg. Element msg
h6 = element "h6"

header :: forall msg. Element msg
header = element "header"

hr :: forall msg. Element msg
hr = element "hr"

i :: forall msg. Element msg
i = element "i"

iframe :: forall msg. Element msg
iframe = element "iframe"

img :: forall msg. Element msg
img = element "img"

input :: forall msg. Element msg
input = element "input"

ins :: forall msg. Element msg
ins = element "ins"

kbd :: forall msg. Element msg
kbd = element "kbd"

label :: forall msg. Element msg
label = element "label"

legend :: forall msg. Element msg
legend = element "legend"

li :: forall msg. Element msg
li = element "li"

main :: forall msg. Element msg
main = element "main"

map :: forall msg. Element msg
map = element "map"

mark :: forall msg. Element msg
mark = element "mark"

math :: forall msg. Element msg
math = element "math"

menu :: forall msg. Element msg
menu = element "menu"

menuitem :: forall msg. Element msg
menuitem = element "menuitem"

meter :: forall msg. Element msg
meter = element "meter"

nav :: forall msg. Element msg
nav = element "nav"

node :: forall msg. Element msg
node = element "node"

object :: forall msg. Element msg
object = element "object"

ol :: forall msg. Element msg
ol = element "ol"

optgroup :: forall msg. Element msg
optgroup = element "optgroup"

option :: forall msg. Element msg
option = element "option"

output :: forall msg. Element msg
output = element "output"

p :: forall msg. Element msg
p = element "p"

param :: forall msg. Element msg
param = element "param"

pre :: forall msg. Element msg
pre = element "pre"

progress :: forall msg. Element msg
progress = element "progress"

q :: forall msg. Element msg
q = element "q"

rp :: forall msg. Element msg
rp = element "rp"

rt :: forall msg. Element msg
rt = element "rt"

ruby :: forall msg. Element msg
ruby = element "ruby"

s :: forall msg. Element msg
s = element "s"

samp :: forall msg. Element msg
samp = element "samp"

section :: forall msg. Element msg
section = element "section"

select :: forall msg. Element msg
select = element "select"

small :: forall msg. Element msg
small = element "small"

source :: forall msg. Element msg
source = element "source"

span :: forall msg. Element msg
span = element "span"

strong :: forall msg. Element msg
strong = element "strong"

sub :: forall msg. Element msg
sub = element "sub"

summary :: forall msg. Element msg
summary = element "summary"

sup :: forall msg. Element msg
sup = element "sup"

table :: forall msg. Element msg
table = element "table"

tbody :: forall msg. Element msg
tbody = element "tbody"

td :: forall msg. Element msg
td = element "td"

textarea :: forall msg. Element msg
textarea = element "textarea"

tfoot :: forall msg. Element msg
tfoot = element "tfoot"

th :: forall msg. Element msg
th = element "th"

thead :: forall msg. Element msg
thead = element "thead"

time :: forall msg. Element msg
time = element "time"

tr :: forall msg. Element msg
tr = element "tr"

track :: forall msg. Element msg
track = element "track"

u :: forall msg. Element msg
u = element "u"

ul :: forall msg. Element msg
ul = element "ul"

var :: forall msg. Element msg
var = element "var"

video :: forall msg. Element msg
video = element "video"

wbr :: forall msg. Element msg
wbr = element "wbr"
