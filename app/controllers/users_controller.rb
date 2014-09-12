class UsersController < ApplicationController
  respond_to :json

  def new
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end
end
