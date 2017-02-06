Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'
  resources :categories, param: :slug
  resources :products, param: :slug
  resources :stockists, param: :slug
end
