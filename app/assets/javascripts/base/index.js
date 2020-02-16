;(function() {
  let bag = {};

  function require(moduleName) {
    return bag[moduleName];
  }

  function registerModule(moduleName, factory) {
    let m = {exports: {}};
    factory(require, m.exports);
    bag[moduleName] = m.exports;
  }

  function invoke(f) {
    return f();
  }

  let module = {
    invoke,

    thread(seed, fns) {
      return fns.reduce((val, fn) => fn(val), seed);
    },

    formify(object) {
      let formData = new FormData();
    
      for (let key in object) {
        if (object.hasOwnProperty(key)) {
          let value = object[key];
          formData.append(key, value);
        }
      }
    
      return formData;
    }
  };

  registerModule('@base', (_, exports) => { Object.assign(exports, module) });
  window['GlobalBase'] = {registerModule};
})()
