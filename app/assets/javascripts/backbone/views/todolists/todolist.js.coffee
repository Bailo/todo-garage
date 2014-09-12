class App.Views.Todolist extends Backbone.View

  template: JST['templates/todolists/todolist']

  tagName: 'div'

  className: 'todo-list'

  events:
    'click [data-action="edit-title"]'  : 'editTitle'
    'keypress #form-edit-title'         : 'updateOnEnter'
    'blur #edit-title'                  : 'close'
    'click [data-action="delete-todo"]' : 'deleteTodolist'

  initialize: ->
    @model.bind 'change', @render, @
    @model.bind 'destroy', @remove, @

    @collectionTasks = new App.Collections.Tasks()
    @collectionTasks.fetch()

  render: ->
    viewTasks = new App.Views.TasksIndex(collection: @collectionTasks, model: @model)
    $(@el).html(@template(todolist: @model)).append(viewTasks.render().el)
    @


  editTitle: () ->
    $(@el).find('input#edit-title').addClass('edit').focus().select()

  close: (e) ->
    e.preventDefault()
    @input = $(@el).find('input#edit-title')
    if @input.val() != ''
      @model.save title: @input.val()
      @input.removeClass('edit')
    else
      $(@el).find('form#form-edit-title').addClass('has-error')

  updateOnEnter: (e) ->
    @close(e) if e.keyCode == 13

  deleteTodolist: ->
    @model.destroy() if confirm 'Are you sure, bro?'



