module Examples.JsFrameworkBenchmark where

-- https://github.com/krausest/js-framework-benchmark

import Prelude

import Data.Array as Array
import Data.Int as Int
import Data.Maybe (Maybe(..))
import Data.Maybe as Maybe
import Data.Unfoldable (replicateA)
import Effect (Effect)
import Effect.Random as Random
import Hedwig ((:>))
import Hedwig as H
import Web.DOM.Element as Element
import Web.DOM.Node as Node
import Web.Event.Event (Event)
import Web.Event.Event as Event

main :: Effect Unit
main = H.mount "main" { init, update, view }

type Row = { id :: Int, label :: String, selected :: Boolean }

type Model = { rows :: Array Row, nextId :: Int }

init :: H.Init Model Msg
init = { rows: [], nextId: 1 } :> []

data Msg
  = Create Int
  | Append Int
  | UpdateEvery Int
  | Clear
  | Swap
  | Select Int
  | Remove Int
  | Push (Array Row)
  | NoOp

update :: H.Update Model Msg
update model = case _ of
  Create count ->
    update (model { rows = [] }) (Append count)
  Append count ->
    model :> [do
    rows <- H.sync $ randomRows model.nextId count
    pure $ Push rows
  ]
  UpdateEvery count ->
    let
      f index row | mod index count == 0 = row { label = row.label <> " !!!" }
      f _ row = row
    in
      model { rows = Array.mapWithIndex f model.rows } :> []
  Clear ->
    model { rows = [] } :> []
  Swap ->
    case Array.index model.rows 1, Array.index model.rows 998 of
      Just first, Just second ->
        let
          f 1 _ = second
          f 998 _ = first
          f _ row = row
        in
          model { rows = Array.mapWithIndex f model.rows } :> []
      _, _ -> model :> []
  Select id ->
    let
      f row | row.id == id = row { selected = true }
      f row | row.selected = row { selected = false }
      f row = row
    in
      model { rows = f <$> model.rows } :> []
  Remove id ->
    model { rows = Array.filter (\row -> row.id /= id) model.rows } :> []
  Push rows ->
    model { rows = model.rows <> rows, nextId = model.nextId + Array.length rows } :> []
  NoOp ->
    model :> []

choose :: Array String -> Effect String
choose array = do
  index <- Random.randomInt 0 (Array.length array)
  pure $ Maybe.fromMaybe "" $ Array.index array index

randomRows :: Int -> Int -> Effect (Array Row)
randomRows lastId length = Array.mapWithIndex f <$> replicateA length row
  where
    row = do
      adjective <- choose adjectives
      color <- choose colors
      noun <- choose nouns
      pure $ adjective <> " " <> color <> " " <> noun
    f index label = { id: lastId + index, label, selected: false }

adjectives :: Array String
adjectives =
  ["pretty", "large", "big", "small", "tall", "short", "long", "handsome",
   "plain", "quaint", "clean", "elegant", "easy", "angry", "crazy", "helpful",
   "mushy", "odd", "unsightly", "adorable", "important", "inexpensive",
   "cheap", "expensive", "fancy"]

colors :: Array String
colors =
  ["red", "yellow", "blue", "green", "pink", "brown", "purple", "brown",
   "white", "black", "orange"]

nouns :: Array String
nouns =
  ["table", "chair", "house", "bbq", "desk", "car", "pony", "cookie",
   "sandwich", "burger", "pizza", "mouse", "keyboard"]

view :: H.View Model Msg
view model =
  H.element "main" [H.class' "container"]
    [ H.div [ H.class' "jumbotron" ]
      [ H.div [ H.class' "row" ]
        [ H.div [ H.class' "col-md-6" ]
          [ H.h1 [] [ H.text "Hedwig" ] ]
        , H.div [ H.class' "col-md-6" ] buttons
        ]
      ]
    , H.table
      [ H.class' "table table-hover table-striped test-data"
      , H.on "click" handleTableClick
      ]
      [ H.tbody [] (viewRowLazy <$> model.rows) ]
    , H.span
      [ H.class' "preloadicon glyphicon glyphicon-remove"
      , H.attribute "aria-hidden" "true"
      ]
      []
    ]

handleTableClick :: Event -> Effect Msg
handleTableClick event = do
  let maybeElement = event # Event.target >>= Node.fromEventTarget >>= Element.fromNode
  case maybeElement of
    Just element -> do
      action <- Element.getAttribute "data-action" element
      id <- map Int.fromString <$> Element.getAttribute "data-id" element
      case action, id of
        Just "Select", Just (Just id') -> pure $ Select id'
        Just "Remove", Just (Just id') -> pure $ Remove id'
        _, _ -> pure NoOp
    Nothing -> pure NoOp

viewRowLazy :: Row -> H.Html Msg
viewRowLazy row = H.lazy "tr" (show row.id) viewRow row

viewRow :: Row -> H.Html Msg
viewRow { id, label, selected } =
  H.tr [ H.key (show id), H.classList ["danger" :> selected]]
    [ H.td [ H.class' "col-md-1" ] [ H.text (show id) ]
    , H.td [ H.class' "col-md-4" ]
      [ H.a [ H.href "#", H.attribute "data-action" "Select", H.attribute "data-id" (show id)  ]
        [ H.text label ]
      ]
    , H.td [ H.class' "col-md-1" ]
      [ H.a [ H.href "#" ]
        [ H.span
          [ H.class' "glyphicon glyphicon-remove"
          , H.attribute "aria-hidden" "true"
          , H.attribute "data-action" "Remove"
          , H.attribute "data-id" (show id)
          ]
          []
        ]
      ]
    , H.td [ H.class' "col-md-6" ] []
    ]

buttons :: Array (H.Html Msg)
buttons =
  button <$>
  [ { id: "run", description: "Create 1,000 rows", msg: Create 1000 }
  , { id: "runlots", description: "Create 10,000 rows", msg: Create 10000 }
  , { id: "add", description: "Append 1,000 rows", msg: Append 1000 }
  , { id: "update", description: "Update every 10th row", msg: UpdateEvery 10 }
  , { id: "clear", description: "Clear", msg: Clear }
  , { id: "swaprows", description: "Swap Rows", msg: Swap }
  ]

button :: { id :: String, msg :: Msg, description :: String } -> H.Html Msg
button { id, msg, description } =
  H.div [ H.class' "col-sm-6 smallpad" ]
    [ H.button
      [ H.type' "button"
      , H.class' "btn btn-primary btn-block"
      , H.id id
      , H.onClick msg
      , H.attribute "ref" "text"
      ]
      [ H.text description ]
    ]
