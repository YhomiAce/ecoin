function isNumeric(str) {
  return !isNaN(str) && !isNaN(parseFloat(str));
}

function getNestedValues(obj, ...args) {
  return args.reduce((obj, level) => obj && obj[level], obj)
}

function addDaysToDate(date, days) {
  var result = new Date(date);
  result.setDate(result.getDate() + days);
  return result;
}

function makeid() {
  var text = "";
  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  for (var i = 0; i < 5; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));

  return text;
}

module.exports = {
  isNumeric,
  getNestedValues,
  addDaysToDate,
  makeid
}