config = require('./config.js');

module.exports = ( grunt ) ->

	# target = grunt.option('target') || 'dev'

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json')

		availabletasks:
			tasks: []

		uglify:
			production:
				files:
					'public_html/js/bundle.js': config.javascripts

		cssmin:
			production:
				files:
					'public_html/css/bundle.css': config.stylesheets

		# Alternate to cssmin 
		concat:
			production:
				files:
					'public_html/css/bundle.css': config.stylesheets

		copy:
			src_files:
				expand: true
				cwd: 'src_files/'
				src: '**'
				dest: 'dev/'
			bower:
				expand: true
				cwd: 'bower_components'
				src: '**'
				dest: 'dev/bower_components'
			js:
				expand: true
				cwd: 'src/js/'
				src: '*.js'
				dest: 'dev/js/'
			production:
				expand: true
				flatten: false
				cwd: 'dev'
				src: ['**']
				dest: 'public_html/'

		stylus:
			options:
				compress: false
			dev:
				files: [
					expand: true
					cwd: 'src/css/'
					src: '*.styl'
					dest: 'dev/css/'
					ext: '.css'
				]

		jade:
			dev:
				options:
					data: ()->
						config.env = 'dev'
						config.timestamp = new Date()
						config
					pretty: true
				files: [
						expand: true
						src: "*.jade"
						dest: "dev/"
						cwd: "src/"
						ext: '.html'
					]
			production:
				options:
					data: ()->
						config.env = 'production'
						config.timestamp = new Date()
						config
					pretty: false
				files: [
						expand: true
						src: "*.jade"
						dest: "dev/"
						cwd: "src/"
						ext: '.html'
					]

		coffee:
			dev:
				expand: true
				cwd: 'src/js/'
				src: '*.coffee'
				dest: 'dev/js/'
				ext: '.js'

		watch:
			files:
				files: ['src_files/**']
				tasks: ['clean:src_files','copy:src_files']
				options:
					livereload: true
			styl:
				files: ['src/css/*.styl']
				tasks: ['stylus']
				options:
					livereload: true
			js:
				files: ['src/js/*.js']
				tasks: ['copy', 'jshint']
				options:
					livereload: true
			coffee:
				files: ['src/js/*.coffee']
				tasks: ['coffee', 'jshint']
				options:
					livereload: true
			jade:
				files: ['src/*.jade', 'src/jade/*.jade']
				tasks: ['jade:dev']
				options:
					livereload: true
			markdown:
				files: ['src/*.md']
				tasks: ['jade:dev']
				options:
					livereload: true
			config:
				files: ['config.js']
				tasks: ['jade:dev']
				options:
					livereload: true

		clean: 
			dev: ['dev']
			dest: ['public_html']
			src_files: ['dev/src_files']
		jshint:
			all: ['dev/js/*.js']

		open:
			dev: 
				path: 'http://localhost'
			subl:
				path: '.'
				app: 'Sublime Text'
	})

	grunt.loadNpmTasks('grunt-available-tasks')

	grunt.loadNpmTasks('grunt-contrib-stylus')
	grunt.loadNpmTasks('grunt-contrib-jade')
	grunt.loadNpmTasks('grunt-contrib-coffee')

	grunt.loadNpmTasks('grunt-contrib-watch')

	grunt.loadNpmTasks('grunt-contrib-clean')
	grunt.loadNpmTasks('grunt-contrib-copy')

	grunt.loadNpmTasks('grunt-contrib-uglify')
	grunt.loadNpmTasks('grunt-contrib-cssmin')
	grunt.loadNpmTasks('grunt-contrib-concat')

	grunt.loadNpmTasks('grunt-contrib-jshint')
	grunt.loadNpmTasks('grunt-build-docs')

	grunt.loadNpmTasks('grunt-open')

	grunt.registerTask('default',
		[
			'build'
			'watch'
		]
	)
	grunt.registerTask('build',
		[
			'clean:dev'
			'stylus'
			'jade:dev'
			'coffee:dev'
			'copy:js'
			'copy:src_files'
		]
	)
	grunt.registerTask('export',
		[
			'clean:dest'
			'build'
			'jade:production'
			'copy:production'
			# 'cssmin:production'
			'concat:production'
			'uglify:production'
			'build'
		]
	)

	# grunt.event.on('watch', ( action, filepath, target ) ->
	# 	grunt.log.writeln(target + ': ' + filepath + ' has ' + action);
	# );

	# grunt.event.on('stylus', ( action, filepath, target ) ->
	# 	grunt.log.writeln( env )
	# 	console.log( 'event!' );
	# );
