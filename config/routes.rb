Rails.application.routes.draw do
  resources :groups, only:[:new, :create, :show]
  # Defines the root path route ("/")
  get '/groups', to: 'groups#index'
  root "groups#index"
end
