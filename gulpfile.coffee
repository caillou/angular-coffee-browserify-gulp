gulp = require('gulp')
browserify = require('gulp-browserify')
concat = require('gulp-concat')
angularTemplateCache = require('gulp-angular-templatecache')
addStream = require 'add-stream'

prepareTemplates = ->
  gulp.src('src/templates/**/*.html')
  .pipe(angularTemplateCache(module: 'rga'))

gulp.task 'scripts', ->
  gulp.src('./src/*.coffee', { read: false })
  .pipe(browserify(transform: ['coffeeify'], extensions: ['.coffee']))
  .pipe(addStream.obj(prepareTemplates()))
  .pipe(concat('index.js'))
  .pipe(gulp.dest('./build'))

gulp.task 'index', ->
  gulp.src('./src/index.html', {base: './src'})
  .pipe(gulp.dest('./build/'))

gulp.task('default', ['scripts', 'index'])
