CommandAllThings
================

Wrapper around task runners like ([gulp](http://gulpjs.com/)/[grunt](http://gruntjs.com)/[rake](http://rake.rubyforge.org/)/etc...) allowing you to accidentally type the wrong starting command and still accomplish the actual task.

### Say what?

Let's say you are typing at the command prompt, working on a `nodejs` project. This project is leveraging [grunt](gruntjs.com) as it's task tool. You just worked on a project that used [gulp](http://gulpjs.com/) and happen to type `gulp test` at the command.

If you have this setup, it will re-route the `gulp test` command over and execute `grunt test` instead.

## Example:

![sample rake task](assets/SampleRakeCommand.png)

### Get it for: [PowerShell](PowerShell/)

### Get it for: [Bash](bash/)

### Supports

- [x] [gulpjs](http://gulpjs.com)
- [x] [gruntjs](http://gruntjs.com)
- [x] [jake](https://github.com/mde/jake)
- [x] [make](http://en.wikipedia.org/wiki/Make_(software))
- [x] [rake](http://rake.rubyforge.org/)

### TODO:
- [ ] [Ant](http://ant.apache.org/)
- [ ] [Brunch](http://brunch.io/)
- [ ] [Cake](cake-build.sourceforge.net)
- [ ] [Fabric](http://www.fabfile.org/)
- [ ] [Gradle](http://www.gradle.org/)
- [ ] [Maven](http://maven.apache.org/)
- [ ] [PSake](https://github.com/psake/psake)
- [ ] [Suggest another here...](https://github.com/staxmanade/CommandAllThings/issues/3)
