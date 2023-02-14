Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users
  resources :welcome, only: [:index]
  resources :users, only: [:index]
  resources :categories do
    resources :categories, only: [:index, :new, :create, :show]
    resources :payments, only: [:index]
  end
end
