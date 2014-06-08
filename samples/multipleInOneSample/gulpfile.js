var gulp = require('gulp');

gulp.task('test', function() {
  console.log('Hello Gulp');
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['test']);
