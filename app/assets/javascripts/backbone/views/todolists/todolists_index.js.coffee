class App.Views.TodolistsIndex extends Backbone.View

  template: JST['templates/todolists/index']

  events:
    'click [data-action="create-todo"]' : 'createTodo'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @appendTodolist, @)



  render: ->
    $(@el).html(@template())
    @collection.each(@appendTodolist, @)
    @

  appendTodolist: (todolist) =>
    view = new App.Views.Todolist(model: todolist)
    @$('#todolists').append(view.render().el)


  createTodo: (e) ->
    e.preventDefault()
    @collection.create @model
