const RemoteDev = require('remotedev');

const remotedev = RemoteDev.connectViaExtension();

const prettyMsg = function(msg) {
  switch (typeof msg) {
    case 'object':
      var pretty = msg.constructor.name;
      for (var i = 0; ; i++) {
        if ('value' + i in msg) {
          pretty += ':' + prettyMsg(msg['value' + i]);
        } else {
          break;
        }
      }
      return pretty;
    default:
      return msg;
  }
};

exports.init = function() {
  window.__HEDWIG_DEVTOOLS__ = {
    send: function(msg, model) {
      if (msg === '!') return;
      remotedev.send({ type: prettyMsg(msg), msg: msg }, model);
    },
    subscribe: function(fn) {
      remotedev.subscribe(function(message) {
        const model = RemoteDev.extractState(message);
        console.log('SUB', message, model);
        if (model !== undefined) fn(model)();
      });
    },
  };
};
