gulp = require 'gulp'
gutil = require 'gulp-util'
livereload = require 'gulp-livereload'
nodemon = require 'gulp-nodemon'
plumber = require 'gulp-plumber'
gwebpack = require 'gulp-webpack'
less = require 'gulp-less'
autoprefixer = require 'gulp-autoprefixer'
rimraf = require 'rimraf'
rwebpack = require 'webpack'
connectserver = require 'gulp-connect'

root = __dirname
src_path = "#{root}/src"
components_path = "#{root}/bower_components"
modules_path = "#{root}/node_modules"
react_router_components_path = "#{modules_path}/react-router/node_modules"
vendor = "#{root}/vendor"


dist_path = "dist"

err = (x...) -> gutil.log(x...); gutil.beep(x...)

webpack = (name, ext, watch) ->
  options =
#    bail: true
    watch: watch
    cache: true
    devtool: "source-map"
    output:
      filename: "#{name}.js"
      sourceMapFilename: "[file].map"
    resolve:
      extensions: ["", ".webpack.js", ".web.js", ".js",
      ".jsx", ".coffee", ".cjsx"]
    module:
      loaders: [
        {
          test: /\.coffee$/
          loader: "coffee-loader"
        }
        {
          test: /\.cjsx$/
          loader: "transform?coffee-reactify"
        }
        {
          test: /\.jsx$/
          loader: "transform?reactify"
        }
      ]
    plugins: [
        new rwebpack.IgnorePlugin(/vertx/)
    ]

  compiler = rwebpack(options)

  gulp.src("#{src_path}/#{name}.#{ext}")
  .pipe(gwebpack(options, rwebpack))
  .pipe(gulp.dest(dist_path))
  .pipe(connectserver.reload())


js = (watch) -> webpack("app", "cjsx", watch)

gulp.task 'connect', -> connectserver.server(
  {root: [dist_path], livereload: true}
  )

gulp.task 'js', -> js(false)

gulp.task 'js-dev', -> js(true)

gulp.task 'css', ->
  gulp.src("#{src_path}/styles.less")
  .pipe(plumber())
  .pipe(less(
    paths: [vendor]
  ))
  .on('error', err)
  .pipe(autoprefixer("last 2 versions", "ie 8", "ie 9"))
  .pipe(gulp.dest(dist_path))

gulp.task 'clean', ->
  rimraf.sync(dist_path)

gulp.task 'copy', ->
  gulp.src("#{src_path}/*.html").pipe(gulp.dest(dist_path))
  gulp.src("#{src_path}/favicon.ico").pipe(gulp.dest(dist_path))
  .pipe(gulp.dest("#{dist_path}/images"))

gulp.task 'build', ['clean', 'copy', 'css', 'js']

gulp.task 'default', ['clean', 'copy', 'css', 'js-dev', 'watch', 'connect']

gulp.task 'watch', ['copy'], ->
  gulp.watch(["#{dist_path}/**/*"])
  gulp.watch ["#{src_path}/**/*.less"], ['css']
  gulp.watch ["#{src_path}/**/*.html"], ['copy']
