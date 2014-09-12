class App.Collections.Todolists extends Backbone.Collection

  model: App.Models.Todolist
  url: '/api/todolists'
