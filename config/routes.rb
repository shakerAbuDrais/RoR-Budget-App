Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  resources :welcome, only: [:index]
  resources :users, only: [:index]
  resources :categories do
    resources :payments, only: %i[index new create show]
  end
end
