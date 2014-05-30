#
# * tangle-util
# * https://github.com/tanglejs/util
# *
# * Copyright (c) 2014 Logan Koester
# * Licensed under the MIT license.
#

path = require 'path'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      src:
        expand: true
        cwd: 'src/'
        src: '**/*.coffee'
        dest: '.'
        ext: '.js'

    clean:
      docs: ['man/']
      tests: ['tests/tmp/']

    watch:
      all:
        files: [
          'Gruntfile.coffee'
          'readme/**/*.md'
          'tests/**/*.coffee'
          '!tests/tmp/**/*'
        ]
        tasks: ['default']

    mochacli:
      options:
        compilers: ['coffee:coffee-script/register']
      all: ['tests/**/*_test.coffee']

    readme_generator:
      readme:
        options:
          banner: 'banner.md'
          generate_title: false
          has_travis: false
          github_username: 'logankoester'
          generate_footer: false
          table_of_contents: false
        order:
          'overview.md': 'Overview'
          'contributing.md': 'Contributing'
          'license.md': 'License'

    bump:
      options:
        files: ['package.json', 'tangle.json']
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json', 'tangle.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-mocha-cli'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'build', ['clean', 'coffee', 'readme_generator']
  grunt.registerTask 'test', ['mochacli']
  grunt.registerTask 'default', ['build', 'test']
