Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root  to: 'static_pages#home'
  resources :users
  resources :ads

end


