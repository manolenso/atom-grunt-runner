###
Nicholas Clawson -2014

Entry point for the package, creates the toolbar and starts
listening for any commands or changes
###

window.View = require './gulp-runner-view.coffee'

module.exports =
    configDefaults:
        gulpPaths: []

    originalPath: ''

    # creates gulp-runner view andstarts listening for commands
    activate:(state = {}) ->
        @originalPath = process.env.PATH
        atom.config.observe 'gulp-runner.gulpPaths', @updateSettings.bind @

        @view = new View(state)
        atom.workspaceView.command 'gulp-runner:stop', @view.stopProcess.bind @view
        atom.workspaceView.command 'gulp-runner:toggle-log', @view.toggleLog.bind @view
        atom.workspaceView.command 'gulp-runner:toggle-panel', @view.togglePanel.bind @view
        atom.workspaceView.command 'gulp-runner:run', @view.toggleTaskList.bind @view

    # called whenever the settings for gulp runner changes
    # updates the env.process.PATH value to include custom paths
    updateSettings: ->
        gulpPaths = atom.config.get('gulp-runner').gulpPaths
        gulpPaths = if Array.isArray gulpPaths then gulpPaths else []
        process.env.PATH = @originalPath + (if gulpPaths.length > 0 then ':' else '') + gulpPaths.join ':'

    # returns a JSON object representing the packages state
    serialize: ->
        @view.serialize()

    # stops any currently running processes
    deactivate: ->
        @view.stopProcess()
