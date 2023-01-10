Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :groups, only:[:new, :create, :show] do
    resources :transactions, only:[:new, :create, :show, :index]
  end
  # Defines the root path route ("/")
  get '/groups', to: 'groups#index'
  root "groups#index"
end
