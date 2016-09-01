var $ = require('gulp-load-plugins')();
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
const gulpif = require('gulp-if');
const webpack = require('webpack');
const gulpWebpack = require('webpack-stream');
const cp          = require('child_process');

const src = '_src';
const site = '_site';
const imageFiles = src + '/images/**/*'
const sassFiles = [src + '/_sass/*.scss', src + '/foundation-sites/scss/**/*.scss']
const jsFiles = src + '/js/**/*.js';
const htmlFiles = ['./_config.yml', './*.{md,markdown,html}', './_drafts/**/*.{md,markdown,html}', 
    './tag/**/*.html', './category/**/*.html',
    './_includes/**/*.{md,markdown,html}', './_layouts/**/*.{md,markdown,html}', 
    './_posts/**/*.{md,markdown,html}'
    ];

// check for production flag
const PRODUCTION = !!(process.argv.production);

gutil.log('PRODUCTION is set: ' + PRODUCTION);

const paths = {
  jekyll: './',
  images: src + '/images/**/*',
  siteImages: site + '/assets/images',
  siteCss: site + '/assets/css',
  siteJs: site + '/assets/js/',
  jekyllImages: './assets/images',
  sass: [src + '/foundation-sites/scss'],
  jekyllCss: './assets/css'
}

// Sass task -----------------------------
gulp.task('sass', () => {

  gulp.src(src + '/_sass/main.scss')
    .pipe($.sourcemaps.init())
    .pipe($.sass({
      outputStyle: 'nested',
      precision: 10,
      includePaths: paths.sass,
      onError: console.error.bind(console, 'Sass error:')
    }))
    .pipe(concat('main.css'))
    .pipe(autoprefixer({browsers: ['last 2 versions', 'ie >= 10']}))
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest(paths.siteCss))
    .pipe(gulp.dest(paths.jekyllCss))
    .pipe(reload({stream: true}));
});

// Combine JavaScript into one file
// In production, the file is minified
gulp.task('javascript', () => {
  gulp.src([src + '/js/global/**/*.js', src + '/js/vendor/**/*.js'])
    .pipe($.sourcemaps.init())
    .pipe(gulpif(!PRODUCTION, $.sourcemaps.write()))
    .pipe(concat('app.js'))
    .pipe(gulp.dest(paths.siteJs)) // gulp local dev
    .pipe(gulp.dest('./assets/js')) // jekyll
    .pipe(reload({stream: true}));

    // copy page-specific js
    gulp.src(src + '/js/*.js')
    .pipe($.sourcemaps.init())
    .pipe(gulpif(!PRODUCTION, $.sourcemaps.write()))
    .pipe(gulp.dest(paths.siteJs)) // gulp local dev
    .pipe(gulp.dest('./assets/js')) // jekyll
    .pipe(reload({stream: true}));
});

gulp.task('images', function() {
  return gulp.src(paths.images)
    .pipe(imagemin())
    .pipe(gulp.dest(paths.jekyllImages))
    .pipe(gulp.dest(paths.siteImages))
    .pipe(size({showFiles: true}))
    .pipe(reload({stream: true}));
});

// --- Jekyll task --------------------

gulp.task('jekyll', function(done) {

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

});



gulp.task('serve', () => {

  browserSync.init({
    port: 4000,
    server: {
      baseDir: site + '/'
    }
  });

});

gulp.task('watch', () => {
  // sass/css
  gulp.watch(sassFiles, ['sass']);
  gulp.watch(paths.siteCss + '/*.css').on("change", reload);

  gulp.watch(jsFiles, ['javascript']);

  // html files
  gulp.watch(htmlFiles, ['jekyll']); // build html using jekyll
  gulp.watch(site + '/**/*.html').on("change", reload); // reload after html files built from jekyll task

});

gulp.task('default', ['sass', 'images', 'javascript', 'serve', 'watch', 'jekyll']);