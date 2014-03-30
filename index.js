(function() {
  var path;

  path = require('path');

  module.exports = {
    help: require(path.join(__dirname, 'help', 'index')),
    grunt: require(path.join(__dirname, 'grunt', 'index'))
  };

}).call(this);
