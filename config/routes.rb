Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root  to: 'ads#index'
  resources :users
  resources :ads


end


