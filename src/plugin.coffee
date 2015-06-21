
_ = require 'lodash'

module.exports = (options) ->
   
   options ?= {}
   defaults = 
      name: 'buildDate'

   _.defaults options, defaults

   (files, metalsmith, next) ->
      
      metadata = metalsmith.metadata()
      metadata[options.name] = new Date()

      next()
