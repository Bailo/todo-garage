class TodolistsController < ApplicationController
  respond_to :json

  def index
    respond_with Todolist.all
  end

  def show
    respond_with Todolist.find(params[:id])
  end

  def create
    respond_with Todolist.create(todolist_params)
  end

  def update
    respond_with Todolist.update(params[:id], todolist_params)  #todolist_params
  end

  def destroy
    respond_with Todolist.destroy(params[:id])
  end

  private

  def todolist_params
    params.require(:todolist).permit(:title)
  end

end
