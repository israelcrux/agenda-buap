var gulp = require('gulp'),
    stylus = require('gulp-stylus'),
    minifycss = require('gulp-minify-css'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    notify = require('gulp-notify'),
    cache = require('gulp-cache'),
    livereload = require('gulp-livereload'),
    del = require('del');

var devcss = 'dev/styles/';
var devjs = 'dev/scripts/';

gulp.task('combinecss', ['styles'], function(){
    return gulp.src(devcss+'*.css')
        .pipe(concat('everything.css'))
        .pipe(gulp.dest('css/'))
        .pipe(notify({message:'CSS combined into one'}));
});

gulp.task('styles', function() {
  return gulp.src(devcss+'style.styl')
    .pipe(stylus())
    .pipe(rename({suffix: '.min'}))
    .pipe(minifycss())
    .pipe(gulp.dest(devcss))
    .pipe(notify({ message: 'Styles task complete' }));
});

gulp.task('scripts', function() {
  return gulp.src([
        devjs+'jquery.min.js',
        devjs+'bootstrap.min.js',
        devjs+'angular.min.js',
        devjs+'hotkeys.min.js',
        devjs+'angular-app.js'
        ])
    .pipe(concat('everything.js'))
    //.pipe(gulp.dest('js/'))
    // .pipe(rename('everything.js'))
    .pipe(uglify())
    .pipe(gulp.dest('js/'))
    .pipe(notify({ message: 'Scripts task complete' }));
});

gulp.task('default', function() {
    gulp.start('scripts','combinecss');
});

gulp.task('watch', function() {

  // Watch .scss files
  gulp.watch('dev/styles/*.styl', ['combinecss']).on('change', livereload.changed);

  // Watch .js files
  gulp.watch('dev/scripts/*.js', ['scripts']).on('change', livereload.changed);

});