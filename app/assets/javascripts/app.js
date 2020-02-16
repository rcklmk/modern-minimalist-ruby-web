GlobalBase.registerModule('app', function(require) {
  let {  } = require('@base');
  let { interval } = require('baconjs');

  let clockView = document.querySelector('#clock');

  /**
   * @param {Date} date 
   */
  function formatClock(date) {
    let
      hh = twoDigitZeroPad(date.getHours()),
      mm = twoDigitZeroPad(date.getMinutes()),
      ss = twoDigitZeroPad(date.getSeconds());
    return `${hh}:${mm}:${ss}`;
  }

  /**
   * @param {number} n 
   * @returns {string}
   */
  function twoDigitZeroPad(n) {
    return (
      '00' + n.toString()
    ).substr(-2);
  }

  interval(500)
    .scan(null, () => new Date())
    .map(mdate => mdate === null ? '-' : formatClock(mdate))
    .skipDuplicates()
    .onValue(function(msg) {
      Object.assign(clockView, {innerText: msg});
    });
});
