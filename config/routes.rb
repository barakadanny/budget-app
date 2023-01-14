Rails.application.routes.draw do
  resources :categories, only:[:new, :create, :index]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :transactions, only: [:new, :create, :index]
  resources :groups, only:[:new, :create, :index] do
    resources :transactions, only:[:new, :create, :index]
  end
  root "groups#index"
end
