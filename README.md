# Hedwig

Hedwig is a fast, type safe, declarative PureScript library for building web
applications.

### [Getting Started](#getting-started) | [Examples](#examples)

## Features

### Fast

The performance of Hedwig is competitive with mainstream JavaScript frameworks,
both in terms of CPU usage and Memory consumption. In
[js-framework-benchmark][jfb], Hedwig performs
[as well as or better than][jfb-results] React, Angular, and Vue.

### Small

A Hello World program weighs in at around 11kB minified + gzipped. The
[js-framework-benchmark][jfb] implementation weighs in at around 16kB.

### Declarative Animations

Animations are essential to maintain a direct and engaging real-world feel.
Hedwig makes adding animations easy using a declarative CSS transition based
API. [Read More &darr;](#animations)

### Integration with Developer Tools

Hedwig integrates with Redux DevTools to provide an interactive state
modification viewer and time travelling debugger. [Read More &darr;](#developer-tools)

## Getting Started

You'll need to have [Node.js](https://nodejs.org/) and
[pulp](https://github.com/purescript-contrib/pulp) installed.

You can either clone the starter template or follow the instructions below to
create an application from scratch.

### Starter Template

Clone the repository, install the dependencies, and start the dev server:

```
$ git clone https://github.com/utkarshkukreti/purescript-hedwig-starter my-app
$ cd my-app
$ npm install
$ bower install
$ npm start
```

and open `index.html` in your browser.

### From Scratch

Initialize a new project using `pulp` and create an empty `package.json`:

```
$ mkdir my-app
$ cd my-app
$ pulp init
$ echo '{}' > package.json
```

Install the dependencies:

```
$ bower install --save purescript-hedwig
$ npm install --save purescript-hedwig
```

Create an HTML file to load the JS (save this to `index.html`):

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My App</title>
  </head>
  <body>
    <main></main>
    <script src="index.js"></script>
  </body>
</html>
```

Create and mount the application (save this to `src/Main.purs`):

```
module Main where

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
```

Compile the application:

```
$ pulp browserify --to index.js
```

Finally, open `index.html` in your browser. You should now see the text "Hello,
world!" appear on the screen.

## Animations

Hedwig provides two main functions to add animation to elements:

![Hedwig Declarative Animations](https://gist.githubusercontent.com/utkarshkukreti/ad83e5a0eb7e6f456e20be0778aae843/raw/2d5ca8641f267aef08d7d658e0fa4ab24b997c21/purescript-hedwig-transition.gif)

### (1) Hedwig.transition :: String -> Trait msg

Adding this to the traits list of an element will make Hedwig to add 6 classes
to the element at different times. The `String` argument is the prefix to use
for the classes. Let's say we do `div [Hedwig.transition "fade"] [text "Hello"]`
. This will apply 6 classes:

1.  fade-enter: Starting state for enter. Added before element is inserted,
    removed one frame after element is inserted.

2.  fade-enter-active: Active state for enter. Applied during the entire entering
    phase. Added before element is inserted, removed when transition/animation
    finishes. This class can be used to define the duration, delay and easing
    curve for the entering transition.

3.  fade-enter-to: Ending state for enter. Added one frame after element is
    inserted (at the same time v-enter is removed), removed when
    transition/animation finishes.

4.  fade-leave: Starting state for leave. Added immediately when a leaving
    transition is triggered, removed after one frame.

5.  fade-leave-active: Active state for leave. Applied during the entire leaving
    phase. Added immediately when leave transition is triggered, removed when the
    transition/animation finishes. This class can be used to define the duration,
    delay and easing curve for the leaving transition.

6.  fade-leave-to: Ending state for leave. Added one frame after a leaving
    transition is triggered (at the same time v-leave is removed), removed when
    the transition/animation finishes.

[Inspiration for the feature and source of the description above.](https://vuejs.org/v2/guide/transitions.html#Transition-Classes).

With a tiny bit of CSS, you can create all sorts of animations with the above.
See the [AnimatedList.purs](./examples/AnimatedList.purs) and
[AnimatedList.css](./examples/AnimatedList.css) and its
[Live Demo](http://utkarshkukreti.github.io/purescript-hedwig/AnimatedList.html)
for an example.

`Hedwig.transition'` is similar but lets you specify custom class names to add
for each stage.

2.  Hedwig.transitionGroup :: String -> Trait msg

A transition group enables normal transition on all its children elements, plus
it keeps track of the positions of its children, and whenever that changes,
adds CSS classes and a CSS transform to them. With a line of CSS, you can
animate the movement of the nodes:

```css
.fade-move {
  transition: transform 0.2s;
}
```

See [AnimatedList.purs](./examples/AnimatedList.purs) and
[AnimatedList.css](./examples/AnimatedList.css) and its
[Live Demo](http://utkarshkukreti.github.io/purescript-hedwig/AnimatedList.html)
for an example.

`Hedwig.transitionGroup'` is similar but lets you specify custom class names to
add for each stage.

## Developer Tools

Hedwig integrates with Redux DevTools to provide an interactive state
modification viewer and time travelling debugger.

![Hedwig with Redux DevTools](https://gist.githubusercontent.com/utkarshkukreti/ad83e5a0eb7e6f456e20be0778aae843/raw/2d5ca8641f267aef08d7d658e0fa4ab24b997c21/purescript-hedwig-redux-2.gif)

To enable this, you need to do two things:

1.  Import `Hedwig.Devtools`

2.  In your `main` function, before you mount the application, call
    `Hedwig.Devtools.init`.

After recompiling your application, you should see all messages and state being
logged into the Redux tab of Chrome DevTools window.

## Examples

The `examples/` directory contains a bunch of examples:

- [HelloWorld](./examples/HelloWorld.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/HelloWorld.html)) -
  Just writes the text "Hello, world!" to the screen.

- [Counter](./examples/Counter.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/Counter.html)) -
  A numeric counter with increment and decrement buttons.

- [Counters](./examples/Counters.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/Counters.html)) -
  A dynamic list of numeric counters.

- [Dice](./examples/Dice.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/Dice.html)) -
  Rolls a dice using the purescript-random package.
  Showcases how a Hedwig application can run side effects.

- [Prompt](./examples/Prompt.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/Prompt.html)) -
  Prompts the user to enter their name by calling `window.prompt`.
  Also showcases how to run functions with side effects.

- [AnimatedList](./examples/AnimatedList.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/AnimatedList.html)) -
  An animated list of boxes.

- [JsFrameworkBenchmark](./examples/JsFrameworkBenchmark.purs)
  ([Demo](http://utkarshkukreti.github.io/purescript-hedwig/JsFrameworkBenchmark.html)) -
  An implementation of [js-framework-benchmark][jfb]. See benchmark results
  [here][jfb-results].

[jfb]: https://github.com/krausest/js-framework-benchmark
[jfb-results]: https://gist.githubusercontent.com/utkarshkukreti/ad83e5a0eb7e6f456e20be0778aae843/raw/2d5ca8641f267aef08d7d658e0fa4ab24b997c21/Screen%2520Shot%25202018-08-24%2520at%25202.04.20%2520PM.png
