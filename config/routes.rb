Rails.application.routes.draw do
  get 'tags/new'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root  to: 'ads#index'
  resources :users
  resources :ads do
    resources :pictures, :only => [:create, :destroy]
  end
  resources :tags
  namespace :admin do
    resources :ads
  end
end


