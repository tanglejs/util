path = require 'path'

module.exports =

  # Register a grunt task that will spawn a child process
  # to convert  a given markdown file into a manpage.
  #
  # Remember that you still need to run the grunt task
  # for anything to happen.
  # 
  # @param taskName [String] Name of the grunt task
  # @param grunt [Object] Your grunt instance (required!)
  # @param input [String] Path to markdown input file
  # @param output [String] Path to write output file
  #
  registerMarkedMan: (taskName, grunt, input, output) ->
    binPath = path.join(__dirname, '..', 'node_modules', 'marked-man', 'bin')
    grunt.registerTask taskName, ->
      done = @async()
      grunt.util.spawn
        cmd: './marked-man'
        args: [input]
        opts:
          cwd: binPath
      , (error, result, code) ->
        throw error if error
        grunt.file.write output, result.stdout
        done()

  # Run a function in a different grunt base path
  # Not async safe.
  inside: (newDir, grunt, callback) ->
    prevDir = process.cwd()
    grunt.file.setBase newDir
    callback -> grunt.file.setBase(prevDir)
