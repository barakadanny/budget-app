Rails.application.routes.draw do
  devise_for :users
  resources :groups, only:[:new, :create, :show]
  # Defines the root path route ("/")
  get '/groups', to: 'groups#index'
  root "groups#index"
end
