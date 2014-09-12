window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Templates: {}
  init: ->
    console.log('backbone:start')
    new App.Routers.Todolists()
    Backbone.history.start()

$ ->
  App.init()


