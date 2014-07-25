module.exports = (grunt) ->

  # Setup
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # Config
  userConfig = require './build.config.coffee'

  # Tasks
  taskConfig =
    pkg: grunt.file.readJSON 'package.json'
    clean: [
      '<%= build_dir %>',
      '<%= compile_dir %>'
    ]
    copy:
      build_source_assets:
        files: [
          cwd: '.'
          src: '<%= app_files.assets %>'
          dest: '<%= build_dir %>/assets/images'
          expand: true
          flatten: true
        ]
      build_source_index:
        files: [
          cwd: '.'
          src: '<%= app_files.html %>'
          dest: '<%= build_dir %>'
          expand: true
          flatten: true
        ]
      build_vendor_css:
        files: [
          cwd: '.'
          src: '<%= vendor_files.css %>'
          dest: '<%= build_dir %>/assets/stylesheets'
          expand: true
          flatten: true
        ]
      build_vendor_js:
        files: [
          cwd: '.'
          src: '<%= vendor_files.js %>'
          dest: '<%= build_dir %>/assets/javascripts'
          expand: true
          flatten: true
        ]
      build_vendor_fonts:
        files: [
          cwd: '.'
          src: '<%= vendor_files.fonts %>'
          dest: '<%= build_dir %>/assets/fonts'
          expand: true
          flatten: true
        ]
    concat:
      build_css:
        src: [
          '<%= build_dir %>/assets/stylesheets/tropos.css'
        ]
    sass:
      build_source_scss:
        files: [
          expand: true
          cwd: '.'
          src: [ '<%= app_files.scss %>' ]
          dest: '<%= build_dir %>/assets/stylesheets'
          flatten: true
          ext: '.css'
        ]
      build_vendor_scss:
        files: [
          expand: true
          cwd: '.'
          src: [ '<%= vendor_files.scss %>' ]
          dest: '<%= build_dir %>/assets/stylesheets'
          flatten: true
          ext: '.css'
        ]
    coffee:
      build_source_js:
        expand: true
        cwd: '.'
        src: [ '<%= app_files.coffee %>' ]
        dest: '<%= build_dir %>/assets/javascripts'
        ext: '.js'
        flatten: true
    watch:
      stylesheets:
        files: ['source/app/assets/stylesheets/**/*.scss', 'vendor/**/*.scss']
        tasks: ['styles']
      scripts:
        files: ['source/app/**/*.coffee', 'vendor/**/*.js']
        tasks: ['scripts']
      copy:
        files: ['source/*']
        tasks: ['copy']


  grunt.initConfig grunt.util._.extend(taskConfig, userConfig)

  # Tasks
  grunt.registerTask 'scripts', ['coffee']
  grunt.registerTask 'styles', ['sass']

  grunt.registerTask 'build', ['clean', 'copy', 'styles', 'scripts']

  # Default task(s).
  grunt.registerTask 'default', ['build', 'watch']
