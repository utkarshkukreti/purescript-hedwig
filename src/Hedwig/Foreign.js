const snabbdom = require('snabbdom');
const snabbdomTransition = require('snabbdom-transition');
const h = snabbdom.h;

const patch = snabbdom.init([
  require('snabbdom/modules/attributes').default,
  require('snabbdom/modules/props').default,
  require('snabbdom/modules/eventlisteners').default,
  require('snabbdom/modules/style').default,
]);

const ELEMENT = 0;
const MAP = 1;
const LAZY = 2;

exports.element_ = function(name, traits, children) {
  return [ELEMENT, name, traits, children];
};

exports.text_ = function(string) {
  return string;
};

exports.mapHtml_ = function(fn, html) {
  return [MAP, fn, html];
};

exports.lazy_ = function(name, key, fn, arg) {
  return [LAZY, name, key, fn, arg];
};

const ATTRIBUTE = 0;
const PROPERTY = 1;
const ON = 2;
const ON_ = 3;
const KEY = 4;
const STYLE = 5;
const TRANSITION = 6;
const TRANSITION_GROUP = 7;

exports.attribute_ = function(name, value) {
  return [ATTRIBUTE, name, value];
};

exports.property_ = function(name, value) {
  return [PROPERTY, name, value];
};

exports.on_ = function(name, fn) {
  return [ON, name, fn];
};

exports.on__ = function(name, msg) {
  return [ON_, name, msg];
};

exports.key_ = function(key) {
  return [KEY, key];
};

exports.style_ = function(array) {
  return [STYLE, array];
};

exports.transition_ = function(o) {
  return [TRANSITION, o];
};

exports.transition__ = function(o) {
  return [TRANSITION, o];
};

exports.transitionGroup_ = function(o) {
  return [TRANSITION_GROUP, o];
};

exports.transitionGroup__ = function(o) {
  return [TRANSITION_GROUP, o];
};

const call = function(send, msg, event) {
  send(msg(event)())();
};

const call_ = function(send, msg, _event) {
  send(msg)();
};

const toVnode = function(html, send) {
  if (typeof html === 'string') {
    return html;
  }

  var transition, transitionGroup;

  switch (html[0]) {
    case ELEMENT: {
      const name = html[1];
      const traits = html[2];

      const data = {};
      for (var i = 0; i < traits.length; i++) {
        const trait = traits[i];
        switch (trait[0]) {
          case ATTRIBUTE:
            data.attrs = data.attrs || {};
            data.attrs[trait[1]] = trait[2];
            break;
          case PROPERTY:
            data.props = data.props || {};
            if (trait[1] === 'className') {
              if (data.props.className) {
                data.props.className += ' ' + trait[2];
              } else {
                data.props.className = trait[2];
              }
            } else {
              data.props[trait[1]] = trait[2];
            }
            break;
          case ON:
            data.on = data.on || {};
            data.on[trait[1]] = [call, send, trait[2]];
            break;
          case ON_:
            data.on = data.on || {};
            data.on[trait[1]] = [call_, send, trait[2]];
            break;
          case KEY:
            data.key = trait[1];
            break;
          case STYLE:
            data.style = data.style || {};
            const array = trait[1];
            for (var j = 0; j < array.length; j++) {
              const pair = array[j];
              data.style[pair.name] = pair.value;
            }
            break;
          case TRANSITION:
            transition = trait[1];
            break;
          case TRANSITION_GROUP:
            transitionGroup = trait[1];
            break;
        }
      }

      const children = html[3].map(function(child) {
        return toVnode(child, send);
      });

      if (transition) {
        return snabbdomTransition.Transition(transition, name, data, children);
      }
      if (transitionGroup) {
        return snabbdomTransition.TransitionGroup(
          transitionGroup,
          name,
          data,
          children
        );
      }
      return h(name, data, children);
    }

    case MAP: {
      const fn = html[1];
      const html_ = html[2];
      return toVnode(html_, function(msg) {
        return function() {
          return send(fn(msg))();
        };
      });
    }

    case LAZY: {
      const name = html[1];
      const key = html[2];
      const fn = html[3];
      const arg = html[4];
      return snabbdom.thunk(name, key, thunk, [fn, arg, send]);
    }
  }
};

function thunk(fn, arg, send) {
  return toVnode(fn(arg), send);
}

exports.patch0_ = function(nodeOrVnode, html, send) {
  const vnode = toVnode(html, send);
  patch(nodeOrVnode, vnode);
  return vnode;
};

exports.patch_ = exports.patch0_;

exports.querySelector_ = document.querySelector.bind(document);

exports.devtools = {
  send: function(model) {
    return function(msg) {
      return function() {
        if (window.__HEDWIG_DEVTOOLS__) {
          window.__HEDWIG_DEVTOOLS__.send(msg, model);
        }
      };
    };
  },
  subscribe: function(fn) {
    return function() {
      if (window.__HEDWIG_DEVTOOLS__) {
        window.__HEDWIG_DEVTOOLS__.subscribe(fn);
      }
    };
  },
};

exports.log_ = console.log.bind(console);
