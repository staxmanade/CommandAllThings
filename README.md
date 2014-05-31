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

| Program        | Windows           | Mac/Linux  |
| ------------- |:-------------:| -----:|
| [Ant](http://ant.apache.org/) | TODO | TODO |
| [Brunch](http://brunch.io/) | TODO | TODO |
| [Cake](http://sourceforge.net/apps/trac/cake-build) | TODO | TODO |
| [Fabric](http://www.fabfile.org/) | TODO | TODO |
| [Gradle](http://www.gradle.org/) | TODO | TODO |
| [gruntjs](http://gruntjs.com) | &#10003; | &#10003; |
| [gulpjs](http://gulpjs.com) | &#10003; | &#10003; |
| [Invoke-Build](https://github.com/nightroman/Invoke-Build) | TODO | TODO |
| [jake](https://github.com/mde/jake) | &#10003; | &#10003; |
| [make](http://en.wikipedia.org/wiki/Make_(software)) | TODO? | &#10003; |
| [Maven](http://maven.apache.org/) | TODO | TODO |
| [rake](http://rake.rubyforge.org/) | &#10003; | &#10003; |
| [PSake](https://github.com/psake/psake) | TODO | TODO |
| [Suggest another here...](https://github.com/staxmanade/CommandAllThings/issues/3) | TODO | TODO |
