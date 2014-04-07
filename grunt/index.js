(function() {
  var path;

  path = require('path');

  module.exports = {
    registerMarkedMan: function(taskName, grunt, input, output) {
      var binPath;
      binPath = path.join(__dirname, '..', 'node_modules', 'marked-man', 'bin');
      return grunt.registerTask(taskName, function() {
        var done;
        done = this.async();
        return grunt.util.spawn({
          cmd: './marked-man',
          args: [input],
          opts: {
            cwd: binPath
          }
        }, function(error, result, code) {
          if (error) {
            throw error;
          }
          grunt.file.write(output, result.stdout);
          return done();
        });
      });
    },
    inside: function(newDir, grunt, callback) {
      var prevDir;
      prevDir = process.cwd();
      grunt.file.setBase(newDir);
      return callback(function() {
        return grunt.file.setBase(prevDir);
      });
    }
  };

}).call(this);
