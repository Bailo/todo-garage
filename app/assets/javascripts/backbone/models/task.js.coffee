class App.Models.Task extends Backbone.Model
  defaults:
    done: false

  toggle: ->

    @save({done: !@get('done')})

