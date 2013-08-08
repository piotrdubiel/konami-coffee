fs = require 'fs'
{print} = require 'util'
{exec, spawn} = require "child_process"

REPORTER = "nyan"

#
# TASKS
#

task 'build', 'Build .js lib from coffee files', -> build()

task 'test', 'Run tests', -> build -> mocha -> build_test -> phantom()

#
# HELPERS
#

build = (callback) ->
    options = ['-c', '-o', 'lib', 'src']
    launch 'coffee', options, callback

build_test = (callback) ->
    options = ['-c', '-o', 'test', 'test']
    launch 'coffee', options, callback


mocha = (options=[], callback) ->
    if typeof options is 'function'
        callback = options
        options = []
  
    options.push '--reporter'
    options.push REPORTER
  
    options.push '--compilers'
    options.push 'coffee:coffee-script'

    options.push '--require'
    options.push 'coffee-script'

    options.push '--colors'

    options.push 'test/unit.coffee'
  
    launch "./node_modules/.bin/mocha", options, callback

phantom = (options=[], callback) ->
    if typeof options is 'function'
        callback = options
        options = []
    options.push 'test/testrunner.html'
    launch "./node_modules/.bin/mocha-phantomjs", options, callback

launch = (cmd, options=[], callback) ->
    console.log "Launching #{cmd} with options #{options}"
    app = spawn cmd, options
    app.stdout.pipe(process.stdout)
    app.stderr.pipe(process.stderr)
    app.on 'exit', (status) -> callback?() if status is 0
