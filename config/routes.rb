Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'pages#index'
  resources :categories, param: :slug
  resources :products, param: :slug
  resources :stockists, param: :slug

  post '/products/:slug', to: 'products#option_change'
end
