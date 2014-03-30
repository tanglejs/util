module.exports =

  # Display a manpage from a local file
  # Example: showLocalMan( path.join(__dirname, 'man', 'tangle-config.1') )
  #
  showLocalMan: (page) ->
    exec = require('child_process').exec

    cmd = "man --local-file #{page}"
    exec cmd, (err, stdout, stderr) ->
      process.stdout.write "#{stdout}"
      process.stderr.write "#{stderr}"
      console.error err if err
