Ots::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :tasks, constraints: {id: /.*/} do
      resources :assignees, only: :show
    end
  end
  root to: "users#show"
  
  namespace :api do
    resources :users, only: [:show]
    resources :tasks, only: [:show]
    resources :assign, only: [:create]
  end
  
  get '.well-known/host-meta' => "webfinger#host_meta"
end