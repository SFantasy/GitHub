# Filename:
#   Gruntfile.ls
# 
# Author: 
#   fantasyshao (me@fantasyshao.com)
#   
# Copyright (c) NJFOSS, 2013.
#
# License:
#   The MIT license 
#

module.exports = (grunt) ->

    grunt.initConfig
        coffee:
            compile:
                files:
                    'dist/js/main.js': 'src/coffee/main.coffee'

        uglify:
            my_target:
                files:
                    'dist/js/main.min.js': 'dist/js/main.js'

        watch:
            coffee:
                files: ['src/coffee/main.coffee']
                tasks: 'coffee'
            livereload:
                files: ['src/coffee/main.coffee']
                options:
                    livereload: true

    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['coffee', 'uglify']

    grunt.registerTask 'w', 'watch'
