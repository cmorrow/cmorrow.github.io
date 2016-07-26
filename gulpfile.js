const child = require('child_process');
const browserSync = require('browser-sync').create();
const reload      = browserSync.reload;

const gulp = require('gulp');
const concat = require('gulp-concat');
const gutil = require('gulp-util');
const sass = require('gulp-sass');

const siteRoot = '_site';
const sassFiles = '_sass/**/*.?(s)css';
const jsFiles = 'js/**/*.?(s)js';

gulp.task('sass', () => {
  gulp.src(sassFiles)
    .pipe(sass())
    .pipe(concat('main.css'))
    .pipe(gulp.dest(siteRoot + '/css'))
    .pipe(browserSync.stream());
});

gulp.task('jekyll', () => {
  const jekyll = child.spawn('jekyll', ['build',
    '--watch',
    '--incremental',
    '--drafts'
  ]);

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
    files: [siteRoot + '/**'],
    port: 4000,
    server: {
      baseDir: siteRoot
    }
  });

  gulp.watch([sassFiles], ['sass']).on("change", reload);
  gulp.watch(["*.html", '*.js', '_posts/**/*.*'], ['jekyll']);
});

gulp.task('default', ['sass', 'jekyll', 'serve']);