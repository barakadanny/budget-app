Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :transactions, only: [:new, :create, :index, :show]
  resources :groups, only:[:new, :create, :show, :index] do
    resources :transactions, only:[:new, :create, :show, :index]
  end
  root "groups#index"
end
