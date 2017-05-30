module.exports = (grunt) ->

	grunt.initConfig

		paths:
			templates: "mrb/templates"
			src: "app"
			dest: "www"

		pkg: grunt.file.readJSON("package.json")

		connect:
			server:
				options:
					port: 7007
					livereload: 37642
					base: "<%= paths.dest %>"

		watch:
			livereload:
				files: [
					"<%= paths.dest %>/**/*.css"
					# "<%= paths.templates %>/**/*"
				]
				options:
					livereload: 37642
			js:
				files: ["<%= paths.src %>/assets/scripts/{,**}/*.coffee"]
				tasks: ["coffee"]
			compass:
				files: ["<%= paths.src %>/assets/styles/{,**}/*.{sass,scss}"]
				tasks: ["compass"]
			jade:
				files: ['<%= paths.src %>/{,**}/*.jade']
				tasks: ['jade']


		coffee:
			compile:
				options:
					join: true
				files: [
					"<%= paths.dest %>/main.js": [
						"<%= paths.src %>/assets/scripts/util.coffee"
						"<%= paths.src %>/assets/scripts/main.coffee"
						"<%= paths.src %>/assets/scripts/*.coffee"
					]
					# {
					# 	expand: true # Enable dynamic expansion.
					# 	cwd: "<%= paths.src %>/coffee/pages/" # Src matches are relative to this path.
					# 	src: ["*.coffee"] # Actual pattern(s) to match.
					# 	dest: "<%= paths.dest %>/assets/scripts/pages/" # Destination path prefix.
					# 	ext: ".js" # Dest filepaths will have this extension.
					# }
				]


		compass:
			dist:
				options:
					noLineComments: false
					# debugInfo: true
					sassDir: '<%= paths.src %>/assets/styles'
					cssDir: '<%= paths.dest %>/'
					environment: 'development'
					# require: [
					# 	# 'susy'
					# 	# 'bootstrap-sass'
					# 	# 'breakpoint'
					# ]


		jade:
			dist:
				options:
					pretty: true
				files: [{
					expand: true,
					cwd: '<%= paths.src %>/templates',
					dest: "<%= paths.dest %>",
					src: '*.jade',
					ext: '.html'
				}]


	grunt.loadNpmTasks("grunt-contrib-coffee")
	grunt.loadNpmTasks("grunt-contrib-jade")
	grunt.loadNpmTasks("grunt-contrib-watch")
	grunt.loadNpmTasks("grunt-contrib-compass")
	grunt.loadNpmTasks('grunt-contrib-connect')
	grunt.loadNpmTasks("grunt-notify")

	grunt.registerTask "default", [
		"jade"
		"compass"
		"connect"
		"watch"
	]


# npm install --save-dev \
# grunt-contrib-coffee \
# grunt-contrib-watch \
# grunt-contrib-compass \
# grunt-contrib-jade \
# grunt-notify