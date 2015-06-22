coffee      = require 'coffee-script/register'
moment      = require 'moment'
mocha       = require 'mocha'
rimraf      = require 'rimraf'
should      = require('chai').should()
join        = require('path').join
each        = require('lodash').each
_           = require('lodash')

Metalsmith  = require 'metalsmith'
plugin     = require '..'

describe 'metalsmith-build-date', () ->

   beforeEach (done) ->
      rimraf __dirname + '/build', done
      
   describe 'with default options', ()->
      
      it 'should add buildDate to every file', (done)->
         
         Metalsmith(__dirname)
            .source('fixtures/src')
            .use plugin()
            .use (files, metalsmith, done) ->
               metadata = metalsmith.metadata()
               should.exist metadata.buildDate
               date = metadata.buildDate
               date.getFullYear().should.equal (new Date()).getFullYear()
               date.getMonth().should.equal (new Date()).getMonth()
               date.getDay().should.equal (new Date()).getDay()
               done()
            .build (err, files) ->
               should.not.exist(err)
               should.exist(files)
               done()

   describe 'with explicit options', ()->
      
      it 'should add date property to every file with custom name', (done)->
         
         Metalsmith(__dirname)
            .source('fixtures/src')
            .use plugin
               name: 'foo'
            .use (files, metalsmith, done) ->
               metadata = metalsmith.metadata()
               should.exist metadata.foo
               date = metadata.foo
               date.getFullYear().should.equal (new Date()).getFullYear()
               date.getMonth().should.equal (new Date()).getMonth()
               date.getDay().should.equal (new Date()).getDay()
               done()
            .build (err, files) ->
               should.not.exist(err)
               should.exist(files)
               done()

   afterEach (done) ->
      rimraf __dirname + '/build', done
      
