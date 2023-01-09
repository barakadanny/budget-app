Rails.application.routes.draw do
  resources :groups, only:[create]
  # Defines the root path route ("/")
  root "groups#index"
end
