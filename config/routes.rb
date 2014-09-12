Rails.application.routes.draw do

  scope 'api' do
    resources :todolists, :tasks
  end

  devise_for :users
  resources :users

  root to: 'static_pages#home'
end
