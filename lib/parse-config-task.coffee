###
Nicholas Clawson -2014

To be launched by an Atom Task, uses packages own gulp
installation to parse a projects Gulpfile
###

grunt = require 'grunt'

# attempts to load the gruntfile
module.exports = (path) ->
  try
    require(path)(grunt)
  catch e
    error = e.code

    return {error: error, tasks: Object.keys grunt.task._tasks}
