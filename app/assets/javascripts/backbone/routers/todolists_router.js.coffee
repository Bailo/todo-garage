class App.Routers.Todolists extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    @collectionTodolist = new App.Collections.Todolists()
    @collectionTodolist.fetch()


  index: ->
    # render Todolists
    viewTodolists = new App.Views.TodolistsIndex(collection: @collectionTodolist)
    $('#main').html(viewTodolists.render().el)







