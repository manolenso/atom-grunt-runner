###
Nicholas Clawson -2014

To be launched by an Atom Task, uses packages own gulp
installation to parse a projects Gulpfile
###

gulp = require 'gulp'

# attempts to load the gulpfile
module.exports = (path) ->
    try
        require(path)(gulp)
    catch e
        error = e.code

    return {error: error, tasks: Object.keys gulp.task._tasks}
