class App.Views.Task extends Backbone.View

  template: JST['templates/tasks/task']

  tagName: 'li'

  events:
    'click #toggle'                     : 'toggleDone'
    'click [data-action="edit-task"]'   : 'editTask'
    'keypress #form-edit-task'                 : 'updateOnEnter'
    'blur #edit-task'                   : 'close'
    'click [data-action="delete-task"]' : 'deleteTask'

  initialize: ->
    @model.bind 'change', @render, @
    @model.bind 'destroy', @remove, @

  render: ->
    @checked = if @model.get('done') then 'checked' else ''
    $(@el).html(@template(task: @model, checked: @checked)).toggleClass('done', @model.get('done'))
    @

  toggleDone: ->
    @model.toggle()


  editTask: () ->
    $(@el).find('input#edit-task').addClass('edit').focus().select()
    $(@el).find('#view').addClass('editing')

  close: (e) ->
    e.preventDefault()
    @input = $(@el).find('input#edit-task')

    if @input.val() != ''
      @model.save title: @input.val()
      @input.removeClass('edit')
      $(@el).find('#view').removeClass('editing')
    else
      $(@el).find('form').addClass('has-error')


  updateOnEnter: (e) ->
    @close(e) if e.keyCode == 13

  deleteTask: ->
    @model.destroy()

