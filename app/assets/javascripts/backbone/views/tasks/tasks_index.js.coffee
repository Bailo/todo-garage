class App.Views.TasksIndex extends Backbone.View

  template: JST['templates/tasks/index']

  tagName: 'section'

  className: 'tasks'

  events:
    'click #create-task' : 'createTask'
    'keypress #input-task'  : 'createOnEnter'


  initialize: ->
   @collection.on('reset', @render, @)
   @collection.on('add', @appendTask, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask, @)
    @

  appendTask: (task) =>
    view = new App.Views.Task(model: task)
    @$('#tasks-list').append(view.render().el) if task.get('todolist_id') == @model.get('id')

  createTask: (e) ->
    e.preventDefault()
    @input = $(@el).find('#input-task').val()

    if @input != ''
      @collection.create title: @input, todolist_id: @model.get('id')
      $(@el).find('#input-task').val('')
      $(@el).find('#form-create-task').removeClass('has-error')
    else
      $(@el).find('#form-create-task').addClass('has-error')

  createOnEnter: (e) ->
    @createTask(e) if e.keyCode == 13