Ots::Application.routes.draw do
  namespace :api do
    resources :users, only: [:show]
    resources :tasks, only: [:show]
    resources :assign, only: [:create]
  end
end
