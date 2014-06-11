module.exports = (grunt) ->
  grunt.initConfig({
    haml:
      dist:
        expand: true
        cwd: 'src/haml'
        src: '**/*.haml'
        dest: 'www/html'
        ext: '.html'
        flatten: false
    sass:
      dist:
        options:
          style: 'expanded'
          loadPath: require('node-bourbon').includePaths
        src: 'src/sass/**/*.sass'
        dest: 'www/css/style.css'
    coffee:
      dist:
        src: 'src/coffee/**/*.coffee'
        dest: 'www/js/script.js'
    watch:
      scripts:
        files: ['**/*.coffee', '**/*.haml', '**/*.sass'],
        tasks: ['haml', 'sass', 'coffee'],
        options:
          spawn: false
  })

  grunt.loadNpmTasks 'grunt-contrib-haml'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', 'haml'
