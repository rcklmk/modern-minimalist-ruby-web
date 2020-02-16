[
  ['@dom/fetch' , (_, exports) => { exports.default = window.fetch }],
  ['baconjs'    , (_, exports) => { Object.assign(exports, window.Bacon) }]
]
  .forEach(moduleDefinition => { GlobalBase.registerModule(...moduleDefinition) });
