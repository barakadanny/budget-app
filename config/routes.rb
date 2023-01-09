Rails.application.routes.draw do
  resources :groups, only:[:new]
  # Defines the root path route ("/")
  root "groups#index"
end
