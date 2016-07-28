const browserSync = require('browser-sync').create();
const reload      = browserSync.reload;

const path = require('path');
const gulp = require('gulp');
const run = require('gulp-run');
const concat = require('gulp-concat');
const gutil = require('gulp-util');
const imagemin = require('gulp-imagemin');
const size = require('gulp-size');
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
const sourcemaps = require('gulp-sourcemaps');
const gulpif = require('gulp-if');
const webpack = require('webpack');
const gulpWebpack = require('webpack-stream');

const src = './_src';
const site = './_site';
const imageFiles = src + '/images/**/*'
const sassFiles = [src + '/_scss', src + '/foundation-sites/scss']
const jsFiles = src + '/js/app.js';

const webpackConfig = require('./webpack.config.js');

// check for production flag
const PRODUCTION = !!(process.argv.production);

gutil.log('PRODUCTION is set: ' + PRODUCTION);

const paths = {
  jekyll: './',
  images: src + '/images/**/*',
  siteImages: site + '/images',
  jekyllImages: './assets/images',
  sass: [src + '/foundation-sites/scss',
          src + '/foundation-sites/scss'
  ],
  siteCss: site + '/css',
  jekyllCss: './assets/css'
}

gulp.task('sass', () => {
  gulp.src(src + '/_sass/main.scss')
    .pipe(sourcemaps.init())
    .pipe(sass({
      includePaths: paths.sass
    }))
    .pipe(concat('main.css'))
    .pipe(autoprefixer({browsers: ['last 2 versions', 'ie >= 10']}))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(paths.siteCss))
    .pipe(gulp.dest(paths.jekyllCss))
    .pipe(browserSync.stream());
});

// Combine JavaScript into one file
// In production, the file is minified
gulp.task('javascript', function() {
  return gulp.src(src + '/js/app.js')
    // .pipe(sourcemaps.init())
    // .pipe(concat('app.js'))
    // .pipe(gulpif(!PRODUCTION, sourcemaps.write()))
    .pipe(gulpWebpack({}, webpack))
    // .pipe(webpack(webpackConfig))
    .pipe(concat('app.js'))
    .pipe(gulp.dest(site + '/assets/js')) // gulp local dev
    .pipe(gulp.dest('./assets/js')); // jekyll
});

gulp.task('images', function() {
  return gulp.src(paths.images)
    .pipe(imagemin())
    .pipe(gulp.dest(paths.jekyllImages))
    .pipe(gulp.dest(paths.siteImages))
    .pipe(browserSync.stream())
    .pipe(size({showFiles: true}))
    .on('error', gutil.log);
});

gulp.task('jekyll', function() {
  var shellCommand = 'jekyll build';
  shellCommand += ' --config _config.yml --drafts --watch';

  
  var i = process.argv.indexOf("--incremental");

  if(i > -1) {
    gutil.log('process.argv: ' + process.argv[i]);
    shellCommand += ' --incremental';
  }

  return gulp.src(paths.jekyll)
    .pipe(run(shellCommand))
    .on('error', gutil.log);

  const jekyllLogger = (buffer) => {
    buffer.toString()
      .split(/\n/)
      .forEach((message) => gutil.log('Jekyll: ' + message));
  };

  jekyll.stdout.on('data', jekyllLogger);
  jekyll.stderr.on('data', jekyllLogger);

  // reload browserSync
  reload;
});

gulp.task('serve', () => {
  browserSync.init({
    files: [site + '/**'],
    port: 4000,
    server: {
      baseDir: site
    }
  });
});

gulp.task('watch', () => {
  // reload page
  gulp.watch(sassFiles, ['sass']).on("change", reload);

  // build jekyll after save
  gulp.watch(['./index.html', '_drafts/**/*',
      '_includes/**/*', '_layouts/**/*', '_posts', '_posts/**/*',
      'assets/**/*.js'
      ], ['jekyll']);
});

gulp.task('default', ['sass', 'images', 'javascript', 'jekyll', 'serve', 'watch']);