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

gulp.task('combinecss',function(){
    return gulp.src('css/*')
        .pipe(concat('everything.css'))
        .pipe(gulp.dest('css/'))
        .pipe(notify({message:'CSS combined into one'}));
});

gulp.task('styles', ['combinecss'], function() {
  return gulp.src('dev/styles/style.styl')
    .pipe(stylus())
    .pipe(gulp.dest('css/'))
    .pipe(rename({suffix: '.min'}))
    .pipe(minifycss())
    .pipe(gulp.dest('css/'))
    .pipe(notify({ message: 'Styles task complete' }));
});

gulp.task('scripts', function() {
  return gulp.src('dev/scripts/*.js')
    .pipe(concat('main.js'))
    .pipe(gulp.dest('js/'))
    .pipe(rename({suffix: '.min'}))
    .pipe(uglify())
    .pipe(gulp.dest('js/'))
    .pipe(notify({ message: 'Scripts task complete' }));
});



gulp.task('default', function() {
    gulp.start('styles', 'scripts');
});

gulp.task('watch', function() {

  // Watch .scss files
  gulp.watch('dev/styles/*.styl', ['styles']).on('change', livereload.changed);

  // Watch .js files
  gulp.watch('dev/scripts/*.js', ['scripts']).on('change', livereload.changed);

});