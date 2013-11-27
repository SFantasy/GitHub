# Filename:
#   Gruntfile.ls
# 
# Author: 
#   fantasyshao (me@fantasyshao.com)
#   
# Copyright (c) 2013 fantasyshao
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
        sass:
            dist:
                options:
                    style: 'compressed'
                    noCache: true
                files:
                    'dist/css/main.css': 'src/sass/main.sass'
        watch:
            sass:
                files: ['src/sass/main.sass']
                tasks: 'sass'
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
    grunt.loadNpmTasks 'grunt-contrib-sass'

    grunt.registerTask 'default', ['coffee', 'sass', 'uglify']

    grunt.registerTask 'w', 'watch'
