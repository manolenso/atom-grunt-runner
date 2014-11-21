[gulp-runner](https://atom.io/packages/gulp-runner)
================

Build your project using Gulp from Atom.

![in action!](http://i.imgur.com/bqn9QQY.png)

## How to use
 * Set a path to your local `gulp-cli` in the settings
 (may not be necessary).
 * Open a project that has a `Gulpfile.js` in the root.
 * Open the task list (`ctrl-alt-g`) and choose a task to run, or input a new one.
 * The output from the gulp task will be shown in bottom toolbar. Toggle
 the log with `ctrl-alt-t`, toggle the entire toolbar with
 `ctrl-alt-shift-t`. The toolbar will appear automatically if Gulp Runner was able to find and
 parse a `Gulpfile`, otherwise you can toggle it on yourself.
 * If your task doesn't end automatically (e.g. watches files for changes) you
 can force it stop from the toolbar or by pressing `ctrl-alt-shift-g`.

Some [issues still exist](#known-issues).

## Installation

Install Gulp Runner package using the command line

    apm install gulp-runner

Or install it from the Atom Package Manager.

## Known issues

 * The Gulpfile must be in the root of your project directory to successfully
 get the available tasks. Additionally, all `gulp` commands will be called
 in the root directory.

 * Tasks added to a Gulpfile will not be automatically added until the project
 is reloaded or the page gets refreshed. They will still be callable from from
 the toolbar.

 * Currently hard to add tasks that prefix another task. For example, if you
 have a task in the task list called `develop`, it is impossible to add or call
 a task called `dev`
