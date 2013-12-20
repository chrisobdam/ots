Ots::Application.routes.draw do
  namespace :api do
    resources :assign, only: [:create]
  end
end
