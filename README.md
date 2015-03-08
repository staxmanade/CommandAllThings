CommandAllThings
================

> By: [@staxmanade](http://staxmanade.com)

Wrapper around task runners like ([gulp](http://gulpjs.com/)/[grunt](http://gruntjs.com)/[rake](http://rake.rubyforge.org/)/etc...) allowing you to accidentally type the wrong starting command and still accomplish the actual task.

### Say what?

Let's say you are typing at the command prompt, working on a `nodejs` project. This project is leveraging [grunt](gruntjs.com) as it's task tool. You just worked on a project that used [gulp](http://gulpjs.com/) and happen to type `gulp test` at the command.

If you have this setup, it will re-route the `gulp test` command over and execute `grunt test` instead.

## Example:

![sample rake task](assets/SampleRakeCommand.png)

### Get it for: [PowerShell](PowerShell/)

### Get it for: [Bash](bash/)

### Supports

| Program        | Windows           | Mac/Linux  |
| ------------- |:-------------:| -----:|
| [Gradle](http://www.gradle.org/) | [TODO](https://github.com/staxmanade/CommandAllThings/issues/10) | &#10003; |
| [GruntJS](http://gruntjs.com) | &#10003; | &#10003; |
| [GulpJS](http://gulpjs.com) | &#10003; | &#10003; |
| [Invoke-Build](https://github.com/nightroman/Invoke-Build) | &#10003; |  |
| [Jake](https://github.com/mde/jake) | &#10003; | &#10003; |
| [Make](http://en.wikipedia.org/wiki/Make_(software)) |  | &#10003; |
| [Rake](http://rake.rubyforge.org/) | &#10003; | &#10003; |
| [PSake](https://github.com/psake/psake) | [TODO](https://github.com/staxmanade/CommandAllThings/issues/12) |  |
| [Xbuild](http://www.mono-project.com/Microsoft.Build) | [TODO](https://github.com/staxmanade/CommandAllThings/issues/15) | &#10003; |
| &nbsp; |  |  |
| [Suggest another here...](https://github.com/staxmanade/CommandAllThings/issues/new) |  |  |

### Contributing

Would love input and other sets of eyes with ideas on how to improve the tool/scripts. If you add a new tool, checkout the [Contributing.md](CONTRIBUTING.md) for a set of TODO's/how to run tests.
