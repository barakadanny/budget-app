Rails.application.routes.draw do
  resources :groups, only:[:new, :create, :show]
  # Defines the root path route ("/")
  root "groups#index"
end
