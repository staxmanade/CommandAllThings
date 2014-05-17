CommandAllThings - PowerShell
================

Wrapper round task runners like ([gulp](http://gulpjs.com/)/[grunt](gruntjs.com)/[rake](http://rake.rubyforge.org/)/etc...) allowing you to accidentally type the wrong starting command and still accomplish the actual task.

### Say what?

Let's say you are typing at the command prompt, working on a `nodejs` project. This project is leveraging [grunt](gruntjs.com) as it's task tool. You just worked on a project that used [gulp](http://gulpjs.com/) and happen to type `gulp test` at the command.

If you have CommandAllThings setup, it will re-route the `gulp test` command over and execute `grunt test` instead.

## Example:

![sample rake task](../assets/SampleRakeCommand.png)

### Setup

(TODO) - still working on this step. If you're interested take a look at the [sampleProfile.ps1](sampleProfile.ps1)
