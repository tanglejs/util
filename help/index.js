(function() {
  module.exports = {
    showLocalMan: function(page) {
      var cmd, exec;
      exec = require('child_process').exec;
      cmd = "man --local-file " + page;
      return exec(cmd, function(err, stdout, stderr) {
        process.stdout.write("" + stdout);
        process.stderr.write("" + stderr);
        if (err) {
          return console.error(err);
        }
      });
    }
  };

}).call(this);
