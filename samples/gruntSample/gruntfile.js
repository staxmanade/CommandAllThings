var grunt = require('grunt');

grunt.initConfig({
  log: {
    bar: 'Hello Grunt',
  }
});

grunt.registerMultiTask('log', 'Log stuff.', function() {
  grunt.log.writeln(this.data);
});


grunt.registerTask('default', ['log']);
